Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GGVwE-0006dI-DZ for openembedded-devel@lists.openembedded.org;
	Fri, 25 Aug 2006 09:17:10 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id C3C84401B3F; Thu, 24 Aug 2006 23:56:20 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060825065620.C3C84401B3F@tinman.treke.net>
Date: Thu, 24 Aug 2006 23:56:20 -0700 (PDT)
Subject: [Bug 1357] New: misging dependency for libxine-x11 (libpng)
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
X-List-Received-Date: Fri, 25 Aug 2006 07:17:10 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1357

           Summary: misging dependency for libxine-x11 (libpng)
           Product: Openembedded
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: stv@kirkconsulting.co.uk
         QAContact: tinderbox-oe@gmx.net


seems that libpng is missing off of the dependency list for libxine-x11 (and
possible other libxine providors, although I haven't checked).

simple fix: add libpng to DEPENDS :)


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


