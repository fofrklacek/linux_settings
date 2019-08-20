CXX=g++
LD=g++
CXXFLAGS=-Wall -fsanitize=address -pedantic -Wno-long-long -O0 -ggdb -std=c++11
BEFLAGS=-lncurses
EXECUTABLE=output
S_DIR=src
OUT=bin
BUILD=build
INCLUDE=include
SOURCES=main.cpp
USR_NAME=jizbarad


all: compile doc

run:
	@./$(USR_NAME)

clean:
	@echo "Cleaning folders" 
	@rm -rf $(USR_NAME) $(OUT) $(BUILD) doc	

compile: $(BUILD) $(OUT) $(OUT)/$(EXECUTABLE)
	@cp "$(OUT)/$(EXECUTABLE)" "$(USR_NAME)"

$(OUT)/$(EXECUTABLE) : $(BUILD)/COPY.o $(BUILD)/REMOVE.o $(BUILD)/TARGET.o $(BUILD)/REG_EXP.o $(BUILD)/CREATE.o $(BUILD)/MCLASS.o $(BUILD)/TOP.o $(BUILD)/BOTTOM.o $(BUILD)/LEFT.o $(BUILD)/RIGHT.o $(BUILD)/main.o 
	@echo "Creating $@"
	$(LD) $^ -o $@ $(BEFLAGS)

$(OUT):
	@echo "Creating $@"
	@mkdir -p "$@"

$(BUILD):
	@echo "Creating $@"
	@mkdir -p "$@"

$(BUILD)/%o:$(S_DIR)/%cpp
	@echo "Creating $@"
	$(CXX) $(CXXFLAGS) -c $< -o $@

doc:documentatdir 
	@echo "Creating documentation"
	@doxygen > doc/doc.log 2> doc/err_doc.log

documentatdir: 
	@mkdir -p doc

$(BUILD)/COPY.o:src/src/COPY.cpp src/include/COPY.h
$(BUILD)/REMOVE.o:src/src/REMOVE.cpp src/include/REMOVE.h
$(BUILD)/TARGET.o:src/include/TARGET.h src/src/TARGET.cpp
$(BUILD)/REG_EXP.o:src/src/REG_EXP.cpp src/include/REG_EXP.h
$(BUILD)/CREATE.o:src/src/CREATE.cpp src/include/CREATE.h
$(BUILD)/TOP.o:src/src/TOP.cpp src/include/TOP.h src/src/MCLASS.cpp src/include/MCLASS.h src/src/TARGET.cpp src/include/TARGET.h
$(BUILD)/LEFT.o:src/src/COPY.cpp src/include/COPY.h src/src/REMOVE.cpp src/include/REMOVE.h src/src/CREATE.cpp src/include/CREATE.h src/src/REG_EXP.cpp src/include/REG_EXP.h src/src/TARGET.cpp src/include/TARGET.h src/src/MCLASS.cpp src/include/MCLASS.h src/src/LEFT.cpp src/include/LEFT.h 
$(BUILD)/RIGHT.o:src/src/RIGHT.cpp src/include/RIGHT.h src/src/MCLASS.cpp src/include/MCLASS.h
$(BUILD)/BOTTOM.o:src/src/BOTTOM.cpp src/include/BOTTOM.h src/src/MCLASS.cpp src/include/MCLASS.h
$(BUILD)/MCLASS.o:src/include/TARGET.h src/src/TARGET.cpp src/src/MCLASS.cpp src/include/MCLASS.h
$(BUILD)/main.o:src/src/LEFT.cpp src/include/LEFT.h \
src/src/RIGHT.cpp src/include/RIGHT.h \
src/src/TOP.cpp src/include/TOP.h \
src/src/BOTTOM.cpp src/include/BOTTOM.h \
src/src/TARGET.cpp src/include/TARGET.h \
src/src/MCLASS.cpp src/include/MCLASS.h \
src/src/main.cpp \
src/src/COPY.cpp src/include/COPY.h \
src/src/REMOVE.cpp src/include/REMOVE.h \
src/src/CREATE.cpp src/include/CREATE.h \
src/src/REG_EXP.cpp src/include/REG_EXP.h 

.PHONY: all test clean
