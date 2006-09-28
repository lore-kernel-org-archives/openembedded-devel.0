Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GSxrE-0006ly-63 for openembedded-devel@lists.openembedded.org;
	Thu, 28 Sep 2006 17:31:28 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 23C11401B45; Thu, 28 Sep 2006 08:01:53 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060928150153.23C11401B45@tinman.treke.net>
Date: Thu, 28 Sep 2006 08:01:53 -0700 (PDT)
Subject: [Bug 1445] New: Poodle screen turns off when starting OPIE in oz 3.5.4.2 rc2
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
X-List-Received-Date: Thu, 28 Sep 2006 15:31:28 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1445

           Summary: Poodle screen turns off when starting OPIE in oz 3.5.4.2
                    rc2
           Product: Openembedded
           Version: OpenZaurus 3.5.4.x
          Platform: ARM
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Distributions
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: bjoern@ruberg-wegener.de
         QAContact: tinderbox-oe@gmx.net


I had this problem with all OPIE images for the poodle with kernel 2.6.
When starting OPIE I get a short bright flush, then the display turns off and I
cannot see anything anymore.
The PDA is still running and I have ssh-access. It seems as if opie is running
correctly, just the screen is off.
It keeps off even after I am stop opie.
Suspend and resume doesn't bring the screen back either.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


