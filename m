Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GLQAG-0001uP-SJ for openembedded-devel@lists.openembedded.org;
	Thu, 07 Sep 2006 22:07:57 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id A4D64401B45; Thu,  7 Sep 2006 12:43:44 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060907194344.A4D64401B45@tinman.treke.net>
Date: Thu,  7 Sep 2006 12:43:44 -0700 (PDT)
Subject: [Bug 1397] New: 3.5.4.2 rc 2, tosa - wifi LED constantly on (irregular steady or blink)
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
X-List-Received-Date: Thu, 07 Sep 2006 20:07:57 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1397

           Summary: 3.5.4.2 rc 2, tosa - wifi LED constantly on (irregular
                    steady or blink)
           Product: Openembedded
           Version: OpenZaurus 3.5.4.x
          Platform: ARM
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: bazmi.husain@gmail.com
         QAContact: tinderbox-oe@gmx.net


in 3.5.4.2 rc2 tosa with opie image (same with gpe image) the wifi LED is
constantly on even after ifdown wlan0. ifup properly brings the wifi up and
wifidown brings the interface down but LED remains lit - sometimes steady and
sometimes blinking


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


