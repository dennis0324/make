#
# Copyright (c) 2023 Jaedeok Kim <jdeokkim@protonmail.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

#
# Copyright (c) 2024 Dennis Ko <dennis0324@naver.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

.POSIX:

.PHONY: all clean
.PRAGMA: posix_202x
.SUFFIXES: .a .c .o

_COLOR_BEGIN = \033[1;30m
_COLOR_END = \033[m

PROJECT_FULL_NAME = ${PROJECT_AUTHOR}/${PROJECT_NAME}

PROJECT_PREFIX = ${_COLOR_BEGIN}${PROJECT_FULL_NAME}:${_COLOR_END}

INCLUDE_PATH = include
LIBRARY_PATH = bin
SOURCE_PATH = src


SOURCES = $(shell find $(SOURCE_PATH) -name '*.c')
OBJECTS = $(SOURCES:.c=.o)

TARGETS = ${LIBRARY_PATH}/lib${PROJECT_NAME}.a

CC = gcc
AR = ar
CFLAGS = -D_DEFAULT_SOURCE -g -I${INCLUDE_PATH} -O2 -std=c99

# CFLAGS += -fsanitize=address -Wall -Werror -Wpedantic

all: pre-build build post-build

pre-build:
	@printf "${PROJECT_PREFIX} Using: '${CC}' and '${AR}' to build this library.\n"

build: ${TARGETS}

.c.o:
	@printf "${PROJECT_PREFIX} Compiling: $@ (from $<)\n"
	@${CC} -c $< -o $@ ${CFLAGS}

${TARGETS}: ${OBJECTS}
	@mkdir -p ${LIBRARY_PATH}
	@printf "${PROJECT_PREFIX} Linking: ${TARGETS}\n"
	@${AR} rcs ${TARGETS} ${OBJECTS}

post-build:
	@printf "${PROJECT_PREFIX} Build complete.\n"

clean:
	@printf "${PROJECT_PREFIX} Cleaning up.\n"
	@rm -f ${LIBRARY_PATH}/*.a
	@rm -f ${SOURCE_PATH}/*.o
