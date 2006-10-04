Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GVFke-0006A6-8n for openembedded-devel@lists.openembedded.org;
	Thu, 05 Oct 2006 01:02:08 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 2BFDD401B46; Wed,  4 Oct 2006 15:31:01 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20061004223101.2BFDD401B46@tinman.treke.net>
Date: Wed,  4 Oct 2006 15:31:01 -0700 (PDT)
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
X-List-Received-Date: Wed, 04 Oct 2006 23:02:08 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1452





------- Comment #2 from lenehan@twibble.org  2006-10-04 15:31 -------
I've fixed util-linux in dev by putting mkfs.minix and fsck.minix under
update-alternatives control. Tested install/run on sh4 and i486. So that part
at least should be ok once util-linux is update.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


