Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GLTun-0005Gj-Mt for openembedded-devel@lists.openembedded.org;
	Fri, 08 Sep 2006 02:08:13 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id CA785401B45; Thu,  7 Sep 2006 16:43:54 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060907234354.CA785401B45@tinman.treke.net>
Date: Thu,  7 Sep 2006 16:43:54 -0700 (PDT)
Subject: [Bug 1398] New: Missing spectrum24 firmware on poodle's 3.5.4.2RC2
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
X-List-Received-Date: Fri, 08 Sep 2006 00:08:14 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1398

           Summary: Missing spectrum24 firmware on poodle's 3.5.4.2RC2
           Product: Openembedded
           Version: OpenZaurus 3.5.4.x
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Distributions
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: laurent@laurent.ca
         QAContact: tinderbox-oe@gmx.net


OpenZaurus 3.5.4.2RC2 on Poodle (5600).

When I insert my Symbol Spectrum24 LS-4137 CF wifi card, I get this in dmesg:
pccard: PCMCIA card inserted into slot 0
pcmcia: registering new device pcmcia0.0
spectrum_cs: Cannot find firmware: symbol_sp24t_prim_fw
spectrum_cs: Firmware download failed

So the card is unusable.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


