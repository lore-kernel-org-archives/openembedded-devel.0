Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GGxDc-0004Fl-Tn for openembedded-devel@lists.openembedded.org;
	Sat, 26 Aug 2006 14:24:57 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 142EC4014D4; Sat, 26 Aug 2006 05:03:53 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060826120353.142EC4014D4@tinman.treke.net>
Date: Sat, 26 Aug 2006 05:03:53 -0700 (PDT)
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
X-List-Received-Date: Sat, 26 Aug 2006 12:24:57 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1353


bugs.openembedded.org@rolf.leggewie.biz changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bugs.openembedded.org@rolf.l
                   |                            |eggewie.biz




------- Comment #2 from bugs.openembedded.org@rolf.leggewie.biz  2006-08-26 05:03 -------
The same is also true for bluetooth stuff in opie and for example the collie. 
It is installed by default and consumes precious space on the flash system. 
Should I open a new bug report or shall we broaden this bug report to make
bluetooth optional on all images?


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


