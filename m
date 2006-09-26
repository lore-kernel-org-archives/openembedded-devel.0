Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GSISt-0007Vd-93 for openembedded-devel@lists.openembedded.org;
	Tue, 26 Sep 2006 21:19:35 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 93CA9401B45; Tue, 26 Sep 2006 11:50:28 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060926185028.93CA9401B45@tinman.treke.net>
Date: Tue, 26 Sep 2006 11:50:28 -0700 (PDT)
Subject: [Bug 1440] New: multimachine.bbclass ignores TARGET_VENDOR
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
X-List-Received-Date: Tue, 26 Sep 2006 19:19:35 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1440

           Summary: multimachine.bbclass ignores TARGET_VENDOR
           Product: Openembedded
           Version: Angstrom
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: koen@dominion.kabel.utwente.nl
         QAContact: tinderbox-oe@gmx.net


multimachine.bbclass ignores TARGET_VENDOR so builds where the target sys is
almost like the host system (host = opteron, target = athlon-mp) exhibit
strange behaviour.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


