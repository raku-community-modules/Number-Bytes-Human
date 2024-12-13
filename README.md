[![Actions Status](https://github.com/raku-community-modules/Number-Bytes-Human/actions/workflows/linux.yml/badge.svg)](https://github.com/raku-community-modules/Number-Bytes-Human/actions) [![Actions Status](https://github.com/raku-community-modules/Number-Bytes-Human/actions/workflows/macos.yml/badge.svg)](https://github.com/raku-community-modules/Number-Bytes-Human/actions) [![Actions Status](https://github.com/raku-community-modules/Number-Bytes-Human/actions/workflows/windows.yml/badge.svg)](https://github.com/raku-community-modules/Number-Bytes-Human/actions)

NAME
====

Number::Bytes::Human - Convert byte count into an easy to read format

SYNOPSIS
========

```raku
# Functional interface
use Number::Bytes::Human :functions;
my $size = format-bytes 1024;   # '1K'
my $bytes = parse-bytes '1.0K'; # 1024

# OO Interface
my Number::Bytes::Human;
my $human = Number::Bytes::Human.new;

my $size = $human.format(1024);   # '1K'
my $bytes = $human.parse('1.0K'); # 1024
```

DESCRIPTION
===========

This is the Raku re-write of CPAN's `Number::Bytes::Human` module. Special thanks to the original author: Adriano R. Ferreira.

The `Number::Bytes::Humani` module converts large numbers of bytes into a more human friendly format, e.g. '15G'. The functionality of this module will be similar to the `-h` switch on Unix commands like `ls`, `du`, and `df`.

Currently the module rounds to the nearest whole unit.

From the FreeBSD man page of df: [http://www.freebsd.org/cgi/man.cgi?query=df](http://www.freebsd.org/cgi/man.cgi?query=df)

    "Human-readable" output.  Use unit suffixes: Byte, Kilobyte,
    Megabyte, Gigabyte, Terabyte and Petabyte in order to reduce the
    number of digits to four or fewer using base 2 for sizes.

    byte      B
    kilobyte  K = 2**10 B = 1024 B
    megabyte  M = 2**20 B = 1024 * 1024 B
    gigabyte  G = 2**30 B = 1024 * 1024 * 1024 B
    terabyte  T = 2**40 B = 1024 * 1024 * 1024 * 1024 B

    petabyte  P = 2**50 B = 1024 * 1024 * 1024 * 1024 * 1024 B
    exabyte   E = 2**60 B = 1024 * 1024 * 1024 * 1024 * 1024 * 1024 B
    zettabyte Z = 2**70 B = 1024 * 1024 * 1024 * 1024 * 1024 * 1024 * 1024 B
    yottabyte Y = 2**80 B = 1024 * 1024 * 1024 * 1024 * 1024 * 1024 * 1024 * 1024 B

AUTHOR
======

Douglas L. Jenkins

COPYRIGHT AND LICENSE
=====================

Copyright 2016 - 2017 Douglas L. Jenkins

Copyright 2024 Raku Community

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

