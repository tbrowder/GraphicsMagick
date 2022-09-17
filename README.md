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

**GraphicsMagickUtils** Uses the [https://graphicsmagick.org](https://graphicsmagick.org) suite of tools to provide command-line (CL) programs and functions for manipulating impages programmatically.

CL Programs
-----------

### **crop-pic**

A program designed for processing images for display on a website. The program uses the *graphicsmagicks*' command-line program *gm* and its myriad of commands and options, all driven by Raku's *run*.

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

AUTHOR
======

Tom Browder <tbrowder@acm.org>

COPYRIGHT AND LICENSE
=====================

Copyright 2022 Tom Browder

This library is free software; you may redistribute it or modify it under the Artistic License 2.0.

