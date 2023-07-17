# minilibc-asm
An x86_64 assembly implementation of the most popular functions of the C standard library.

![MinilibC Illustration](https://res.cloudinary.com/deexzd1vz/image/upload/v1689606081/minilibc_wndw2e.jpg)

The following functions are implemented:

* strlen
* strchr
* memset
* memcpy
* strcmp
* memmove
* strncmp
* strcasecmp
* rindex
* strstr
* strpbrk
* strcspn
* strcpy
* strncpy
* strcat
* strncat
* strrchr
* index
* memchr
* memrchr
* strspn

## Build System

The project uses a Makefile in order to compile a shared library.
You need the assembly compiler *nasm* and the GNU Compiler collection *gcc*.

This section will guide you on how to build the shared library on a Linux environment (including Mac OS X) and to
test it.
After cloning the repository, run the following command at the root of the directory to generate the library.

```
$> make
```

On a Linux system, the created library should be named "libmlc.so". On OS X, it should be named "libmlc.dylib".

## User Manual

Now that the library has been built, the *LD_PRELOAD* variable has to be overridden. On Mac OS X, the variables to
override are named *DYLD_INSERT_LIBRARIES* and *DYLD_FORCE_FLAT_NAMESPACE*.

To redefine the variable with the generated library on Linux, use the following command:

```
$> export LD_PRELOAD=./libmlc.so
```

On OS X, use these commands instead:

```
$> export DYLD_INSERT_LIBRARIES=./libmlc.dylib
$> export DYLD_FORCE_FLAT_NAMESPACE=1
```

Now every command typed in the terminal are linked to the library.
Therefore you can test everything from simple commands like "ls" to complex programs
such as "Chromium" or "VLC media player".

## Custom Tests

In order to test the implemented functions, a C file named "test.c" is available in the "test" subdirectory.
To compile it on a linux environment, simply run the command:

```
$> gcc -o minilibc-asm_test test/test.c -fno-builtin -L. -lmlc
```

This will generate a binary executable named "minilibc-asm_test".
To specify the path of the library to the binary, the *LD_LIBRARY_PATH* must be overridden.
To do so, type the following commands:

```
$> export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH
$> ./minilibc-asm_test
```

The binary file has been executed using the shared library instead of the C standard library.
