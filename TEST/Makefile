#
# A simple Makefile
#

######

TEMPHOMEQ=$(TEMPTORY)

######

TEMPACC=$(TEMPHOMEQ)/bin/tempacc

######

all::
regress::
cleanall::

######

INCLUDE=./../..

######

all:: \
test00
test00: \
test00.dats ; \
$(TEMPACC) -O2 -DATS_MEMALLOC_LIBC -I$(INCLUDE) -o $@  $< -lcurl
#
regress:: test00 ; ./$<
cleanall:: ; $(RMF) test00
#
######
all:: \
test01
test01: \
test01.dats ; \
$(TEMPACC) -O2 -DATS_MEMALLOC_LIBC -I$(INCLUDE) -o $@  $< -lcurl
#
regress:: test01 ; ./$<
cleanall:: ; $(RMF) test01
#
######

testall:: all
testall:: regress
testall:: cleanall

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c
clean:: ; $(RMF) *_?ats.o

cleanall:: clean

###### end of [Makefile] ######
