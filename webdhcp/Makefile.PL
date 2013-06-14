use ExtUtils::MakeMaker;
WriteMakefile(
        NAME       => 'Webdhcp',
	AUTHOR	   => 'Michael Lewis (mlewis@mailops.com)',
	ABSTRACT   => 'Add, Delete, Modify DHCP entries from the web',
	VERSION_FROM => 'Webdhcp_Server.pm',
        DISTNAME   => "webdhcp",
        dist       => {COMPRESS > 'gzip', SUFFIX > 'gz'},
        test       => {TEST_TYPE > './test.pl'},
);

print "\n\t\a*** Make Sure that you Read the INSTALL file before doing a make ***\n\n";
