Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GKgAl-0000IA-JP for openembedded-devel@lists.openembedded.org;
	Tue, 05 Sep 2006 21:01:23 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 154164014D4; Tue,  5 Sep 2006 11:37:42 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060905183742.154164014D4@tinman.treke.net>
Date: Tue,  5 Sep 2006 11:37:42 -0700 (PDT)
Subject: [Bug 1387] 3.5.4.2RC2 Tosa - system lockup at screen calibration
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
X-List-Received-Date: Tue, 05 Sep 2006 19:01:24 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1387


bazmi.husain@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




------- Comment #2 from bazmi.husain@gmail.com  2006-09-05 11:37 -------
(In reply to comment #1)
> Is this with opie or gpe? Do both fail or only one?
> 

oops, sorry. was with opie. gpe works just fine..

just downloaded the modified image of opie and that too is ok (back to the
situation where after the first boot, system will hang after the last cursor
press for screen alignment but a subsequent reset and reboot allows it to
proceed)

i guess this bug should be changed to resolved as the first boot problem is
already reported as a separate bug. thanks guys.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


