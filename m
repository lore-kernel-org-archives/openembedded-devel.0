Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GMo8c-0000RD-Di for openembedded-devel@lists.openembedded.org;
	Mon, 11 Sep 2006 17:55:58 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id C95A2401B45; Mon, 11 Sep 2006 08:30:47 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060911153047.C95A2401B45@tinman.treke.net>
Date: Mon, 11 Sep 2006 08:30:47 -0700 (PDT)
Subject: [Bug 1410] Boost DEPENDs on Python and thus on x11
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
X-List-Received-Date: Mon, 11 Sep 2006 15:55:58 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1410





------- Comment #1 from di@fh-wedel.de  2006-09-11 08:30 -------
Alternatively: make this a python issue: why does python have to depend on x11?
Maybe we need to distinguish between python an python-with-tkinter here?


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


