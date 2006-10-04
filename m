Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GV9KL-0008JD-Qw for openembedded-devel@lists.openembedded.org;
	Wed, 04 Oct 2006 18:10:34 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 0A7F0401B45; Wed,  4 Oct 2006 08:39:31 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20061004153931.0A7F0401B45@tinman.treke.net>
Date: Wed,  4 Oct 2006 08:39:31 -0700 (PDT)
Subject: [Bug 1452] fakeroot has runtime dependency on getopt; where is getopt?
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
X-List-Received-Date: Wed, 04 Oct 2006 16:10:35 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1452





------- Comment #1 from martinwguy@yahoo.it  2006-10-04 08:39 -------
where is getopt? util-linux.
I guess either busybox should provide getopt, or fakeroot should require
util-linux
But the installation of util-linux over busybox barfs halfway and fails to
install getopt, saying
Package util-linux wants to install file /sbin/mkfs.minix
        But that file is already provided by package busybox
er...


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


