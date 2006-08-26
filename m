Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GH5OS-0003V2-Te for openembedded-devel@lists.openembedded.org;
	Sat, 26 Aug 2006 23:08:41 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 7156C4014D2; Sat, 26 Aug 2006 13:47:31 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060826204731.7156C4014D2@tinman.treke.net>
Date: Sat, 26 Aug 2006 13:47:31 -0700 (PDT)
Subject: [Bug 1365] New: altboot does not find CF card
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
X-List-Received-Date: Sat, 26 Aug 2006 21:08:41 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1365

           Summary: altboot does not find CF card
           Product: Openembedded
           Version: OpenZaurus 3.5.4.x
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Distributions
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: bugs.openembedded.org@rolf.leggewie.biz
         QAContact: tinderbox-oe@gmx.net
OtherBugsDependingO 1093
             nThis:


Hi,

using altboot compiled from the latest sources in .dev  My feed is at
http://oz.leggewie.org/ipk/  Quite obviously, this might be something I did
wrong but on the other hand it might also be that I caught a newly introduced
bug early.

Upon reboot, altboot (or some other software) will usually fail to mount the CF
card and thus fail to boot the loop image on the CF card.  To remedy the
situation, I boot either the installation in flash or another one on SD.  On
the next reboot, the CF card will usually be recognized.

Regards

Rolf


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


