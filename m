Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GImjX-0000Im-Sq for openembedded-devel@lists.openembedded.org;
	Thu, 31 Aug 2006 15:37:28 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id D4001401B3E; Thu, 31 Aug 2006 06:15:06 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060831131506.D4001401B3E@tinman.treke.net>
Date: Thu, 31 Aug 2006 06:15:06 -0700 (PDT)
Subject: [Bug 1375] New: Suspend stops functioning after some time
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
X-List-Received-Date: Thu, 31 Aug 2006 13:38:10 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1375

           Summary: Suspend stops functioning after some time
           Product: Openembedded
           Version: OpenZaurus 3.5.4.x
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P2
         Component: Distributions
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: mail@jeroenhoek.nl
         QAContact: tinderbox-oe@gmx.net


Device: Sharp Zaurus SL-C3200
OS: OpenZaurus 3.5.4.1/GPE
Build: 2006-07-06 08:56

After using the Zaurus for some time, suspend stops functioning. The output of
"apm -v -s", after the screen flashes:

apm: Device or resource busy

I haven't been able to pinpoint what causes suspend to stop functioning. The
only hardware present is a 1gb SD-card. I'm trying to reproduce this error
without the card inserted, but due to the time it takes for the problem to
appear, I haven't succeeded in doing so yet. There is no USB-cable attached.
The problem appears regardless of battery/charging state.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


