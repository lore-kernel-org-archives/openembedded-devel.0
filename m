Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GHU2S-0002GW-9j for openembedded-devel@lists.openembedded.org;
	Mon, 28 Aug 2006 01:27:36 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 0EFD94014D2; Sun, 27 Aug 2006 16:06:06 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060827230606.0EFD94014D2@tinman.treke.net>
Date: Sun, 27 Aug 2006 16:06:06 -0700 (PDT)
Subject: [Bug 1110] env variable MAKEFLAGS should not be propagated into bitbake subprocesses
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
X-List-Received-Date: Sun, 27 Aug 2006 23:27:36 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1110





------- Comment #2 from bugs.openembedded.org@rolf.leggewie.biz  2006-08-27 16:06 -------
For an example of a package which disables parallel compilation take a look at
packages/kdepimpi/kdepimpi-base.inc


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


