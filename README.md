# PixRAW

PixRAW is a simple and easy to use RAW photo viewer and culling desktop application that is open source, specifically for the Linux platform and aimed at hobbyist and enthusiast photographers.

<img src="doc/images/pixraw-highlighted.png" alt="PixRAW Grid View Layout" width="600">

## Table of Contents
- [PixRAW](#pixraw)
  - [Table of Contents](#table-of-contents)
  - [About The Project](#about-the-project)
    - [Key Features](#key-features)
    - [The Philosophy](#the-philosophy)
    - [Built With](#built-with)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
      - [Fedora / RHEL / CentOS](#fedora--rhel--centos)
      - [Ubuntu / Debian / Mint](#ubuntu--debian--mint)
    - [Installation](#installation)
  - [Usage](#usage)
  - [FAQ](#faq)
    - [Are there RPM or DEB packages available for PixRAW?](#are-there-rpm-or-deb-packages-available-for-pixraw)
    - [Is PixRAW available as a Snap package or Flatpak?](#is-pixraw-available-as-a-snap-package-or-flatpak)
  - [Roadmap](#roadmap)
  - [Contributing](#contributing)
  - [License](#license)
  - [Acknowledgments](#acknowledgments)
  - [Limitation of Liability](#limitation-of-liability)

## About The Project

### Key Features

*   **Zero-Config Workflow:** No databases, no catalog importing, and no metadata syncing. Simply open a folder on your drive or SD card and start culling immediately.
*   **Broad Camera Support:** Built-in compatibility with RAW files from a wide variety of camera manufacturers.
*   **Clean and Modern UI:** A beautiful, minimal layout designed to keep your focus entirely on the image.

### The Philosophy

The primary goal of PixRAW is to be very simple and easy to use by providing a very intuitive and user-friendly user interface that provides an excellent user experience right out of the box.

While existing Linux photography tools are incredibly powerful, they often suffer from **feature bloat and a steep learning curve**. Hobbyists rarely shoot 4,000 photos a weekend like wedding professionals do, meaning they don't need complex batch automation or bloated catalogs.

Photo culling software generally falls into two categories: automated AI platforms and traditional speed-viewers. **PixRAW is a manual speed-viewer.** It renders RAW files instantly so you can make your own creative selections without lag, clutter, or setup time.

### Built With

* Built on Fedora Linux 44
* Flutter 3.44.5
* LibRaw 0.22.1

## Getting Started

### Prerequisites

### Installation

1. Unpack the distribution archive you downloaded to the directory of your choice
```
tar -xzf pixraw-1.0.0.tar.gz
```

2. CD into the newly created pixraw-1.0.0 directory
```
cd pixraw-1.0.0
```

3. Run the binary program
```
./pixraw
```

## Usage

See the [User Guide](doc/user-guide.md) for detailed usage information.

## FAQ

### Are there RPM or DEB packages available for PixRAW?

Not at this stage, although we are keen to do this so it is on our roadmap.

### Is PixRAW available as a Snap package or Flatpak?

Not yet but we are actively working on this as a high priority.

## Roadmap

See the [open issues](https://github.com/trevorcharlesmiller/pixraw/issues) for a full list of proposed features (and known issues).

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

Please note that excessively large pull requests will be declined automatically, this is especially true in the case of A.I. generated code. I simply do not have the time to go through and review very large pull requests.

## License

Distributed under the MIT License. See `LICENSE` for more information.

## Acknowledgments

PixRAW is made possible thanks to the incredible work of the open-source photography community:

*   **LibRaw:** Provides the robust engine for reading RAW files. Copyright © 2008-2026 LibRaw LLC.
*   **dcraw.c:** LibRaw utilizes core code from Dave Coffin's `dcraw.c` utility (without RESTRICTED/GPL2 code). Copyright © 1997-2018 Dave Coffin.
*   **DCB Demosaic:** LibRaw utilizes DCB demosaic code by Jacek Gozdz. Distributed under the BSD license. Copyright © 2010 Jacek Gozdz.
*   **X3F Tools:** LibRaw utilizes Roland Karlsson's X3F tools source code. Distributed under the BSD license. Copyright © 2010 Roland Karlsson.

## Limitation of Liability

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
