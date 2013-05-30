#!/usr/bin/perl

# Script reporting file system disk space usage (size and percent)

open(PROCESS,"df --block-size=1024 -P $ARGV[0] | grep -v Filesystem |");
foreach (<PROCESS>) {
	if ($_ =~ /($ARGV[0])(.* )(.*[0-9])(.* )(.*[0-9])(.* )(.*[0-9])(.* )(.*[0-9])%(.* )/) {
		print "Taille(MB):$7 \t $9% \n";
	}
}
close(PROCESS);

