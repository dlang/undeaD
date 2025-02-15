#_ win32.mak
# Build win32 version of undead
# Needs Digital Mars D compiler to build, available free from:
# http://www.digitalmars.com/d/

DMD=dmd
DEL=del
S=src\undead
O=obj
B=bin32omf

TARGET=undead

DFLAGS=-g -Isrc/ -m32omf
LFLAGS=-L/map/co
#DFLAGS=
#LFLAGS=

.d.obj :
	$(DMD) -c $(DFLAGS) $*

SRC= $S\bitarray.d $S\cstream.d $S\date.d $S\datebase.d $S\dateparse.d \
	 $S\doformat.d $S\metastrings.d $S\regexp.d $S\signals.d \
	 $S\socketstream.d $S\stream.d $S\string.d $S\utf.d $S\xml.d \
	 $S\internal\file.d

SOURCE= $(SRC) win32.mak win64.mak posix.mak LICENSE README.md dub.json

all: $B\$(TARGET).lib

#################################################

$B\$(TARGET).lib : $(SRC)
	$(DMD) -lib -of$B\$(TARGET).lib $(SRC) $(DFLAGS)


unittest :
	$(DMD) -unittest -main -cov -of$O\unittest.exe $(SRC) $(DFLAGS)
	$O\unittest.exe


clean:
	$(DEL) $O\unittest.exe *.lst


tolf:
	tolf $(SOURCE)


detab:
	detab $(SRC)


zip: detab tolf $(SOURCE)
	$(DEL) undead.zip
	zip32 undead $(SOURCE)
