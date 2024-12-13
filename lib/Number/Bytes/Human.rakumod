constant @SUFFIXES = < B K M G T P E Z Y >;
constant %MAGNITUDES = {
    B => 2 ** 0,
    K => 2 ** 10,
    M => 2 ** 20,
    G => 2 ** 30,
    T => 2 ** 40,
    P => 2 ** 50,
    E => 2 ** 60,
    Z => 2 ** 70,
    Y => 2 ** 80,
};

sub format-bytes(Numeric $bytes, Int :$magnitude = 0 --> Str) is export(:functions) {
    $bytes.abs < 1024
      ?? sprintf('%.0f', $bytes) ~ @SUFFIXES[ $magnitude ]
      !! format-bytes $bytes / 1024, magnitude => $magnitude + 1;
}

sub parse-bytes(Str $bytes --> Numeric) is export(:functions) {
    $bytes ~~ m:i/$<value>=(\-?\d+[\.\d+]?) \s? $<suffix>=(<[BKMGTPEZY]>)B?/
      ?? $<value>.Numeric * %MAGNITUDES{ $<suffix> }
      !! die "Invalid value: $bytes";
}

class Number::Bytes::Human {
    method format (Numeric $bytes --> Str) {
        format-bytes $bytes
    }
    method parse (Str $bytes --> Numeric) {
        parse-bytes $bytes
    }
}


=begin pod

=head1 NAME

Number::Bytes::Human - Convert byte count into an easy to read format

=head1 SYNOPSIS

=begin code :lang<raku>

# Functional interface
use Number::Bytes::Human :functions;
my $size = format-bytes 1024;   # '1K'
my $bytes = parse-bytes '1.0K'; # 1024

# OO Interface
my Number::Bytes::Human;
my $human = Number::Bytes::Human.new;

my $size = $human.format(1024);   # '1K'
my $bytes = $human.parse('1.0K'); # 1024

=end code

=head1 DESCRIPTION

This is the Raku re-write of CPAN's C<Number::Bytes::Human> module.
Special thanks to the original author: Adriano R. Ferreira.

The C<Number::Bytes::Humani> module converts large numbers of bytes
into a more human friendly format, e.g. '15G'. The functionality of
this module will be similar to the C<-h> switch on Unix commands
like C<ls>, C<du>, and C<df>.

Currently the module rounds to the nearest whole unit.

From the FreeBSD man page of df: L<http://www.freebsd.org/cgi/man.cgi?query=df>

=begin output

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

=end output

=head1 AUTHOR

Douglas L. Jenkins

=head1 COPYRIGHT AND LICENSE

Copyright 2016 - 2017 Douglas L. Jenkins

Copyright 2024 Raku Community

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
