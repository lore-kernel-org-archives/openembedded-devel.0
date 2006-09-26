Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GSEk7-0006wD-QY for openembedded-devel@lists.openembedded.org;
	Tue, 26 Sep 2006 17:21:08 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id ABEB0401B45; Tue, 26 Sep 2006 07:52:03 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060926145203.ABEB0401B45@tinman.treke.net>
Date: Tue, 26 Sep 2006 07:52:03 -0700 (PDT)
Subject: [Bug 1439] New: perl 5.8.7 fails during configure
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Sep 2006 15:21:08 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1439

           Summary: perl 5.8.7 fails during configure
           Product: Openembedded
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: mickeyl@handhelds.org
         QAContact: tinderbox-oe@gmx.net


NOTE: package perl-5.8.7: started
NOTE: package perl-5.8.7-r18: task do_fetch: started
NOTE: package perl-5.8.7-r18: task do_fetch: completed
NOTE: package perl-5.8.7-r18: task do_unpack: started
NOTE: Unpacking /local/pkg/sources/perl-5.8.7.tar.gz to
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/
NOTE: Unpacking
/local/pkg/oe/org.openembedded.dev/packages/perl/perl-5.8.7/Makefile.SH.patch
to /local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/
NOTE: Unpacking
/local/pkg/oe/org.openembedded.dev/packages/perl/perl-5.8.7/config.sh-mipsel-linux
to /local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/
NOTE: Unpacking
/local/pkg/oe/org.openembedded.dev/packages/perl/perl-5.8.7/config.sh-i686-linux
to /local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/
NOTE: Unpacking
/local/pkg/oe/org.openembedded.dev/packages/perl/perl-5.8.7/config.sh-armeb-linux
to /local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/
NOTE: Unpacking
/local/pkg/oe/org.openembedded.dev/packages/perl/perl-5.8.7/config.sh-arm-linux
to /local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/
NOTE: Unpacking
/local/pkg/oe/org.openembedded.dev/packages/perl/perl-5.8.7/config.sh-i386-linux
to /local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/
NOTE: Unpacking
/local/pkg/oe/org.openembedded.dev/packages/perl/perl-5.8.7/config.sh-i486-linux
to /local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/
NOTE: Unpacking
/local/pkg/oe/org.openembedded.dev/packages/perl/perl-5.8.7/config.sh-i586-linux
to /local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/
NOTE: Unpacking
/local/pkg/oe/org.openembedded.dev/packages/perl/perl-5.8.7/config.sh-sh3-linux
to /local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/
NOTE: Unpacking
/local/pkg/oe/org.openembedded.dev/packages/perl/perl-5.8.7/config.sh-sh4-linux
to /local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/
NOTE: package perl-5.8.7-r18: task do_unpack: completed
NOTE: package perl-5.8.7-r18: task do_patch: started
NOTE: Applying patch 'Makefile.patch'
NOTE: Applying patch 'config.sh-arm-linux.patch'
NOTE: Applying patch 'libperl-5.8.3-create-libperl-soname.patch'
NOTE: Applying patch 'uclibc.patch'
NOTE: package perl-5.8.7-r18: task do_patch: completed
NOTE: package perl-5.8.7-r18: task do_configure: started
ERROR: function do_configure failed
ERROR: log data follows
(/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/temp/log.do_configure.17717)
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/config.sh-arm-linux
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/config.sh-armeb-linux
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/config.sh-i386-linux
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/config.sh-i486-linux
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/config.sh-i586-linux
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/config.sh-i686-linux
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/config.sh-mipsel-linux
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/config.sh-sh3-linux
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/config.sh-sh4-linux
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/.pc/config.sh-arm-linux.patch/Cross/config.sh-arm-linux
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/ext/XS/APItest/Makefile.PL
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/ext/I18N/Langinfo/Makefile.PL
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/ext/Time/HiRes/Makefile.PL
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/ext/Errno/Errno_pm.PL
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/ext/DynaLoader/hints/aix.pl
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/ext/DynaLoader/hints/linux.pl
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/ext/DynaLoader/dl_aix.xs
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/ext/SDBM_File/sdbm/sdbm.3
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/ext/threads/Makefile.PL
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/ext/threads/shared/Makefile.PL
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/lib/FileCache.pm
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/lib/cacheout.pl
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/os2/OS2/PrfDB/Makefile.PL
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/os2/OS2/Process/Makefile.PL
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/os2/OS2/ExtAttr/Makefile.PL
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/pod/perlfaq5.pod
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/pod/perlxstut.pod
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/pod/perl581delta.pod
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/h2pl/getioctlsizes
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/h2pl/README
| Fixing: /local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/pp.h
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/Cross/config.sh-sh4-linux-uclibc
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/Cross/config.sh-mipsel-linux-uclibc
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/Cross/config.sh-arm-linux-uclibc
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/Cross/config.sh-i586-linux-uclibc
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/Cross/config.sh-i386-linux
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/Cross/config.sh-sh3-linux
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/Cross/config.sh-i586-linux
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/Cross/config.sh-sh4-linux
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/Cross/config.sh-armeb-linux-uclibc
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/Cross/config.sh-sh3-linux-uclibc
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/Cross/config.sh-arm-linux
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/Cross/config.sh-armeb-linux
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/Cross/config.sh-i486-linux-uclibc
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/Cross/config.sh-i386-linux-uclibc
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/Cross/config.sh-arm-linux-gnueabi
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/Cross/config.sh-mipsel-linux
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/Cross/config.sh-i686-linux
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/Cross/config.sh-i686-linux-uclibc
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/hints/irix_6.sh
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/hints/rhapsody.sh
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/hints/esix4.sh
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/hints/darwin.sh
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/hints/epix.sh
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/hints/mpeix.sh
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/hints/sco_2_3_3.sh
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/hints/sco_2_3_4.sh
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/hints/hpux.sh
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/hints/machten.sh
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/hints/utekv.sh
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/utils/h2ph.PL
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/utils/h2xs.PL
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/win32/config.bc
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/win32/config.gc
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/win32/config.vc
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/win32/config.vc64
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/wince/config.ce
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/Porting/Glossary
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/Porting/config.sh
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/Changes5.004
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/README.solaris
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/apollo/netinet/in.h
| Fixing:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/perl-5.8.7/cflags.SH
| Fixing: Binary
| sed: can't read Binary: No such file or directory
NOTE: Task failed:
/local/pkg/oe/x86/tmp/work/i486-linux/perl-5.8.7-r18/temp/log.do_configure.17717
NOTE: package perl-5.8.7-r18: task do_configure: failed
ERROR: TaskFailed event exception, aborting
NOTE: package perl-5.8.7: failed
ERROR: Build of 'perl' failed
Build statistics:
  Attempted builds: 1
  Failed builds: 1


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


