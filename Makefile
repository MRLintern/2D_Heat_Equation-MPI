CC=mpicc
CCFLAGS=-O3 -Wall 
LDFLAGS=
LIBS=-lm

EXE=main_heat
OBJS=driver.o setup.o utilities.o io.o main.o

all: $(EXE)

driver.o: driver.c heat.h
utilities.o: utilities.c heat.h
setup.o: setup.c heat.h
io.o: io.c heat.h
main.o: main.c heat.h


$(OBJS): C_COMPILER := $(CC)

$(EXE): $(OBJS) $(OBJS_PNG)
	$(CC) $(CCFLAGS) $(OBJS) -o $@ $(LDFLAGS) $(LIBS)

%.o: %.c
	$(C_COMPILER) $(CCFLAGS) -c $< -o $@

.PHONY: clean
clean:
	-/bin/rm -f $(EXE) a.out *.o *~

