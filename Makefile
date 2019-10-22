# the compiler: gcc for C program
CC = gcc

#compiler flags:
# -g adds debugging information to the executable file
# -Wall turns on most, but not all, compiler warnings
CFLAGS = -w -pg
DBGCFLAGS = -g -pg -w
# -lm links the math library
LIBS = -lm -lpthread -lz
OPTIMIZATION = -O3 -march=native
#sources
SOURCES = cluster.c options.c
NEEDLEMANWUNSCH = needleman_wunsch.c alignment.c alignment_scoring.c
OBJECTS = (SOURCES: .c = .o)
# the build target executable:
TARGET = cluster

all: $(TARGET)
$(TARGET): $(TARGET).c
	$(CC) $(CFLAGS) -o $(TARGET) $(NEEDLEMANWUNSCH) $(SOURCES) $(LIBS)
debug: $(TARGET).c
	$(CC) $(DBGCFLAGS) -o $(TARGET) $(NEEDLEMANWUNSCH) $(SOURCES) $(LIBS)

clean:
	$(RM) $(TARGET)

