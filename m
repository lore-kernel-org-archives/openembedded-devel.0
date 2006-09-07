Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GLQ5s-0001sD-4M for openembedded-devel@lists.openembedded.org;
	Thu, 07 Sep 2006 22:03:24 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 05F2D401B45; Thu,  7 Sep 2006 12:39:12 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060907193912.05F2D401B45@tinman.treke.net>
Date: Thu,  7 Sep 2006 12:39:12 -0700 (PDT)
Subject: [Bug 1396] New: 3.5.4.2 rc 2 tosa wakes-up from suspend when power is connected
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
X-List-Received-Date: Thu, 07 Sep 2006 20:03:24 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1396

           Summary: 3.5.4.2 rc 2 tosa wakes-up from suspend when power is
                    connected
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


in 3.5.4.2 rc 2 with opie image on tosa (6000L), if the unit is suspended and
then the power plugged in, the unit wakes up and the charging LED goes off.
unit has to be suspended again for the charging to begin (and the charging
light to come on)


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


