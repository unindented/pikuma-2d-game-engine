NAME = gameengine

BUILD_TYPE ?= RELEASE

SRC_DIR = src
LIBS_DIR = libs
LIBS_SUBDIRS = $(wildcard $(LIBS_DIR)/*)
BUILD_DIR = build

SRC_FILES = $(shell find $(SRC_DIR) $(LIBS_DIR) -type f -name "*.cpp")
OBJ_FILES = $(patsubst %.cpp, $(BUILD_DIR)/%.o, $(SRC_FILES))
TARGET_FILE = $(BUILD_DIR)/$(NAME)

CXX = g++ -std=c++17
CXXFLAGS = -Wall -Wextra

ifeq ($(BUILD_TYPE), DEBUG)
CXXFLAGS += -O0 -g
else
CXXFLAGS += -O2
endif

CXXFLAGS += `sdl2-config --cflags` $(addprefix -I, $(LIBS_SUBDIRS))
LDLIBS += `sdl2-config --libs`

UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S), Darwin)
LDLIBS += -llua
else ifeq ($(UNAME_S), Linux)
LDLIBS += -llua5.4
endif

COMPILE.cpp = $(CXX) $(CXXFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c
LINK.cpp = $(CXX) $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH)

.PHONY: all
all: $(TARGET_FILE)

.PHONY: run
run: $(TARGET_FILE)
	$(TARGET_FILE)

.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)

$(TARGET_FILE): $(OBJ_FILES)
	$(LINK.cpp) $^ $(LDLIBS) -o $@

$(BUILD_DIR)/%.o: %.cpp
	mkdir -p $(dir $@)
	$(COMPILE.cpp) -o $@ $<
