Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GLffk-00051g-7G for openembedded-devel@lists.openembedded.org;
	Fri, 08 Sep 2006 14:41:28 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 89D75401B46; Fri,  8 Sep 2006 05:17:01 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060908121701.89D75401B46@tinman.treke.net>
Date: Fri,  8 Sep 2006 05:17:01 -0700 (PDT)
Subject: [Bug 1402] New: 3.5.4.1 on collie will not bring up the GUI
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
X-List-Received-Date: Fri, 08 Sep 2006 12:41:28 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1402

           Summary: 3.5.4.1 on collie will not bring up the GUI
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


http://ewi546.ewi.utwente.nl/tmp/hrw/3.5.4x-experimental/collie/opie-image-3.5.4.1-collie.rootfs.tar.gz
will boot but not bring up the GUI.

I mounted the loop image on my desktop and set a few things like IP, root
password, etc.  I can not log in via ssh or ping the Z so it looks like
networking is not brought up.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


