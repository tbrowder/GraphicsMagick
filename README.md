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

### **photo** NYI

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

Execute program `photo` with the `help` option to see how to use it:

    $ photo help
    ...

Other features are planned, PRs and feature requests are welcome.

AUTHOR
======

Tom Browder <tbrowder@acm.org>

COPYRIGHT AND LICENSE
=====================

© 2022 Tom Browder

This library is free software; you may redistribute it or modify it under the Artistic License 2.0.

