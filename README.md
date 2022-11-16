[![Actions Status](https://github.com/tbrowder/GraphicsMagick/actions/workflows/linux.yml/badge.svg)](https://github.com/tbrowder/GraphicsMagick/actions) [![Actions Status](https://github.com/tbrowder/GraphicsMagick/actions/workflows/macos.yml/badge.svg)](https://github.com/tbrowder/GraphicsMagick/actions) [![Actions Status](https://github.com/tbrowder/GraphicsMagick/actions/workflows/windows.yml/badge.svg)](https://github.com/tbrowder/GraphicsMagick/actions)

NAME
====

**GraphicsMagick** - Provides programs and functions for manipulating images

SYNOPSIS
========

```raku
use GraphicsMagick;
```

DESCRIPTION
===========

**GraphicsMagickUtils** Uses the [http://graphicsmagick.org](http://graphicsmagick.org) suite of tools to provide command-line (CL) programs and functions for manipulating images programmatically.

Your host computer **must** have the GraphicsMagic package, with its `gm` CL program already installed.

To install that package on a Debian host:

    $ sudo aptitude install graphicsmagick

CL Programs
-----------

### **photo**

A program designed for processing images for display on a website. The program uses the *graphicsmagick*'s command-line program *gm* and some of its myriad of commands and options, all driven by Raku's *run* routine.

Its default action, given the name of an image file, is to determine and display:

  * The width and height of the image and its creation time

The following tables show the currently planned modes and options and their implementation status.

<table class="pod-table">
<caption>Modes</caption>
<thead><tr>
<th>Mode</th> <th>Implemented?</th> <th>Notes</th>
</tr></thead>
<tbody>
<tr> <td>show</td> <td>Yes</td> <td></td> </tr> <tr> <td>show all</td> <td>Yes</td> <td>shows all known attributes</td> </tr> <tr> <td>*crop</td> <td>No</td> <td>shows input data</td> </tr> <tr> <td>execute</td> <td>No</td> <td>No X display required</td> </tr> <tr> <td>display</td> <td>No</td> <td>Requires an X window</td> </tr>
</tbody>
</table>

*Note: If an X display is available, the `crop` mode will also display the original image with an overlay of the crop selection.

<table class="pod-table">
<caption>Options</caption>
<thead><tr>
<th>Option</th> <th>Implemented?</th> <th>Notes</th>
</tr></thead>
<tbody>
<tr> <td>color</td> <td>Yes</td> <td>value is set</td> </tr> <tr> <td>border</td> <td>Yes</td> <td>value is set</td> </tr> <tr> <td>debug</td> <td>Yes</td> <td></td> </tr>
</tbody>
</table>

Other features are planned, PRs and feature requests are welcome.

Execute program `photo` with the `help` option to see how to use it:

    $ photo help

    Usage: photo image [mode] [options...][help]

    This program uses the 'GraphicsMagick' library to manipulate
    an image for use on a photo montage website or a photo album.

    It can crop an image to a default 100x100 size about a selected 
    point. Dimensions and points are given in pixels: X=width, 
    Y=height.  The coordinate system used has its origin at the 
    top-left corner of the image with positive values increasing to 
    the right and down.

    Output images are written to the local directory unless the 
    'to=X' option is use.

    Modes:
      display      - With an X display, shows the raw image
      show         - Shows primary image attributes
      show all     - Shows all available attibutes
      crop=WxH+X+Y - Crops the image to WxH pixels centered at X and 
                     Y of the image. If the width and height are not 
                     specified, they default to 100 pixels. If the X 
                     and Y are not specified, they default to the 
                     center of the image. If one of either pair of 
                     values are specified, it is assumed to be the 
                     value of both. If only one value is entered, 
                     all four arguments take that value.

                     If an X display is available, shows a copy of 
                     the original with a border superimposed upon 
                     the selected crop area of the picture.
      execute      - Executes the crop to produce a new image with 
                     the current set of crop parameters

    Options:
      color=X    - Changes the border color to X [default: white]
      border=X   - Changes the border with to X pixels [default: 2]
      to=X       - Output directory [default: '.']
      name=X     - Output image name [default: '$image.mod']
      debug      - Developer use

Note 14 photos of human faces are available in the `resources/images` directory of the distribution. They were all obtained from the Debian `/use/share` directory and are free to use for any purpose. They are useful for experimenting with this module and its programs.

AUTHOR
======

Tom Browder <tbrowder@acm.org>

COPYRIGHT AND LICENSE
=====================

© 2022 Tom Browder

This library is free software; you may redistribute it or modify it under the Artistic License 2.0.

