#_ posix.mak
# Build posix version of undead
# Needs Digital Mars D compiler to build, available free from:
# http://www.digitalmars.com/d/

DMD=dmd
DEL=rm
S=src/undead
O=obj
B=bin

TARGET=undead

DFLAGS=-g -Isrc/
LFLAGS=-L/map/co
#DFLAGS=
#LFLAGS=

.d.obj :
	$(DMD) -c $(DFLAGS) $*

SRC= $S/bitarray.d $S/cstream.d $S/date.d $S/datebase.d $S/dateparse.d \
	 $S/doformat.d $S/metastrings.d $S/regexp.d $S/signals.d \
	 $S/socketstream.d $S/stream.d $S/string.d $S/utf.d $S/xml.d \
	 $S/internal\file.d


SOURCE= $(SRC) win32.mak posix.mak LICENSE README.md dub.json

all: $B/$(TARGET).a

#################################################

$B/$(TARGET).a : $(SRC)
	$(DMD) -lib -of$B/$(TARGET).a $(SRC) $(DFLAGS)


unittest :
	$(DMD) -unittest -main -cov -of$O/unittest $(SRC) $(DFLAGS)
	$O/unittest


clean:
	$(DEL) $O/unittest *.lst


tolf:
	tolf $(SOURCE)


detab:
	detab $(SRC)


zip: detab tolf $(SOURCE)
	$(DEL) undead.zip
	zip undead $(SOURCE)

gitzip:
	git archive --format=zip HEAD > undead.zip


