Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GL4O5-0005bA-8z for openembedded-devel@lists.openembedded.org;
	Wed, 06 Sep 2006 22:52:45 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 32417401B2B; Wed,  6 Sep 2006 13:28:43 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060906202843.32417401B2B@tinman.treke.net>
Date: Wed,  6 Sep 2006 13:28:43 -0700 (PDT)
Subject: [Bug 1392] New: Opie-eye : Do_install fails due to "no such file or directory"
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
X-List-Received-Date: Wed, 06 Sep 2006 20:52:45 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1392

           Summary: Opie-eye : Do_install fails due to "no such file or
                    directory"
           Product: Openembedded
           Version: unspecified
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: kristoffer_e1@hotmail.com
         QAContact: tinderbox-oe@gmx.net


ERROR: function do_install failed
ERROR: log data follows
(/work/dev/donkey/6xx/tmp/work/sh3-linux/opie-eye-1.2.2-r0/temp/log.do_install.6617)
| install: target
`/work/dev/donkey/6xx/tmp/work/sh3-linux/opie-eye-1.2.2-r0/image/opt/QtPalmtop/bin/'
is not a directory: No such file or directory
NOTE: Task failed:
/work/dev/donkey/6xx/tmp/work/sh3-linux/opie-eye-1.2.2-r0/temp/log.do_install.6617
NOTE: package opie-eye-1.2.2-r0: task do_install: failed
ERROR: TaskFailed event exception, aborting
NOTE: package opie-eye-1.2.2: failed


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


