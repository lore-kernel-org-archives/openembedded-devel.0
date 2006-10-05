Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GVV3Y-0003jg-Bc for openembedded-devel@lists.openembedded.org;
	Thu, 05 Oct 2006 17:22:40 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 9B9C3401B45; Thu,  5 Oct 2006 07:51:18 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20061005145118.9B9C3401B45@tinman.treke.net>
Date: Thu,  5 Oct 2006 07:51:18 -0700 (PDT)
Subject: [Bug 1455] New: Patches to fix gtk-engines hardcoded GTK+ binary version
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
X-List-Received-Date: Thu, 05 Oct 2006 15:22:40 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1455

           Summary: Patches to fix gtk-engines hardcoded GTK+ binary version
           Product: Openembedded
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: dp@xora.org.uk
         QAContact: tinderbox-oe@gmx.net


Here, is a .bbclass and a diff to gtk-engines to make it work wether the gtk+
binary version is 2.4.0 (as 2.6.X is) or 2.10.0 (as 2.10.X is).

I thought I would post here for comments as my python is terrible.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


