Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GH2bp-0004LK-KR for openembedded-devel@lists.openembedded.org;
	Sat, 26 Aug 2006 20:10:17 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 229EF4014D2; Sat, 26 Aug 2006 10:49:00 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060826174900.229EF4014D2@tinman.treke.net>
Date: Sat, 26 Aug 2006 10:49:00 -0700 (PDT)
Subject: [Bug 1364] New: localegen errors out with LC_ADDRESS: field `lang_ab' must not be defined
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
X-List-Received-Date: Sat, 26 Aug 2006 18:10:18 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1364

           Summary: localegen errors out with LC_ADDRESS: field `lang_ab'
                    must not be defined
           Product: Openembedded
           Version: Angstrom
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: blocker
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: koen@dominion.kabel.utwente.nl
         QAContact: tinderbox-oe@gmx.net


NOTE: generating locale tt_RU (UTF-8)
NOTE: generating locale so_SO (UTF-8)
NOTE: generating locale so_SO (ISO-8859-1)
NOTE: generating locale gez_ET@abegede (UTF-8)
LC_ADDRESS: field `lang_ab' must not be defined
NOTE: Task failed: localedef returned an error.
NOTE: package glibc-2.4-r10: task do_package: failed
ERROR: TaskFailed event exception, aborting


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


