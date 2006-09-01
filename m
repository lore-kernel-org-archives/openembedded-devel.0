Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GJHjZ-0008HM-3X for openembedded-devel@lists.openembedded.org;
	Sat, 02 Sep 2006 00:43:33 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 0C026401B3E; Fri,  1 Sep 2006 15:20:41 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060901222041.0C026401B3E@tinman.treke.net>
Date: Fri,  1 Sep 2006 15:20:41 -0700 (PDT)
Subject: [Bug 1376] New: cairo 1.2.4 + cairo-fixed.patch fails to render
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
X-List-Received-Date: Fri, 01 Sep 2006 22:43:33 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1376

           Summary: cairo 1.2.4 + cairo-fixed.patch fails to render
           Product: Openembedded
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: mreimer@vpop.net
         QAContact: tinderbox-oe@gmx.net


Building cairo 1.2.4 with cairo-fixed.patch from .dev fails, rendering garbage
and no text. Excluding the patch from the build fixes it for me and XorA.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


