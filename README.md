[![Actions Status](https://github.com/tbrowder/GraphicsMagickUtils/actions/workflows/test.yml/badge.svg)](https://github.com/tbrowder/GraphicsMagickUtils/actions)

NAME
====

**GraphicsMagickUtils** - Provides programs and functions for manipulating images

SYNOPSIS
========

```raku
use GraphicsMagickUtils;
```

DESCRIPTION
===========

**GraphicsMagickUtils** Uses the [http://graphicsmagick.org](http://graphicsmagick.org) suite of tools to provide command-line (CL) programs and functions for manipulating impages programmatically.

CL Programs
-----------

### **crop**

A program designed for processing images for display on a website. The program uses the *graphicsmagicks*' command-line program *gm* and its myriad of commands and options, all driven by Raku's *run* routine.

Its default action, given the name of an image file, is to determine:

  * The width and height of the image

  * The coordinates of the image's center

  * The best contrasting color for overlays

Then the program will overlay the image atop a white background with:

  * An 'x' at the center

  * A 100-pixel square border around the center

  * A '+' at each corner of the image

  * The coordinates of the center and each corner

  * The name of the image

  * The image's attributes 

The user can then view the converted image to fine-tune the desired center point of the 100-pixel border by rerunning the program with the desired X,Y coordinates entered with the `center` option and inspect those results, repeating as necessary, and possibly adding more options, until satisfied with the results.

At that point, the user can rerun the program and add the `crop` mode to CL to produce the desired cropped image with no overlays. The output image file, by default, will be named `image.ctr-100-pix-square` but may be changed by use of another option.

Planned features
----------------

  * Add more options to `crop`

  * Add more programs for other major image transformations or conversions

  * Save the last set of options used for each program and show them when arguments are entered. Then, if satisfied with the results, enter the image name with the `program` mode to get the resulting transformed image.

AUTHOR
======

Tom Browder <tbrowder@acm.org>

COPYRIGHT AND LICENSE
=====================

Copyright 2022 Tom Browder

This library is free software; you may redistribute it or modify it under the Artistic License 2.0.

