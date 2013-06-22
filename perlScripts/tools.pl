#!/usr/bin/perl

open(PROCESS, "service --status-all|");

	@lignes=split('\n', <PROCESS>);
	print "$lignes[0]";
