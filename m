Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GV5Rg-0006i8-QM for openembedded-devel@lists.openembedded.org;
	Wed, 04 Oct 2006 14:01:53 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id C0095401B45; Wed,  4 Oct 2006 04:30:52 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20061004113052.C0095401B45@tinman.treke.net>
Date: Wed,  4 Oct 2006 04:30:52 -0700 (PDT)
Subject: [Bug 1451] New: libxres-1.0.1 configure fails (autoreconf)
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
X-List-Received-Date: Wed, 04 Oct 2006 12:01:53 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1451

           Summary: libxres-1.0.1 configure fails (autoreconf)
           Product: Openembedded
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: blocker
          Priority: P1
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: michael.illing@tietoenator.com
         QAContact: tinderbox-oe@gmx.net


NOTE: package libxres-1.0.1: started
NOTE: package libxres-1.0.1-r0: task do_configure: started
ERROR: function do_configure failed
ERROR: log data follows
(/data/embedded2.1/oetmp/work/libxres-1.0.1-r0/temp/log.do_configure.1067)
| automake (GNU automake) 1.9.3
| Written by Tom Tromey <tromey@redhat.com>.
|
| Copyright 2004 Free Software Foundation, Inc.
| This is free software; see the source for copying conditions.  There is NO
| warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
| AUTOV is 1.9
| NOTE: Executing autoreconf --verbose --install --force --exclude=autopoint -I
/data/embedded2.1/oetmp/staging/i486-linux/share/aclocal-1.9 -I
/data/embedded2.1/oetmp/staging/i486-linux/share/aclocal
| autoreconf: Entering directory `.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal -I
/data/embedded2.1/oetmp/staging/i486-linux/share/aclocal-1.9 -I
/data/embedded2.1/oetmp/staging/i486-linux/share/aclocal --force
| autoreconf: configure.ac: tracing
| autoreconf: running: libtoolize --copy --force
| autoreconf: running: /data/embedded2.1/oetmp/staging/i686-linux/bin/autoconf
--include=/data/embedded2.1/oetmp/staging/i486-linux/share/aclocal-1.9
--include=/data/embedded2.1/oetmp/staging/i486-linux/share/aclocal --force
--warnings=cross
| autoreconf: running:
/data/embedded2.1/oetmp/staging/i686-linux/bin/autoheader
--include=/data/embedded2.1/oetmp/staging/i486-linux/share/aclocal-1.9
--include=/data/embedded2.1/oetmp/staging/i486-linux/share/aclocal --force
--warnings=cross
| autoreconf: running: automake --foreign --add-missing --copy --force-missing
--warnings=cross
| automake: unknown warning category `cross'
| configure.ac:38: AC_CONFIG_AUX_DIR must be called before AM_INIT_AUTOMAKE...
| configure.ac:36: ... AM_INIT_AUTOMAKE called here
| autoreconf: automake failed with exit status: 1
| FATAL: autoreconf execution failed.
NOTE: Task failed:
/oefolder/oetmp/work/libxres-1.0.1-r0/temp/log.do_configure.1067
NOTE: package libxres-1.0.1-r0: task do_configure: failed
ERROR: TaskFailed event exception, aborting
NOTE: package libxres-1.0.1: failed


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


