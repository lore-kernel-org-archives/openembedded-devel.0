Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GNB5J-00047o-88 for openembedded-devel@lists.openembedded.org;
	Tue, 12 Sep 2006 18:26:05 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 03680401B45; Tue, 12 Sep 2006 09:00:38 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060912160039.03680401B45@tinman.treke.net>
Date: Tue, 12 Sep 2006 09:00:38 -0700 (PDT)
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
X-List-Received-Date: Tue, 12 Sep 2006 16:26:05 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1110


bugs.openembedded.org@rolf.leggewie.biz changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|Build                       |BitBake
            Product|Openembedded                |BitBake




------- Comment #5 from bugs.openembedded.org@rolf.leggewie.biz  2006-09-12 09:00 -------
I think, yours is a bitbake problem.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


