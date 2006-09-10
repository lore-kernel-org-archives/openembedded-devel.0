Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GMXLA-0004nb-SB for openembedded-devel@lists.openembedded.org;
	Sun, 10 Sep 2006 23:59:49 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 7E186401B45; Sun, 10 Sep 2006 14:34:45 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060910213445.7E186401B45@tinman.treke.net>
Date: Sun, 10 Sep 2006 14:34:45 -0700 (PDT)
Subject: [Bug 1326] libpng doesn't build for x86
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
X-List-Received-Date: Sun, 10 Sep 2006 21:59:49 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1326


pmiscml@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|FIXED                       |




------- Comment #4 from pmiscml@gmail.com  2006-09-10 14:34 -------
It seems like following happened: autotool support was added libpng just pretty
recently, after 1.2.8. But .bb for 1.2.12 was just a cut&paste, trying to
compile it in adhoc way.

Reassigning to myself, as I deal w/this right now. Will attach patch for review
here.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


