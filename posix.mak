#_ posix.mak
# Build posix version of undead
# Needs Digital Mars D compiler to build, available free from:
# http://www.digitalmars.com/d/

DC?=dmd
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
	$(DC) -c $(DFLAGS) $*

SRC= $S/bitarray.d $S/regexp.d $S/datebase.d $S/date.d $S/dateparse.d \
	 $S/cstream.d $S/stream.d $S/socketstream.d $S/doformat.d


SOURCE= $(SRC) win32.mak posix.mak LICENSE README.md dub.json

all: $B/$(TARGET).a

#################################################

$B/$(TARGET).a : $(SRC)
	$(DC) -lib -of$B/$(TARGET).a $(SRC) $(DFLAGS)


unittest :
	$(DC) -unittest -main -cov -of$O/unittest $(SRC) $(DFLAGS)
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
