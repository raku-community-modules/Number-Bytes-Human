#!/usr/bin/env perl6

unit module Number::Bytes::Human;

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

multi format-bytes($bytes) is export(:functions) {
    return format-bytes $bytes, 0;
}

multi format-bytes($bytes, :$magnitude = 0) {
    if $bytes.abs < 1024 {
        return "{ sprintf '%.0f', $bytes }" ~ "{ @SUFFIXES[ $magnitude ] }";
    }

    return format-bytes $bytes / 1024, magnitude => $magnitude + 1;
}

multi parse-bytes($bytes) is export(:functions) {
    if $bytes ~~ m:i/$<value>=(\-?\d+) \s? $<suffix>=(<[BKMGTPEZY]>)B?/ {
        my $value = $<value>.Numeric * %MAGNITUDES{ $<suffix> };
        return $value;
    }
    else {
        die "Invalid value: $bytes";
    }
}

class Number::Bytes::Human {
    method format ($bytes) {
        return format-bytes $bytes;
    }
    method parse ($bytes) {
        return parse-bytes $bytes;
    }
};
