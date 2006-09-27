Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GSV3Q-0004Qk-5F for openembedded-devel@lists.openembedded.org;
	Wed, 27 Sep 2006 10:46:08 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 3617A401B45; Wed, 27 Sep 2006 01:16:57 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060927081657.3617A401B45@tinman.treke.net>
Date: Wed, 27 Sep 2006 01:16:57 -0700 (PDT)
Subject: [Bug 1440] multimachine.bbclass ignores TARGET_VENDOR
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
X-List-Received-Date: Wed, 27 Sep 2006 08:46:08 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1440


koen@dominion.kabel.utwente.nl changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




------- Comment #1 from koen@dominion.kabel.utwente.nl  2006-09-27 01:16 -------
fixed in rf4888077cbab5110be4966aa09c8bea4a75438e1.
It will trigger a full rebuild, so grab something to eat and some 5 star sudoku
puzzles.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


