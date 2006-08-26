Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GH0su-0002ni-Ly for openembedded-devel@lists.openembedded.org;
	Sat, 26 Aug 2006 18:19:48 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 4E1BF4014D4; Sat, 26 Aug 2006 08:58:42 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060826155842.4E1BF4014D4@tinman.treke.net>
Date: Sat, 26 Aug 2006 08:58:42 -0700 (PDT)
Subject: [Bug 1353] gpe-session-scripts shouldn't depend on gpe-bluetooth
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
X-List-Received-Date: Sat, 26 Aug 2006 16:19:49 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1353





------- Comment #5 from bugs.openembedded.org@rolf.leggewie.biz  2006-08-26 08:58 -------
(In reply to comment #1)
> 1. patch gpe-auto-bluetooth.sh to fail silently when gpe-bluetooth is not
> installed, rather than producing an error; and

Would that be hard to do?  Since ...

> 2. move gpe-bluetooth from RDEPENDS to RRECOMMENDS in the gpe-session-scripts
> packaging.

... I guess this would be easy (even for me ;-)) 


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


