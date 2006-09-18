Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GPPLt-0006SN-IL for openembedded-devel@lists.openembedded.org;
	Mon, 18 Sep 2006 22:04:25 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id D1FED401B45; Mon, 18 Sep 2006 12:37:20 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060918193720.D1FED401B45@tinman.treke.net>
Date: Mon, 18 Sep 2006 12:37:20 -0700 (PDT)
Subject: [Bug 1422] New: Sudo (sudo-1.6.8p12) fails oe_runconf (configure)
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
X-List-Received-Date: Mon, 18 Sep 2006 20:04:26 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1422

           Summary: Sudo (sudo-1.6.8p12) fails oe_runconf (configure)
           Product: Openembedded
           Version: unspecified
          Platform: ARM
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: joshin@hotmail.com
         QAContact: tinderbox-oe@gmx.net


When building sudo-1.6.8p12 I get the following error:

checking for long long support...
/home/josh/slug/openslug/tmp/work/sudo-1.6.8p12-r0/sudo-1.6.8p12/configure:
line 26554: syntax error near unexpected token `newline'
/home/josh/slug/openslug/tmp/work/sudo-1.6.8p12-r0/sudo-1.6.8p12/configure:
line 26554: `?*'
FATAL: oe_runconf failed


This happens for builds of openzaurus on a 64-bit Amd64 Gentoo system as well
for builds of openslug on a 32-bit P3 Gentoo system.  Koen is having the same
error.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


