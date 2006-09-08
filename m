Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GLf1W-0008EO-17 for openembedded-devel@lists.openembedded.org;
	Fri, 08 Sep 2006 13:59:54 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id D43C3401B45; Fri,  8 Sep 2006 04:35:31 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060908113531.D43C3401B45@tinman.treke.net>
Date: Fri,  8 Sep 2006 04:35:31 -0700 (PDT)
Subject: [Bug 1399] New: altboot in 3.5.4.1 on collie
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
X-List-Received-Date: Fri, 08 Sep 2006 11:59:54 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1399

           Summary: altboot in 3.5.4.1 on collie
           Product: Openembedded
           Version: OpenZaurus 3.5.4.x
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: trivial
          Priority: P5
         Component: Distributions
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: bugs.openembedded.org@rolf.leggewie.biz
         QAContact: tinderbox-oe@gmx.net


Testing out the 3.5.4.1 release from hrw for collie.

Sorry for reporting something minor.  I installed
http://ewi546.ewi.utwente.nl/tmp/hrw/3.5.4x-experimental/collie/opie-image-3.5.4.1-collie.rootfs.tar.gz
on an image on CF.  altboot created the loop image fine.  But then it
absolutely will not go on unless I enter the "second" altboot menu (the one
from the loop image itself).  The message is "Press <ENTER> to bring up the
altboot menu".  Then, unless I do press ENTER nothing else happens.  altboot
should continue after a time out.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


