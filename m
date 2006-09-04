Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GKLz2-0004b5-LY for openembedded-devel@lists.openembedded.org;
	Mon, 04 Sep 2006 23:27:57 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id EB2C7401B3B; Mon,  4 Sep 2006 14:04:28 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060904210428.EB2C7401B3B@tinman.treke.net>
Date: Mon,  4 Sep 2006 14:04:28 -0700 (PDT)
Subject: [Bug 1383] [PATCH] packages ztenv and libeb
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
X-List-Received-Date: Mon, 04 Sep 2006 21:27:57 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1383





------- Comment #3 from koen@dominion.kabel.utwente.nl  2006-09-04 14:04 -------
after having looked at ztenv (one of those 'last updated 3 years ago' zaurus
apps) and libeb I think it's better to drop the zio patch from libeb and patch
ztenv to use a plain libeb. Having a unmodified libeb would help to add other
viewers ( http://www.hloeffler.info/epwing/epwing_format.html#viewers ) 


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


