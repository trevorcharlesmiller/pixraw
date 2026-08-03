import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pixraw/model/raw_photos.dart';
import 'package:pixraw/state/app_config_notifier.dart';
import 'package:pixraw/state/raw_photos_notifier.dart';
import 'package:pixraw/ui/dialog/setup_wizard_dialog.dart';
import 'package:pixraw/ui/widgets/info/info_panel.dart';
import 'package:pixraw/ui/widgets/single_photo_view.dart';
import 'package:pixraw/ui/widgets/status_bar.dart';
import 'package:pixraw/ui/widgets/tool_bar.dart';
import 'package:pixraw/util/rating_color.dart';
import 'package:window_manager/window_manager.dart';

import 'ui/intents.dart';
import 'ui/widgets/lazy_thumbnail_card.dart';

class MainWindow extends ConsumerStatefulWidget {
  const MainWindow({super.key});

  @override
  ConsumerState<MainWindow> createState() => _MainWindowState();
}

class _MainWindowState extends ConsumerState<MainWindow> with WindowListener {
  static const appName = 'PixRAW';

  int _currentCrossAxisCount = 6;
  final ScrollController _gridScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);

    final config = ref.watch(appConfigProvider);
    if(config.isFirstRun) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showSetupWizardDialog(context);
      });
    }

  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    _gridScrollController.dispose();
    super.dispose();
  }

  void _selectPrevious() {
    if (ref.read(rawPhotosProvider.notifier).selectPrevious()) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToSelected());
    }
  }

  void _selectNext() {
    if (ref.read(rawPhotosProvider.notifier).selectNext()) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToSelected());
    }
  }

  void _toggleGridView() {
    if (ref.read(rawPhotosProvider).rawPhotoPaths.isNotEmpty) {
      ref.read(appConfigProvider.notifier).toggleGridView();
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToSelected());
    }
  }

  void _toggleSelectedPhoto() {
    ref.read(rawPhotosProvider.notifier).toggleCurrentPhotoSelected();
  }
  void _toggleRejectedPhoto() {
    ref.read(rawPhotosProvider.notifier).toggleCurrentPhotoRejected();
  }

  Future<String?> getInitialDir() async {
    final config = ref.watch(appConfigProvider);
    Directory? dir;
    if (config.sourceDirectory != null) {
      dir = Directory(config.sourceDirectory!);
      if (await dir.exists()) {
        return dir.absolute.path;
      }
    }

    return null;
  }

  Future<void> selectFolder() async {
    String? selectedDirectory = await FilePicker.getDirectoryPath(
      dialogTitle: 'Open Folder',
      initialDirectory: await getInitialDir(),
    );

    if (selectedDirectory != null) {
      final selectedDir = Directory(selectedDirectory);
      ref
          .read(appConfigProvider.notifier)
          .setSourceDirectory(selectedDirectory);
      await ref
          .read(rawPhotosProvider.notifier)
          .setSelectedDirectory(selectedDir);
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToSelected());
      await windowManager.setTitle("$appName - $selectedDirectory");
    }
  }

  @override
  Widget build(BuildContext context) {
    RawPhotos rawPhotos = ref.watch(rawPhotosProvider);
    final config = ref.watch(appConfigProvider);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ToolBar(onSelectFolder: selectFolder, toggleGridView: _toggleGridView,),

            //=================================================================================[Main View]
            Expanded(child: Row(
              children: [
                Expanded(
                  child: (rawPhotos.directory == null || rawPhotos.rawPhotoPaths.isEmpty)
                      ? _buildEmptyState() // Shown when app opens
                      : _buildMainView(),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  width: config.isPanelOpen ? 300 : 0,
                  //color: Colors.blueGrey[900],
                  //clipBehavior: Clip.hardEdge,
                  child: SizedBox(
                    width: 300,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      child: InfoPanel(),
                    ),
                  ),
                ),
              ],
            ),),

            StatusBar(),
          ],
        ),
      ),
    );
  }

  Future<void> _showSetupWizardDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SetupWizardDialog();
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: ElevatedButton.icon(
        onPressed: selectFolder,
        icon: const Icon(Icons.folder_open, size: 24),
        label: const Text(
          'Open Folder',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }

  Widget _buildMainView() {
    final config = ref.watch(appConfigProvider);
    return FocusableActionDetector(
      autofocus: true, // Grabs focus initially so arrows work right away
      shortcuts: const <ShortcutActivator, Intent>{
        SingleActivator(LogicalKeyboardKey.arrowLeft): MoveLeftIntent(),
        SingleActivator(LogicalKeyboardKey.arrowRight): MoveRightIntent(),
        SingleActivator(LogicalKeyboardKey.enter): ToggleViewIntent(),
        SingleActivator(LogicalKeyboardKey.space): ToggleSelectedIntent(),
        SingleActivator(LogicalKeyboardKey.arrowUp): DoNothingIntent2(),
        SingleActivator(LogicalKeyboardKey.arrowDown): DoNothingIntent2(),
        SingleActivator(LogicalKeyboardKey.digit0): Rating0Intent(),
        SingleActivator(LogicalKeyboardKey.digit1): Rating1Intent(),
        SingleActivator(LogicalKeyboardKey.digit2): Rating2Intent(),
        SingleActivator(LogicalKeyboardKey.digit3): Rating3Intent(),
        SingleActivator(LogicalKeyboardKey.digit4): Rating4Intent(),
        SingleActivator(LogicalKeyboardKey.digit5): Rating5Intent(),
        SingleActivator(LogicalKeyboardKey.keyR): ColorRedIntent(),
        SingleActivator(LogicalKeyboardKey.keyG): ColorGreenIntent(),
        SingleActivator(LogicalKeyboardKey.keyB): ColorBlueIntent(),
        SingleActivator(LogicalKeyboardKey.keyY): ColorYellowIntent(),
        SingleActivator(LogicalKeyboardKey.keyP): ColorPurpleIntent(),
        SingleActivator(LogicalKeyboardKey.keyC): ColorClearIntent(),
        SingleActivator(LogicalKeyboardKey.keyX): ToggleRejectedIntent(),
      },
      actions: <Type, Action<Intent>>{
        // Define what happens when the intents are triggered
        MoveLeftIntent: CallbackAction<MoveLeftIntent>(
          onInvoke: (_) => _selectPrevious(),
        ),
        MoveRightIntent: CallbackAction<MoveRightIntent>(
          onInvoke: (_) => _selectNext(),
        ),
        ToggleViewIntent: CallbackAction<ToggleViewIntent>(
          onInvoke: (_) => _toggleGridView(),
        ),
        ToggleSelectedIntent: CallbackAction<ToggleSelectedIntent>(
          onInvoke: (_) => _toggleSelectedPhoto(),
        ),
        ToggleRejectedIntent: CallbackAction<ToggleRejectedIntent>(
          onInvoke: (_) => _toggleRejectedPhoto(),
        ),
        DoNothingIntent2: CallbackAction<DoNothingIntent2>(onInvoke: (_) {return null;},),
        Rating0Intent: CallbackAction<Rating0Intent>(
          onInvoke: (_) => ref.read(rawPhotosProvider.notifier).setRating(0),
        ),
        Rating1Intent: CallbackAction<Rating1Intent>(
          onInvoke: (_) => ref.read(rawPhotosProvider.notifier).setRating(1),
        ),
        Rating2Intent: CallbackAction<Rating2Intent>(
          onInvoke: (_) => ref.read(rawPhotosProvider.notifier).setRating(2),
        ),
        Rating3Intent: CallbackAction<Rating3Intent>(
          onInvoke: (_) => ref.read(rawPhotosProvider.notifier).setRating(3),
        ),
        Rating4Intent: CallbackAction<Rating4Intent>(
          onInvoke: (_) => ref.read(rawPhotosProvider.notifier).setRating(4),
        ),
        Rating5Intent: CallbackAction<Rating5Intent>(
          onInvoke: (_) => ref.read(rawPhotosProvider.notifier).setRating(5),
        ),

        ColorRedIntent: CallbackAction<ColorRedIntent>(
          onInvoke: (_) => ref.read(rawPhotosProvider.notifier).setColor(RatingColor.Red),
        ),
        ColorGreenIntent: CallbackAction<ColorGreenIntent>(
          onInvoke: (_) => ref.read(rawPhotosProvider.notifier).setColor(RatingColor.Green),
        ),
        ColorBlueIntent: CallbackAction<ColorBlueIntent>(
          onInvoke: (_) => ref.read(rawPhotosProvider.notifier).setColor(RatingColor.Blue),
        ),
        ColorYellowIntent: CallbackAction<ColorYellowIntent>(
          onInvoke: (_) => ref.read(rawPhotosProvider.notifier).setColor(RatingColor.Yellow),
        ),
        ColorPurpleIntent: CallbackAction<ColorPurpleIntent>(
          onInvoke: (_) => ref.read(rawPhotosProvider.notifier).setColor(RatingColor.Purple),
        ),
        ColorClearIntent: CallbackAction<ColorClearIntent>(
          onInvoke: (_) => ref.read(rawPhotosProvider.notifier).setColor(null),
        ),
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 50),
        child: config.isGridView ? _buildPhotoGrid() : SinglePhotoView(toggleGridView: _toggleGridView,),
      ),
    );
  }

  // Your optimized lazy-loading photo grid
  Widget _buildPhotoGrid() {
    RawPhotos rawPhotos = ref.read(rawPhotosProvider);
    return LayoutBuilder(
      builder: (context, constraints) {
        final int crossAxisCount = (constraints.maxWidth / 250).floor().clamp(
          1,
          999,
        );
        if (_currentCrossAxisCount != crossAxisCount) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _currentCrossAxisCount = crossAxisCount;
          });
        }

        return GridView.builder(
          key: const ValueKey('photo_grid'),
          controller: _gridScrollController,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: rawPhotos.rawPhotoPaths.length,
          itemBuilder: (context, index) {
            // GridView.builder lazily instantiates this widget ONLY when visible
            return LazyThumbnailCard(
              index: index,
              rawPhoto: rawPhotos.rawPhotoPaths[index],
              highlighted: index == rawPhotos.currentPhoto,
              onRatingChanged: (int? rating) {
                ref.read(rawPhotosProvider.notifier).setRating(rating, index: index);
              },
              onColorChanged: (RatingColor? color) {
                ref.read(rawPhotosProvider.notifier).setColor(color, index: index);
              },
              onTap: () {
                ref.read(rawPhotosProvider.notifier).setSelectedPhoto(index);
              },
              onDoubleTap: () {
                ref.read(rawPhotosProvider.notifier).setSelectedPhoto(index);
                _toggleGridView();
              },
            );
          },
        );
      },
    );
  }

  void _scrollToSelected() {
    final config = ref.watch(appConfigProvider);
    RawPhotos rawPhotos = ref.read(rawPhotosProvider);
    // Ensure the grid view is active and the controller is attached
    if (!_gridScrollController.hasClients || !config.isGridView) return;

    // 1. Get grid metrics from the controller
    final position = _gridScrollController.position;
    final viewportHeight = position.viewportDimension;
    final currentScrollOffset = position.pixels;

    // 2. Math to calculate card dimensions dynamically
    int crossAxisCount = _currentCrossAxisCount;
    const double spacing = 8.0;

    // Calculate width of one item based on total grid width
    final double gridWidth = position.context.storageContext.size!.width;
    final double itemWidth =
        (gridWidth - (spacing * (crossAxisCount - 1))) / crossAxisCount;

    // By default, a square delegate makes height equal to width
    final double itemHeight = itemWidth;
    final double rowHeight = itemHeight + spacing;

    // 3. Find target item's top and bottom position bounds
    final int currentRow = rawPhotos.currentPhoto ~/ crossAxisCount;
    final double itemTopY = currentRow * rowHeight;
    final double itemBottomY = itemTopY + itemHeight;

    // 4. Check boundaries and animate if necessary
    if (itemTopY < currentScrollOffset) {
      // Selection moved UP offscreen -> scroll up to align with the top of the row
      _gridScrollController.animateTo(
        itemTopY,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
      );
    } else if (itemBottomY > (currentScrollOffset + viewportHeight)) {
      // Selection moved DOWN offscreen -> scroll down to bring the row bottom into view
      _gridScrollController.animateTo(
        itemBottomY - viewportHeight,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void onWindowMaximize() {
    final notifier = ref.read(appConfigProvider.notifier);
    notifier.toggleFullScreen(true);
  }

  @override
  void onWindowUnmaximize() {
    final notifier = ref.read(appConfigProvider.notifier);
    notifier.toggleFullScreen(false);
  }
}
