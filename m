Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GWx6p-0000QY-Vz for openembedded-devel@lists.openembedded.org;
	Mon, 09 Oct 2006 17:32:04 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 4385E406550; Mon,  9 Oct 2006 07:59:45 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20061009145945.4385E406550@tinman.treke.net>
Date: Mon,  9 Oct 2006 07:59:45 -0700 (PDT)
Subject: [Bug 1421] Compilation of glibc-2.4 fails (and therefore gpe-plucker)
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
X-List-Received-Date: Mon, 09 Oct 2006 15:32:04 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1421





------- Comment #4 from freyther@inf.fu-berlin.de  2006-10-09 07:59 -------


configure:6568: checking for __thread
configure:6577: arm-linux-gcc -march=armv4 -mtune=xscale
-I/export/interim/openembedded/tmp/staging/arm-linux/include
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2  -c
conftest.c >&5
conftest.c:1: error: thread-local storage not supported for this target


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


