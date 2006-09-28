Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GSsPT-0006Gl-Iq for openembedded-devel@lists.openembedded.org;
	Thu, 28 Sep 2006 11:42:27 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 7F840401B45; Thu, 28 Sep 2006 02:12:56 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060928091256.7F840401B45@tinman.treke.net>
Date: Thu, 28 Sep 2006 02:12:56 -0700 (PDT)
Subject: [Bug 1444] New: xtscal consumes 100% cpu
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
X-List-Received-Date: Thu, 28 Sep 2006 09:42:27 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1444

           Summary: xtscal consumes 100% cpu
           Product: Openembedded
           Version: unspecified
          Platform: ARM
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P2
         Component: Distributions
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: liam.girdwood@wolfsonmicro.com
         QAContact: tinderbox-oe@gmx.net


A minor issue:- xtscal is consuming 100% cpu when calibrating the touchscreen.
It should probably be blocking whilst waiting on touch events.
Tested on Angstrom and Openzaurus.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


