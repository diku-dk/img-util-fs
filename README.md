# The ImgUtil library (img_util.dll)

<img src="images/turtle.png" border="2" width="250" align="right">

This library features a number of utility functions for drawing simple
2d graphics on a canvas, including features for loading and saving
images and for running simple user-interactive apps that display
images. The library, which is based on Mono and Gtk, is portable, in
the sense that applications built using the library can execute on
Linux, macOS, and Windows.

NOTICE: A mini-version of the library (with limited functionality) is
available in the `mini/` folder.

## The API

The library API is available in the file [img_util.fsi](img_util.fsi).

## Compilation and use using `make` on macOS

To compile and run an example program without using `make`, see the
below sections titled ''Compilation and use on macOS'', 'Compilation and use on Linux'', and
''Compilation and use on Windows 10''.

Under macOS, make sure you have the `mono-mdk` version of Mono installed:

    $ brew install mono-mdk

Also, ensure that you're accessing the correct version of Mono by
adding the following line to your `~/.bash_profile` file:

    export PATH="/Library/Frameworks/Mono.framework/Versions/Current/Commands:$PATH"

Make sure that your `PATH` environment variable is updated:

    $ . ~/.bash_profile

To build the `img_util.dll` resource, execute the following command
in the present directory:

    $ make img_util.dll

If you are not on macOS, you probably need to adjust the `Makefile` or
build the DLL without using `make`, as described below.

## Examples

<img src="images/applespiral.png" border="2" width="250" align="right">

A number of examples are available in the `examples` folder. To
compile the examples, execute the following commands:

    $ cd examples
	$ make all

Here is an overview of the examples.

### Sierpinski and Spiral

    $ make sierp.exe && mono sierp.exe
    $ make spiral.exe && mono spiral.exe

### Save png files

    $ make fig.exe && mono fig.exe

### Functional images

    $ make gui_wav.exe && mono gui_wav.exe

### Turtle graphics

    $ make turtle.exe && mono turtle.exe

## Compilation and use on macOS

#### Creating `img_util.dll`

First copy the two files `img_util.fsi` and `img_util.fs` to a local
directory. Then, in a terminal, execute the following command:

    $ fsharpc --nologo -I /Library/Frameworks/Mono.framework/Versions/Current/lib/mono/gtk-sharp-2.0 -r gdk-sharp.dll -r gtk-sharp.dll -a img_util.fsi img_util.fs

This command should produce the file `img_util.dll`, which should now
be available in the present directory.

#### Using `img_util.dll`

To compile and run the Spiral example, for example, place the files `img_util.dll` and `spiral.fs` in the same directory and execute the commands:

    $ fsharpc --nologo -r img_util.dll spiral.fs
    $ mono spiral.exe

The last command should launch a window showing a spiral (you may need
to hit Command-Tab a couple of times to select the newly opened
window).


## Compilation and use on Linux

#### Creating `img_util.dll`

Clone this repo to your computer and navigate into 'img-util-fs/', then write the following:

    $ make img_util.dll

This command should produce the file `img_util.dll`, which should now
be available in the 'img-util-fs' directory.

#### Using `img_util.dll`

To compile and run your program (eg. foo.fsx) place your file in the img-util-fs directory. Then write the following:

    $ make foo.exe
    $ mono foo.exe

The last command will run your program.

## Compilation and use on Windows 1X

On Windows (32-bit or 64-bit), ImgUtil works only with [32-bit
Mono](https://www.mono-project.com/download/stable/#download-win),
thus, you must install [32-bit
Mono](https://www.mono-project.com/download/stable/#download-win) on
your system if you have not already done so. It is safe to have both
the 64-bit version and the 32-bit version installed at the same time.

When installing the 32-bit version of mono, an application called "Open Mono x86 Command
Prompt" is installed as well, and, it is important that when using the
ImgUtil library, you are working from within this "Command Prompt"; it
takes care of setting the `PATH` environment variable properly.

#### Creating `img_util.dll`

From within the "Open Mono x86 Command Prompt", change directory to the
directory holding the `img-util-fs` content.

Now execute the following command:

    fsharpc --nologo -I "c:/Program Files (x86)/Mono/lib/gtk-sharp-2.0" -r gdk-sharp.dll -r gtk-sharp.dll -a img_util.fsi img_util.fs

The above command should create the file `img_util.dll`.

#### Using `img_util.dll`

To compile and run the Spiral example, for example, place the files
`img_util.dll` and `spiral.fs` in the same directory, for example by
copying `img_util.dll` to the folder `examples`:

    copy img_util.dll examples\
	cd examples

You should now be able to compile and run the Spiral example:

    fsharpc --nologo -r img_util.dll spiral.fs
    mono spiral.exe

The last command should launch a window showing a spiral.

## License

MIT license

## Copyright

Copyright 2018-2021 - Martin Elsman

## Contributions

The following individuals have contributed to the ImgUtil library:

- Mads Dyrvig Obitsø Thomsen
- Jan Rolandsen
