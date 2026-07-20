import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pixraw/model/raw_photos.dart';
import 'package:pixraw/state/app_config_notifier.dart';
import 'package:pixraw/state/raw_photos_notifier.dart';
import 'package:pixraw/ui/dialog/settings_dialog.dart';
import 'package:pixraw/ui/widgets/raw_image.dart';
import 'package:pixraw/model/raw_photo.dart';
import 'package:pixraw/util/raw_utils.dart';
import 'package:window_manager/window_manager.dart';

import 'ui/dialog/about_dialog.dart';
import 'ui/dialog/copy_dialog.dart';
import 'ui/intents.dart';
import 'ui/widgets/lazy_thumbnail_card.dart';

class MainWindow extends ConsumerStatefulWidget {
  const MainWindow({super.key});

  @override
  ConsumerState<MainWindow> createState() => _MainWindowState();
}

class _MainWindowState extends ConsumerState<MainWindow> with WindowListener {
  static const appName = 'PixRAW';

  bool gridView = true;
  int _currentCrossAxisCount = 6;
  final ScrollController _gridScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
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
    if(ref.read(rawPhotosProvider).rawPhotoPaths.isNotEmpty) {
      setState(() {
        gridView = !gridView;
      });
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToSelected());
    }
  }

  void _toggleSelectedPhoto() {
    ref.read(rawPhotosProvider.notifier).toggleCurrentPhotoSelected();
  }

  Future<void> selectFolder() async {
    String? selectedDirectory = await FilePicker.getDirectoryPath();

    if (selectedDirectory != null) {
      final selectedDir = Directory(selectedDirectory);
      await ref.read(rawPhotosProvider.notifier).setSelectedDirectory(selectedDir);
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToSelected());
      await windowManager.setTitle("$appName - $selectedDirectory");
    }
  }

  @override
  Widget build(BuildContext context) {
    RawPhotos rawPhotos = ref.watch(rawPhotosProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: 'Open folder',
          icon: const Icon(Icons.folder_rounded),
          onPressed: selectFolder,
        ),
        title: Text(
          rawPhotos.directory?.absolute.path ?? appName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          if (rawPhotos.directory != null)
            IconButton(
              tooltip: 'Copy selected photos',
              icon: const Icon(Icons.file_copy_rounded),
              onPressed: rawPhotos.rawPhotoPaths.where((p) => p.selected).isEmpty ? null : () {
                _showCopyDialog(context);
              },
            ),

          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'App Settings',
            onPressed: () => _showSettingsDialog(context),
          ),
          IconButton(
            icon: const Icon(Icons.help),
            tooltip: 'About PixRAW',
            onPressed: () => _showAboutDialog(context),
          ),
        ],
      ),
      // 1. Wrap the changing area in an AnimatedSwitcher
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 100),
                switchInCurve: Curves.easeIn,
                switchOutCurve: Curves.easeOut,
                child: rawPhotos.directory == null
                    ? _buildEmptyState() // Shown when app opens
                    : _buildMainView(), // Shown once directory is selected
              ),
            ),
            SizedBox(
              height: 35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: gridView
                        ? const Icon(Icons.grid_view_rounded)
                        : const Icon(Icons.grid_view),
                    tooltip: 'Grid View',
                    iconSize: 15,
                    color: gridView
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.secondary,
                    onPressed: rawPhotos.directory == null || rawPhotos.rawPhotoPaths.isEmpty
                        ? null
                        : _toggleGridView,
                  ),
                  IconButton(
                    icon: gridView
                        ? const Icon(Icons.image_outlined)
                        : const Icon(Icons.image_rounded),
                    tooltip: 'Single Photo View',
                    iconSize: 15,
                    color: gridView
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.primary,
                    onPressed: rawPhotos.directory == null || rawPhotos.rawPhotoPaths.isEmpty
                        ? null
                        : _toggleGridView,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: rawPhotos.rawPhotoPaths.isEmpty
                        ? Text('0 photos')
                        : Text(
                            '${rawPhotos.currentPhoto + 1} of ${rawPhotos.rawPhotoPaths.length} photos',
                          ),
                  ),
                  Text(
                    '${rawPhotos.rawPhotoPaths.where((p) => p.selected).length} photos selected',
                  ),
                  IconButton(
                    icon: const Icon(Icons.library_add_check_rounded),
                    tooltip: 'Select all photos',
                    iconSize: 15,
                    onPressed: rawPhotos.rawPhotoPaths.isEmpty
                        ||  (rawPhotos.rawPhotoPaths.where((p) => p.selected).length == rawPhotos.rawPhotoPaths.length) ? null : (){
                      ref.read(rawPhotosProvider.notifier).selectAllPhotos();
                    }
                  ),
                  IconButton(
                      icon: const Icon(Icons.deselect),
                      tooltip: 'Clear selected photos',
                      iconSize: 15,
                      onPressed: rawPhotos.rawPhotoPaths.where((p) => p.selected).isEmpty ? null : (){
                        ref.read(rawPhotosProvider.notifier).unSelectAllPhotos();
                      }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showAboutDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return PRAboutDialog();
      },
    );
  }
  Future<void> _showSettingsDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return SettingsDialog();
      },
    );
  }

  Future<void> _showCopyDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CopyDialog(selectedPhotos: ref.read(rawPhotosProvider).rawPhotoPaths.where((p) => p.selected).toList(),);
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
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }

  Widget _buildMainView() {
    return FocusableActionDetector(
      autofocus: true, // Grabs focus initially so arrows work right away
      shortcuts: const <ShortcutActivator, Intent>{
        SingleActivator(LogicalKeyboardKey.arrowLeft): MoveLeftIntent(),
        SingleActivator(LogicalKeyboardKey.arrowRight): MoveRightIntent(),
        SingleActivator(LogicalKeyboardKey.enter): ToggleViewIntent(),
        SingleActivator(LogicalKeyboardKey.space): ToggleSelectedIntent(),
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
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: gridView ? _buildPhotoGrid() : _buildSinglePhotoView(),
      ),
    );
  }

  Widget _buildSinglePhotoView() {
    RawPhotos rawPhotos = ref.read(rawPhotosProvider);
    return Center(
      child: PRawImage(
        index: rawPhotos.currentPhoto,
        cacheWidth: MediaQuery.of(context).size.width.toInt(),
        onChanged: (bool? value) {
          _toggleSelectedPhoto();
        },
        onDoubleTap: () {
          _toggleGridView();
        },
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
              onChanged: (bool? value) {
                if (rawPhotos.currentPhoto != index) {
                  ref.read(rawPhotosProvider.notifier).setSelectedPhoto(index);
                }
                _toggleSelectedPhoto();
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
    RawPhotos rawPhotos = ref.read(rawPhotosProvider);
    // Ensure the grid view is active and the controller is attached
    if (!_gridScrollController.hasClients || !gridView) return;

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
