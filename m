Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GMQaK-0002sn-U6 for openembedded-devel@lists.openembedded.org;
	Sun, 10 Sep 2006 16:47:01 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 062CA401B2B; Sun, 10 Sep 2006 07:22:02 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060910142202.062CA401B2B@tinman.treke.net>
Date: Sun, 10 Sep 2006 07:22:02 -0700 (PDT)
Subject: [Bug 1407] socat-1.3.2.1 xioinitialize failed
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
X-List-Received-Date: Sun, 10 Sep 2006 14:47:02 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1407





------- Comment #3 from koen@dominion.kabel.utwente.nl  2006-09-10 07:22 -------
The .bb file is missing xiopen.patch. After removing that line I get:

| xiohelp.c:30: error: static declaration of 'addressgroupnames' follows
non-static declaration
| xioopen.h:45: error: previous declaration of 'addressgroupnames' was here


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


