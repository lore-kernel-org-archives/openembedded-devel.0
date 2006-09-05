Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GKUEU-0004TY-Bx for openembedded-devel@lists.openembedded.org;
	Tue, 05 Sep 2006 08:16:26 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 89E544014D4; Mon,  4 Sep 2006 22:52:49 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060905055249.89E544014D4@tinman.treke.net>
Date: Mon,  4 Sep 2006 22:52:49 -0700 (PDT)
Subject: [Bug 1384] New: Firefox: package problem
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
X-List-Received-Date: Tue, 05 Sep 2006 06:16:27 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1384

           Summary: Firefox: package problem
           Product: Openembedded
           Version: OpenZaurus 3.5.4.x
          Platform: ARM
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Distributions
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: re-miel@runbox.com
         QAContact: tinderbox-oe@gmx.net


When installing "firefox" (firefox_1.0.6-r0, OZ 3.5.4.1) package on Akita, it
attemps to directly chmod '/usr/bin/firefox' in postinst.sh. Which causes an
error when installing to SD or CF. Could it be fixed to use relative path..?


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


