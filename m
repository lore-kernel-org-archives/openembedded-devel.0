Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GH0Dp-0002Tv-5K for openembedded-devel@lists.openembedded.org;
	Sat, 26 Aug 2006 17:37:21 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 46DC9401B3B; Sat, 26 Aug 2006 08:16:15 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060826151615.46DC9401B3B@tinman.treke.net>
Date: Sat, 26 Aug 2006 08:16:15 -0700 (PDT)
Subject: [Bug 1362] Meta-bug: Get some of the goodies from openzaurus-ja into OE itself
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
X-List-Received-Date: Sat, 26 Aug 2006 15:37:21 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1362


bugs.openembedded.org@rolf.leggewie.biz changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED




------- Comment #1 from bugs.openembedded.org@rolf.leggewie.biz  2006-08-26 08:16 -------
One comment I received from main devs at OE.  You guys at openzaurus-ja tend to
name your bb files ozja-$PN-$PV.bb which as I was told creates problems in OE
and bitbake.  Just name your bb files $PN-$PV.bb

$PN: name of the package
$PV: version of the package


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


