Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GR5Xn-0001he-Qj for openembedded-devel@lists.openembedded.org;
	Sat, 23 Sep 2006 13:19:40 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 655EA401B45; Sat, 23 Sep 2006 03:51:24 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060923105124.655EA401B45@tinman.treke.net>
Date: Sat, 23 Sep 2006 03:51:24 -0700 (PDT)
Subject: [Bug 1434] New: location of pine4.63 sources has been moved and renamed
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
X-List-Received-Date: Sat, 23 Sep 2006 11:19:40 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1434

           Summary: location of pine4.63 sources has been moved and renamed
           Product: Openembedded
           Version: unspecified
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Distributions
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: tom@openhardware.net
         QAContact: tinderbox-oe@gmx.net


============================================================
--- packages/pine/pine_4.63.bb  049fb277b8aa84bbeb6cf0afd896079fe4071511
+++ packages/pine/pine_4.63.bb  8af740e8acd0246c2b9a01abb75d78edfdde44f6
@@ -6,7 +6,7 @@ MAINTAINER = "Michael 'Mickey' Lauer <mi
 HOMEPAGE = "http://www.washington.edu/pine/"
 MAINTAINER = "Michael 'Mickey' Lauer <mickey@Vanille.de>"

-SRC_URI = "ftp://ftp.cac.washington.edu/pine/pine${PV}.tar.bz2"
+SRC_URI = "ftp://ftp.cac.washington.edu/pine/old/pine${PV}.tar.Z"
 S = "${WORKDIR}/pine${PV}"


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


