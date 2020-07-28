### If you wish to use extra libraries (math.h for instance),
### add their flags here (-lm in our case) in the "LIBS" variable.

LIBS = -lm

###
CFLAGS  = -std=c11
CFLAGS += -g
CFLAGS += -Wall
CFLAGS += -Wextra
CFLAGS += -pedantic
### CFLAGS += -Werror
### CFLAGS += -Wmissing-declarations
CFLAGS += -DUNITY_SUPPORT_64

ASANFLAGS  = -fsanitize=address
ASANFLAGS += -fno-common
ASANFLAGS += -fno-omit-frame-pointer

challenge14: challenge14.out
	@./challenge14.out

memcheck_challenge14: challenge14.c
	@echo Compiling $@
	@$(CC) $(ASANFLAGS) $(CFLAGS) challenge14.c -o memcheck_challenge14.out $(LIBS)
	@./memcheck_challenge14.out
	@echo "Memory check passed"

challenge16: challenge16.out
	@./challenge16.out

memcheck_challenge16: challenge16.c
	@echo Compiling $@
	@$(CC) $(ASANFLAGS) $(CFLAGS) challenge16.c -o memcheck_challenge16.out $(LIBS)
	@./memcheck_challenge16.out
	@echo "Memory check passed"


clean:
	rm -rf *.o *.out *.out.dSYM

challenge14.out: challenge14.c
	@echo Compiling $@
	@$(CC) $(CFLAGS) challenge14.c -o challenge14.out $(LIBS)

challenge16.out: challenge16.c
	@echo Compiling $@
	@$(CC) $(CFLAGS) challenge16.c -o challenge16.out $(LIBS)
