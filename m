Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GKdX8-0000KC-0T for openembedded-devel@lists.openembedded.org;
	Tue, 05 Sep 2006 18:12:18 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id C617D4014D4; Tue,  5 Sep 2006 08:48:34 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060905154834.C617D4014D4@tinman.treke.net>
Date: Tue,  5 Sep 2006 08:48:34 -0700 (PDT)
Subject: [Bug 1387] New: 3.5.4.2RC2 Tosa - system lockup at screen calibration
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
X-List-Received-Date: Tue, 05 Sep 2006 16:12:19 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1387

           Summary: 3.5.4.2RC2 Tosa - system lockup at screen calibration
           Product: Openembedded
           Version: OpenZaurus 3.5.4.x
          Platform: ARM
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P2
         Component: Distributions
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: bazmi.husain@gmail.com
         QAContact: tinderbox-oe@gmx.net


after flashing with RC2 and then resetting (after taking out CF & SD cards) the
system boots till the calibration screen with wifi LED blinking (i have a WEP
enabled hidden network at home). and then locks up completely. screen doesnt
respond at all. suspending using power button works but upon resume screen
remains blank. resetting results in the same situation.

with RC1, the behaviour of lockup was there after the last cursor press on
calib screen but resetting the machine allowed resuming beyond the calibration.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


