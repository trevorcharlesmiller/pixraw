import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pixraw/raw_image.dart';
import 'package:pixraw/raw_photo.dart';
import 'package:window_manager/window_manager.dart';

import 'about_dialog.dart';
import 'copy_dialog.dart';
import 'intents.dart';
import 'lazy_thumbnail_card.dart';

class MainWindow extends StatefulWidget {
  const MainWindow({super.key});

  @override
  State<MainWindow> createState() => _MainWindowState();
}

class _MainWindowState extends State<MainWindow> {
  static const appName = 'PixRAW';
  static const rawExtensions = {
    '.cr2',
    '.cr3',
    '.nef',
    '.arw',
    '.dng',
    '.orf',
    '.rw2',
    '.pef',
    '.raf',
    '.gpr',
  };

  Directory? directory;
  List<RawPhoto> rawPhotoPaths = [];
  int currentSelection = 0;
  bool gridView = true;
  int _currentCrossAxisCount = 6;
  final ScrollController _gridScrollController = ScrollController();

  @override
  void dispose() {
    _gridScrollController.dispose();
    super.dispose();
  }

  void _selectPrevious() {
    if (currentSelection > 0) {
      setState(() {
        currentSelection--;
      });
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToSelected());
    }
  }

  void _selectNext() {
    if (currentSelection < rawPhotoPaths.length - 1) {
      setState(() {
        currentSelection++;
      });
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToSelected());
    }
  }

  void _toggleGridView() {
    if(rawPhotoPaths.isNotEmpty) {
      setState(() {
        gridView = !gridView;
      });
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToSelected());
    }
  }

  void _toggleSelectedPhoto() {
    if(rawPhotoPaths.isNotEmpty) {
      setState(() {
        final current = rawPhotoPaths[currentSelection];
        rawPhotoPaths[currentSelection] = current.copyWith(
          selected: !current.selected,
        );
      });
    }
  }

  Future<void> selectFolder() async {
    String? selectedDirectory = await FilePicker.getDirectoryPath();

    if (selectedDirectory != null) {
      final selectedDir = Directory(selectedDirectory);

      List<RawPhoto> paths = await selectedDir
          .list(recursive: false, followLinks: false)
          .where((entity) {
            if (entity is! File) return false;
            final ext = p.extension(entity.path).toLowerCase();
            return rawExtensions.contains(ext);
          })
          .map((file) => RawPhoto(filePath: file.path))
          .toList();

      setState(() {
        currentSelection = 0;
        directory = selectedDir;
        rawPhotoPaths = paths;
      });
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToSelected());
      await windowManager.setTitle("$appName - $selectedDirectory");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: 'Open folder',
          icon: const Icon(Icons.folder_rounded),
          onPressed: selectFolder,
        ),
        title: Text(
            directory?.absolute.path ?? appName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          if (directory != null)
            IconButton(
              tooltip: 'Copy selected photos',
              icon: const Icon(Icons.file_copy_rounded),
              onPressed: rawPhotoPaths.where((p) => p.selected).isEmpty ? null : () {
                _showCopyDialog(context);
              },
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
                child: directory == null
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
                    onPressed: directory == null || rawPhotoPaths.isEmpty
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
                    onPressed: directory == null || rawPhotoPaths.isEmpty
                        ? null
                        : _toggleGridView,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: rawPhotoPaths.isEmpty
                        ? Text('0 photos')
                        : Text(
                            '${currentSelection + 1} of ${rawPhotoPaths.length} photos',
                          ),
                  ),
                  Text(
                    '${rawPhotoPaths.where((p) => p.selected).length} photos selected',
                  ),
                  IconButton(
                    icon: const Icon(Icons.library_add_check_rounded),
                    tooltip: 'Select all photos',
                    iconSize: 15,
                    onPressed: rawPhotoPaths.isEmpty
                        ||  (rawPhotoPaths.where((p) => p.selected).length == rawPhotoPaths.length) ? null : (){
                      setState(() {
                        for(int i = 0; i < rawPhotoPaths.length; i++) {
                          final current = rawPhotoPaths[i];
                          rawPhotoPaths[i] = current.copyWith(
                            selected: true,
                          );
                        }
                      });
                    }
                  ),
                  IconButton(
                      icon: const Icon(Icons.deselect),
                      tooltip: 'Clear selected photos',
                      iconSize: 15,
                      onPressed: rawPhotoPaths.where((p) => p.selected).isEmpty ? null : (){
                        setState(() {
                          for(int i = 0; i < rawPhotoPaths.length; i++) {
                            final current = rawPhotoPaths[i];
                            rawPhotoPaths[i] = current.copyWith(
                              selected: false,
                            );
                          }
                        });
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

  Future<void> _showCopyDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CopyDialog(selectedPhotos: rawPhotoPaths.where((p) => p.selected).toList(),);
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
    return Center(
      child: PRawImage(
        rawPhoto: rawPhotoPaths[currentSelection],
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
          itemCount: rawPhotoPaths.length,
          itemBuilder: (context, index) {
            // GridView.builder lazily instantiates this widget ONLY when visible
            return LazyThumbnailCard(
              rawPhoto: rawPhotoPaths[index],
              highlighted: index == currentSelection,
              onChanged: (bool? value) {
                if (currentSelection != index) {
                  setState(() {
                    currentSelection = index;
                  });
                }
                _toggleSelectedPhoto();
              },
              onTap: () {
                setState(() {
                  currentSelection = index;
                });
              },
              onDoubleTap: () {
                setState(() {
                  currentSelection = index;
                });
                _toggleGridView();
              },
            );
          },
        );
      },
    );
  }

  void _scrollToSelected() {
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
    final int currentRow = currentSelection ~/ crossAxisCount;
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
}
