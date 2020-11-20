# Detect os to set $INCL correctly
UNAME_S := $(shell uname -s)
ifneq (,$(wildcard /etc/arch-release))
    INCL=-I /usr/lib/mono/gtk-sharp-2.0
else ifeq ($(UNAME_S),Linux)
    INCL=-I /usr/lib/cli/gtk-sharp-2.0 -I /usr/lib/cli/gdk-sharp-2.0 -I /usr/lib/cli/glib-sharp-2.0 -I /usr/lib/cli/gtk-dotnet-2.0 -I /usr/lib/cli/atk-sharp-2.0
else ifeq ($(UNAME_S),Darwin)
    INCL=-I /Library/Frameworks/Mono.framework/Versions/Current/lib/mono/gtk-sharp-2.0
endif

FSC=fsharpc --nologo
GTKDLLS=-r gdk-sharp.dll -r gtk-sharp.dll

.PHONY: all
all: img_util.dll

.PHONY: examples
examples:
	$(MAKE) -C examples all

.PHONY: clean
clean:
	rm -rf *~ *.exe *.png *.dll
	$(MAKE) -C examples clean

img_util.dll: img_util.fsi img_util.fs
	$(FSC) $(INCL) $(GTKDLLS) -a $^

%.exe: img_util.dll %.fsx
	$(FSC) $(INCL) $(GTKDLLS) -r $^
