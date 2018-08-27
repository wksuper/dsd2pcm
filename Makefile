TARGET=dsd2pcm
SRC_C=$(shell ls *.c)
SRC_CPP=$(shell ls *.cpp)
OBJS=$(patsubst %.c,%.o,$(SRC_C))
OBJS+=$(patsubst %.cpp,%.o,$(SRC_CPP))

%.o:%.c
	clang++ -c $< -o $@

%.o:%.cpp
	clang++ -c $< -o $@

$(TARGET):$(OBJS)
	clang++ $^ -o $@

clean:
	-rm -rf $(TARGET) $(TARGET).dSYM *.o

