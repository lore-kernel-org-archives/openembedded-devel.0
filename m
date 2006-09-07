Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GLNss-0008O2-0w for openembedded-devel@lists.openembedded.org;
	Thu, 07 Sep 2006 19:41:50 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id E19E3401B46; Thu,  7 Sep 2006 10:17:28 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060907171728.E19E3401B46@tinman.treke.net>
Date: Thu,  7 Sep 2006 10:17:28 -0700 (PDT)
Subject: [Bug 1391] minimo package bit rotted badly
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
X-List-Received-Date: Thu, 07 Sep 2006 17:41:50 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1391





------- Comment #11 from koen@dominion.kabel.utwente.nl  2006-09-07 10:17 -------
after installing it I noticed this directory in my rootfs contained the mozilla
bits:

/data/build/koen/OE/build/tmp/angstrom/work/armv5te-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/

I don't think that's correct, and it also contains the debug entries.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


