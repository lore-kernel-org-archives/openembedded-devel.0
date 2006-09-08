Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GLf4q-0008IQ-Dw for openembedded-devel@lists.openembedded.org;
	Fri, 08 Sep 2006 14:03:20 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 38EC1401B45; Fri,  8 Sep 2006 04:38:58 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060908113858.38EC1401B45@tinman.treke.net>
Date: Fri,  8 Sep 2006 04:38:58 -0700 (PDT)
Subject: [Bug 1399] altboot in 3.5.4.1 on collie
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
X-List-Received-Date: Fri, 08 Sep 2006 12:03:20 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1399





------- Comment #1 from bugs.openembedded.org@rolf.leggewie.biz  2006-09-08 04:38 -------
Well, it looks like the request for ENTER is coming from the altboot on the
file system in flash.  I think it would be best if altboot just continued
booting into the newly created loop filesystem.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


