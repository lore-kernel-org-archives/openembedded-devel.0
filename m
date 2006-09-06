Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GKn2a-0006vx-VC for openembedded-devel@lists.openembedded.org;
	Wed, 06 Sep 2006 04:21:25 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 1E1AB401B2B; Tue,  5 Sep 2006 18:57:35 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060906015735.1E1AB401B2B@tinman.treke.net>
Date: Tue,  5 Sep 2006 18:57:35 -0700 (PDT)
Subject: [Bug 1388] New: sound problem with the rc2 release on SL-5600
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
X-List-Received-Date: Wed, 06 Sep 2006 02:21:26 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1388

           Summary: sound problem with the rc2 release on SL-5600
           Product: Openembedded
           Version: OpenZaurus 3.5.4.x
          Platform: ARM
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: michael_barnes@programmer.net
         QAContact: tinderbox-oe@gmx.net


I just flashed the latest 2.6 release; rc2. I'm running an SL-5600 (poodle). I
am using the GPE image. the sound does not work on my PDA, but works perfectly
with the previous rc1 release of the 2.6 kernel. I've tried mplayer and gxine,
using all available audio outputs (oss, alsa, pcm, etc...) and there is no
sound.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


