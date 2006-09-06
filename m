Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GL1JX-0007F6-5S for openembedded-devel@lists.openembedded.org;
	Wed, 06 Sep 2006 19:35:51 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 2670B401B2B; Wed,  6 Sep 2006 10:11:50 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060906171150.2670B401B2B@tinman.treke.net>
Date: Wed,  6 Sep 2006 10:11:50 -0700 (PDT)
Subject: [Bug 1391] New: minimo package bit rotted badly
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
X-List-Received-Date: Wed, 06 Sep 2006 17:35:51 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1391

           Summary: minimo package bit rotted badly
           Product: Openembedded
           Version: unspecified
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: erik@hovland.org
         QAContact: tinderbox-oe@gmx.net
 BugsThisDependsOn: 193,355,691,692,1003


There are currently 5 different minimo bugs in the bugtracker and still minimo
is not fixed. A new version of minimo exists (0.016) which should be the new
target for the minimo bbs. And we should make sure that minimo builds for at
least the most simple sets (angstrom, openzaurus and familiar).

There is a handhelds.org bug that tracks this issue for familiar builds:
http://bugzilla.handhelds.org/show_bug.cgi?id=1716


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


