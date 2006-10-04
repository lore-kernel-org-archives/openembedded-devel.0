Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GVDqv-0003mO-7z for openembedded-devel@lists.openembedded.org;
	Wed, 04 Oct 2006 23:00:29 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 784C5401B45; Wed,  4 Oct 2006 13:29:23 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20061004202923.784C5401B45@tinman.treke.net>
Date: Wed,  4 Oct 2006 13:29:23 -0700 (PDT)
Subject: [Bug 1454] New: [SuperH] - Gcc 4.1.1 failed to build
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
X-List-Received-Date: Wed, 04 Oct 2006 21:00:30 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1454

           Summary: [SuperH] - Gcc 4.1.1 failed to build
           Product: Openembedded
           Version: unspecified
          Platform: SuperH
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: kristoffer_e1@hotmail.com
         QAContact: tinderbox-oe@gmx.net


1/gcc/fixproto
/work/dev/donkey/6xx/tmp/work/sh3-linux/gcc-4.1.1-r6/image/usr/libexec/gcc/sh3-linux/4.1.1/install-tools/fixproto
; \
|   /work/dev/donkey/6xx/tmp/staging/i686-linux/bin/install -c build/fix-header
\
|      
/work/dev/donkey/6xx/tmp/work/sh3-linux/gcc-4.1.1-r6/image/usr/libexec/gcc/sh3-linux/4.1.1/install-tools/fix-header
; \
| else :; fi
| /work/dev/donkey/6xx/tmp/staging/i686-linux/bin/install-sh: build/fix-header
does not exist.
| make[2]: *** [install-mkheaders] Error 1
| make[2]: Leaving directory
`/work/dev/donkey/6xx/tmp/work/sh3-linux/gcc-4.1.1-r6/gcc-4.1.1/build.sh3-linux.sh3-linux/gcc'
| make[1]: *** [install-gcc] Error 2
| make[1]: Leaving directory
`/work/dev/donkey/6xx/tmp/work/sh3-linux/gcc-4.1.1-r6/gcc-4.1.1/build.sh3-linux.sh3-linux'
| make: *** [install] Error 2
| + die 'oe_runmake failed'
| + oefatal 'oe_runmake failed'
| + echo FATAL: 'oe_runmake failed'
| FATAL: oe_runmake failed
| + exit 1
NOTE: Task failed:
/work/dev/donkey/6xx/tmp/work/sh3-linux/gcc-4.1.1-r6/temp/log.do_install.6060
NOTE: package gcc-4.1.1-r6: task do_install: failed
ERROR: TaskFailed event exception, aborting
NOTE: package gcc-4.1.1: failed
ERROR: Build of gcc-4.1.1 failed


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


