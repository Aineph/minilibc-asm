# minilibc-asm
An x86_64 assembly implementation of the most popular functions of the C standard library.

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

## Build system

The project uses a Makefile in order to compile a shared library.

This section will guide you on how to build the shared library on a Linux environment and to test it.
After cloning the repository, run the following command to create to generate the library.

```
$> make
```

Now a file named libmlc.so should have been generated at the root of the repository.
In order to test it, a file named "test.c" is available in the "test" subdirectory.

To compile it from the root directory, simply run the command:

```
$> gcc -o minilibc-asm_test test/test.c
```

This will generate a binary executable named "minilibc-asm_test".
Finally, in order to call the functions implemented in the generated shared library instead of the
standard C library functions, the "LD_PRELOAD" variable must be overridden before executing the binary.

To do so, run the following commands:

```
$> export LD_PRELOAD=./libmlc.so
$> ./minilibc-asm_test
```

The binary file has been executed using the libmlc.so library.
