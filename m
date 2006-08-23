Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GFyzF-00034Q-AH for openembedded-devel@lists.openembedded.org;
	Wed, 23 Aug 2006 22:06:05 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 4B131401B40; Wed, 23 Aug 2006 12:45:38 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060823194538.4B131401B40@tinman.treke.net>
Date: Wed, 23 Aug 2006 12:45:38 -0700 (PDT)
Subject: [Bug 1195] faad2-2.0-r1 fails to compile due to function declaration mismatch
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
X-List-Received-Date: Wed, 23 Aug 2006 20:06:05 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1195





------- Comment #1 from papercrane@reversefold.com  2006-08-23 12:45 -------
I also ran into this today. It's interesting to mention that it compiles fine
in .oz354x.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


