Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GG1i9-0005d0-8Z for openembedded-devel@lists.openembedded.org;
	Thu, 24 Aug 2006 01:00:37 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 69680401B3F; Wed, 23 Aug 2006 15:40:12 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060823224012.69680401B3F@tinman.treke.net>
Date: Wed, 23 Aug 2006 15:40:12 -0700 (PDT)
Subject: [Bug 1354] New: glibc fails to build
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
X-List-Received-Date: Wed, 23 Aug 2006 23:00:38 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1354

           Summary: glibc fails to build
           Product: Openembedded
           Version: OpenZaurus 3.5.4.x
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: bugs.openembedded.org@rolf.leggewie.biz
         QAContact: tinderbox-oe@gmx.net


NOTE: package glibc-2.3.5+cvs20050627: started
NOTE: package glibc-2.3.5+cvs20050627-r12: task do_fetch: started
NOTE: package glibc-2.3.5+cvs20050627-r12: task do_fetch: completed
Updating
/export/interim/openembedded/tmp/stamps/arm-linux/glibc-2.3.5+cvs20050627-r12.do_fetch
NOTE: package glibc-2.3.5+cvs20050627-r12: task do_unpack: started
NOTE: Unpacking
/export/interim/openembedded/sources/stash_libc_sources.redhat.com__20050627.tar.gz
to /export/interim/openembedded/tmp/work/arm-linux/glibc-2.3.5+cvs20050627-r12/
NOTE: Unpacking
/export/interim/openembedded/sources/stash_ports_sources.redhat.com__20050627.tar.gz
to /export/interim/openembedded/tmp/work/arm-linux/glibc-2.3.5+cvs20050627-r12/
NOTE: Unpacking
/export/interim/openembedded/org.openembedded.dev/packages/glibc/files/etc/ld.so.conf
to /export/interim/openembedded/tmp/work/arm-linux/glibc-2.3.5+cvs20050627-r12/
NOTE: Unpacking
/export/interim/openembedded/org.openembedded.dev/packages/glibc/files/generate-supported.mk
to /export/interim/openembedded/tmp/work/arm-linux/glibc-2.3.5+cvs20050627-r12/
NOTE: package glibc-2.3.5+cvs20050627-r12: task do_unpack: completed
Updating
/export/interim/openembedded/tmp/stamps/arm-linux/glibc-2.3.5+cvs20050627-r12.do_unpack
NOTE: package glibc-2.3.5+cvs20050627-r12: task do_munge: started
ERROR: function do_munge failed
ERROR: log data follows
(/export/interim/openembedded/tmp/work/arm-linux/glibc-2.3.5+cvs20050627-r12/temp/log.do_munge.21570)
| mv: cannot overwrite directory
`/export/interim/openembedded/tmp/work/arm-linux/glibc-2.3.5+cvs20050627-r12/libc/ports'
NOTE: Task failed:
/export/interim/openembedded/tmp/work/arm-linux/glibc-2.3.5+cvs20050627-r12/temp/log.do_munge.21570
NOTE: package glibc-2.3.5+cvs20050627-r12: task do_munge: failed
ERROR: TaskFailed event exception, aborting
NOTE: package glibc-2.3.5+cvs20050627-r12: task do_clean: started
NOTE: removing
/export/interim/openembedded/tmp/work/arm-linux/glibc-2.3.5+cvs20050627-r12
NOTE: removing
/export/interim/openembedded/tmp/stamps/arm-linux/glibc-2.3.5+cvs20050627-r12.*
NOTE: package glibc-2.3.5+cvs20050627-r12: task do_clean: completed
NOTE: package glibc-2.3.5+cvs20050627: failed
ERROR: Build of altboot failed


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


