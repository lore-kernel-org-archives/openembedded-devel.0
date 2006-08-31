Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GImZW-0000EH-P7 for openembedded-devel@lists.openembedded.org;
	Thu, 31 Aug 2006 15:27:06 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id B9A61401B3E; Thu, 31 Aug 2006 06:04:41 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060831130441.B9A61401B3E@tinman.treke.net>
Date: Thu, 31 Aug 2006 06:04:41 -0700 (PDT)
Subject: [Bug 1374] New: 3.5.4.2 RC1 fails on collie still expecting 2.4 kernel
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
X-List-Received-Date: Thu, 31 Aug 2006 13:27:07 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1374

           Summary: 3.5.4.2 RC1 fails on collie still expecting 2.4 kernel
           Product: Openembedded
           Version: OpenZaurus 3.5.4.x
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Distributions
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: Martijn.Ras@GMail.com
         QAContact: tinderbox-oe@gmx.net


Heya Folks,

Just downloaded and flashed the RC1 for 3.5.4.2 on my collie. When putting the
switch back to normal operation and booting the system it fails complaining
about the 2.6 kernel where it expected to find a 2.4 kernel.

So, i'm back to 3.5.4 for now ...

Mazzel,

Martijn.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


