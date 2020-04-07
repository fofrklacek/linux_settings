BIN_PATH := bin
BIN_NAME := "executable.out"
BUILD_PATH := build
SRC_PATH := src

RM := rm
CXX := g++

CXXFLAGS := -Wall -pedantic -g 
INCLUDES := 

OBJECTS = $(SOURCES:$(SRC_PATH)/%.cpp=$(BUILD_PATH)/%.o)

SOURCES = $(shell find $(SRC_PATH) -name '*.cpp' -printf '%T@\t%p\n' | sort -k 1nr | cut -f2-)

#############################

.DEFAULT_GOAL := all

# Main rule, checks the executable and symlinks to the output
all: $(BIN_PATH) $(BUILD_PATH) $(BIN_PATH)/$(BIN_NAME)

# Link the executable
$(BIN_PATH)/$(BIN_NAME): $(OBJECTS)
	@echo "Linking: $@"
	$(CXX) $(OBJECTS) $(LDFLAGS) -o $@

$(BUILD_PATH)/%.o: $(SRC_PATH)/%.cpp
	@echo "Compiling: $< -> $@"
	$(CXX) $(CXXFLAGS) $(INCLUDES) -MP -MMD -c $< -o $@

clean:
	@echo "Deleting directories"
	@$(RM) -r $(BUILD_PATH)
	@$(RM) -r $(BIN_PATH)

$(BIN_PATH):
	@echo "Creating $@/ directory"
	@mkdir "$@"

$(BUILD_PATH):
	@echo "Creating $@/ directory"
	@mkdir "$@"
