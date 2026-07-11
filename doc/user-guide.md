# PixRAW

PixRAW is a simple and easy to use RAW photo viewer and culling software application that is open source, specifically for the Linux platform and aimed at hobbyist and enthusiast photographers.

The primary goal of PixRAW is to be very simple and easy to use by providing a very intuitive and user-friendly user interface that provides an excellent user experience right out of the box.

<img src="images/pixraw-highlighted.png" alt="PixRAW Grid View Layout" width="600">

## What is Photo Culling?
Photo culling is the process of sorting through a collection of photos to keep the best ones and remove duplicates, blurry shots, or unwanted images. It helps save time, reduce clutter, and leaves you with a polished selection of your strongest photos.

Photo culling software falls into two major categories: AI-powered platforms, which automate the detection of blurry images, duplicates, and closed eyes; and traditional/manual speed-viewers, which render raw files instantly so you can make your own selections without lag. PixRAW falls into this last category.

## Important PixRAW Concepts

PixRAW offers two view modes to help you work efficiently:
* **Grid View:** Displays all the photos in the folder in a grid layout.
* **Full Screen View:** Displays only one photo at a time for close inspection.

> **Tip:** You can quickly toggle between these views using the view toggle buttons.

<img src="images/pixraw-toggle-view-buttons.png" alt="PixRAW Toggle View Buttons" >

### Selected vs. Current Photo
PixRAW makes an important distinction between these two states:
* **Selected Photos:** These are the "keepers" you have chosen to copy or export.
* **Current Photo:** This is the photo you are actively looking at. In **Grid View**, it is highlighted in blue; in **Full Screen View**, it is the photo currently displayed on the screen.

## PixRAW Workflow

The basic workflow in PixRAW is as follows:

1. **Open a folder:** Select a folder containing your RAW photos. This can be on your local drive, an external hard drive, or a memory card (like an SD card) connected to your computer.
2. **Cull your shots:** Review the photos and select the ones you wish to keep.
3. **Export your keepers:** Copy the selected photos to a destination folder of your choice.

### 1. Open a Folder
When you launch PixRAW you are greeted with the home screen. It contains a single button that allows you to open a folder. Click on it an you are greeted with a standard Linux file / folder picker dialog box. Select the folder that contains your RAW photos.

<img src="images/pixraw-start-screen.png" alt="PixRAW Home Screen" width="600">

### 2. Cull Photos
Once you have opened a folder, all the RAW photos in that folder will be displayed in a grid view in PixRAW.

<img src="images/pixraw-gridview.png" alt="PixRAW Grid View Layout" width="600">

You can toggle photos by clicking on the little checkbox in the bottom left corner of each photo. 
You can select which photo is the currently highlighted photo with a single click on any photo in grid view, you can also use the left and right arrow keys.
You can toggle between grid view and full screen view by double-clicking on any photo at any time. 
In full screen view, you can use the left and right arrow keys to navigate between photos.

<img src="images/pixraw-full-screen.png" alt="PixRAW Full Screen Layout" width="600">

### 3. Copy Selected Photos
Once you have made your selections you are ready to copy them over to the folder of your choice.

Click on the copy button (only enabled when you have a photo selected).
<img src="images/pixraw-fcopy-button.png" alt="PixRAW Copy Button" >

This will bring up the copy dialog. 

<img src="images/pixraw-copy-start.png" alt="PixRAW Full Screen Layout" width="600">

Click on the folder icon button to select the destination folder. Once you have a destination selected you can click on the Copy button in the dialog to copy the files. A progress bar will indicate the progress.

<img src="images/pixraw-copy-end.png" alt="PixRAW Full Screen Layout" width="600">


## Keyboard Shortcuts
PixRAW makes navigating and selecting photos very easy and fast using some keyboard shortcuts:

* Enter key: toggles between grid view and full screen.
* Left and Right Arrow keys: Change the currently highlighted photo in gridview and navigate between photos in full screen view.
* Spacebar key: Select or deselect a "keeper" photo.