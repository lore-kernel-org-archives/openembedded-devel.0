Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GShs6-000491-TB for openembedded-devel@lists.openembedded.org;
	Thu, 28 Sep 2006 00:27:19 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 25A58401B45; Wed, 27 Sep 2006 14:57:55 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060927215755.25A58401B45@tinman.treke.net>
Date: Wed, 27 Sep 2006 14:57:55 -0700 (PDT)
Subject: [Bug 1443] New: glibc-intermediate_2.4 does not build
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
X-List-Received-Date: Wed, 27 Sep 2006 22:27:19 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1443

           Summary: glibc-intermediate_2.4 does not build
           Product: Openembedded
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P3
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: philip@balister.org
         QAContact: tinderbox-oe@gmx.net


From a suggestion by XorA on #oe I commented out two patched from the
glibc_2.4bb file:

openat-bugzilla-fix-1220
fix-chownat-20060808

and glibc-intermediate built again


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


