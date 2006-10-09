Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GWzuK-0008KA-Dx for openembedded-devel@lists.openembedded.org;
	Mon, 09 Oct 2006 20:31:20 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 5D55C406554; Mon,  9 Oct 2006 10:58:55 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20061009175855.5D55C406554@tinman.treke.net>
Date: Mon,  9 Oct 2006 10:58:55 -0700 (PDT)
Subject: [Bug 1421] Compilation of glibc-2.4 fails for collie (TLS support?)
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
X-List-Received-Date: Mon, 09 Oct 2006 18:31:20 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1421





------- Comment #5 from bugs.openembedded.org@rolf.leggewie.biz  2006-10-09 10:58 -------
I have the following arm-linux-gcc on my system:

/export/interim/openembedded/tmp/work/i686-linux/gcc-cross-initial-4.1.1-r6/image/export/interim/openembedded/tmp/cross/bin/arm-linux-gcc
/export/interim/openembedded/tmp/work/i686-linux/gcc-cross-4.1.1-r6/image/export/interim/openembedded/tmp/cross/bin/arm-linux-gcc
/export/interim/openembedded/tmp/work/i686-linux/gcc-cross-initial-4.1.1-r7/image/export/interim/openembedded/tmp/cross/bin/arm-linux-gcc
/export/interim/openembedded/tmp/work/i686-linux/gcc-cross-4.1.1-r7/image/export/interim/openembedded/tmp/cross/bin/arm-linux-gcc
/export/interim/openembedded/tmp/cross/bin/arm-linux-gcc

When called with --version, they all report

arm-linux-gcc (GCC) 4.1.1
Copyright (C) 2006 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


