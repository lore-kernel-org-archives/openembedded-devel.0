Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GIC6Q-0006jj-KF for openembedded-devel@lists.openembedded.org;
	Wed, 30 Aug 2006 00:30:39 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 30004401B3E; Tue, 29 Aug 2006 15:08:38 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060829220838.30004401B3E@tinman.treke.net>
Date: Tue, 29 Aug 2006 15:08:38 -0700 (PDT)
Subject: [Bug 1372] New: uinput module for 2.6 tosa
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
X-List-Received-Date: Tue, 29 Aug 2006 22:30:39 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1372

           Summary: uinput module for 2.6 tosa
           Product: Openembedded
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: jgrant@ibtechsolutions.com
         QAContact: tinderbox-oe@gmx.net


please add the foillowing to
packages/linux/linux-openzaurus-2.6.17/defconfig-tosa

CONFIG_INPUT_MISC=y
CONFIG_INPUT_UINPUT=m

This will allow for the building of the kernel-module-uinput.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


