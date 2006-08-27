Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GHIUr-0006JV-4W for openembedded-devel@lists.openembedded.org;
	Sun, 27 Aug 2006 13:08:09 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id D44AE4014D2; Sun, 27 Aug 2006 03:46:50 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060827104650.D44AE4014D2@tinman.treke.net>
Date: Sun, 27 Aug 2006 03:46:50 -0700 (PDT)
Subject: [Bug 1366] New: Python* is missing appropriate PACKAGES_DYNAMIC
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
X-List-Received-Date: Sun, 27 Aug 2006 11:08:09 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1366

           Summary: Python* is missing appropriate PACKAGES_DYNAMIC
           Product: Openembedded
           Version: Angstrom
          Platform: Other
        OS/Version: Mac OS X 10.0
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: koen@dominion.kabel.utwente.nl
         QAContact: tinderbox-oe@gmx.net


ERROR: No providers of runtime build target python-mime after filtering (for
['/home/koen/OE/monotone/org.openembedded.dev/packages/python/python_2.4.3.bb'])NOTE:
Removing failed runtime build target python-mime
ERROR: No providers of runtime build target python-datetime after filtering
(for
['/home/koen/OE/monotone/org.openembedded.dev/packages/python/python_2.4.3.bb'])NOTE:
Removing failed runtime build target python-datetime
ERROR: No providers of runtime build target python-logging after filtering (for
['/home/koen/OE/monotone/org.openembedded.dev/packages/python/python_2.4.3.bb'])NOTE:
Removing failed runtime build target python-logging
ERROR: No providers of runtime build target python-netclient after filtering
(for
['/home/koen/OE/monotone/org.openembedded.dev/packages/python/python_2.4.3.bb'])NOTE:
Removing failed runtime build target python-netclient
ERROR: No providers of runtime build target python-tkinter after filtering (for
['/home/koen/OE/monotone/org.openembedded.dev/packages/python/python_2.4.3.bb'])NOTE:
Removing failed runtime build target python-tkinter


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


