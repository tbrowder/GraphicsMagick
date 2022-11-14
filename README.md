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

  * The width and height of the image

  * The coordinates of the image's center

The following tables show the currently planned modes and options and their implementation status.

<table class="pod-table">
<caption>Modes</caption>
<thead><tr>
<th>Mode</th> <th>Implemented?</th> <th>Notes</th>
</tr></thead>
<tbody>
<tr> <td>show</td> <td>Yes</td> <td></td> </tr> <tr> <td>show all</td> <td>Yes</td> <td></td> </tr> <tr> <td>prep</td> <td>No</td> <td>shows input data</td> </tr> <tr> <td>crop</td> <td>No</td> <td>shows input data</td> </tr> <tr> <td>display</td> <td>No</td> <td>Requires an X window</td> </tr>
</tbody>
</table>

<table class="pod-table">
<caption>Options</caption>
<thead><tr>
<th>Optiom</th> <th>Implemented?</th> <th>Notes</th>
</tr></thead>
<tbody>
<tr> <td>color</td> <td>Yes</td> <td></td> </tr> <tr> <td>border</td> <td>Yes</td> <td></td> </tr> <tr> <td>debug</td> <td>Yes</td> <td></td> </tr>
</tbody>
</table>

Other features are planned, PRs and feature requests are welcome.

Execute program `photo` with the `help` option to see how to use it:

    $ photo help

    Usage: photo image [mode] [options...][help]

    This program uses the 'GraphicsMagick' library to manipulate
    an image for use on a photo montage website or a photo album.

    It can crop an image to a default 100x100 size about a selected 
    point. Dimensions and points are given in pixels: X=width, Y=height.
    The coordinate system used has its origin at the top-left corner of
    the image with positive values increasing to the right and down.

    Modes:
      show         - Shows primary image attributes
      ahow all     - Shows all available attibutes
      prep         - Shows the image dimensions in pixels along with other
                     details based on selected options and values, including 
                     a copy of the original with a border superimposed upon 
                     the selected interior of the picture.
      crop=WxH+X+Y - Crops the image to WxH pixels centered at X and Y of the 
                     image. If the width and height are not specified, they 
                     default to 100 pixels. If the X and Y are not specified,
                     they default to the center of the image. If one of either 
                     pair of values are specified, it is assumed to be the 
                     value of both. If only one value is entered, all four 
                     arguments take that value.

    Options:
      color=X    - Changes the border color to X [default: white]
      border=X   - Changes the border with to X pixels [default: 2]
      debug      - Developer use

Note 14 photos of human faces are available in the `resources/images` directory of the distribution. They were all obtained from the Debian `/use/share` directory and are free to use for any purpose. They are useful for experimenting with this module and its programs.

AUTHOR
======

Tom Browder <tbrowder@acm.org>

COPYRIGHT AND LICENSE
=====================

© 2022 Tom Browder

This library is free software; you may redistribute it or modify it under the Artistic License 2.0.

