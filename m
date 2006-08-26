Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GGzBN-0005oR-0j for openembedded-devel@lists.openembedded.org;
	Sat, 26 Aug 2006 16:30:45 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 8F3A24014D2; Sat, 26 Aug 2006 07:09:35 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060826140935.8F3A24014D2@tinman.treke.net>
Date: Sat, 26 Aug 2006 07:09:35 -0700 (PDT)
Subject: [Bug 1360] New: Build error in Subversion 1.3.2
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
X-List-Received-Date: Sat, 26 Aug 2006 14:30:46 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1360

           Summary: Build error in Subversion 1.3.2
           Product: Openembedded
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: yuecelm@ee.ethz.ch
         QAContact: tinderbox-oe@gmx.net


I get an error in the stage phase while building version 1.3.2 of Subversion.
An error dump is included in the attachment section. I dont really understand
why the library apr-util cannot be find. This issue was not observed by older
versions.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


