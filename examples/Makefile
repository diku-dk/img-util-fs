
FSC=fsharpc --nologo
#macOS:
#INCL=-I /Library/Frameworks/Mono.framework/Versions/Current/lib/mono/gtk-sharp-2.0
#Linux:
INCL=-I /usr/lib/cli/gtk-sharp-2.0 -I /usr/lib/cli/gdk-sharp-2.0 -I /usr/lib/cli/glib-sharp-2.0 -I /usr/lib/cli/gtk-dotnet-2.0 -I /usr/lib/cli/atk-sharp-2.0
GTKDLLS=-r gdk-sharp.dll -r gtk-sharp.dll

.PHONY: all
all: sierp.exe spiral.exe fig.exe gui_wav.exe turtle.exe show_pic.exe sierpinski.exe

.PHONY: clean
clean:
	rm -rf *~ *.exe *.png *.dll

img_util.dll: ../img_util.fsi ../img_util.fs
	$(MAKE) -C .. img_util.dll
	cp -p ../$@ $@

fun_img.dll: fun_img.fsi fun_img.fs img_util.dll
	$(FSC) $(INCL) $(GTKDLLS) -a -r img_util.dll fun_img.fsi fun_img.fs

%.exe: img_util.dll %.fs
	$(FSC) $(INCL) $(GTKDLLS) -r $^

gui_wav.exe: gui_wav.fs img_util.dll fun_img.dll
	$(FSC) $(INCL) $(GTKDLLS) -r img_util.dll -r fun_img.dll $<
