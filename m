Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GNbGP-0003a7-5n for openembedded-devel@lists.openembedded.org;
	Wed, 13 Sep 2006 22:23:17 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id D3FE9401B49; Wed, 13 Sep 2006 12:57:28 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060913195728.D3FE9401B49@tinman.treke.net>
Date: Wed, 13 Sep 2006 12:57:28 -0700 (PDT)
Subject: [Bug 1326] libpng doesn't build for x86
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
X-List-Received-Date: Wed, 13 Sep 2006 20:23:17 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1326





------- Comment #9 from heinold@inf.fu-berlin.de  2006-09-13 12:57 -------
One solution is to "sed" the right paths into libpng-config before
install-stage.       Unfortunately I stupid overwrite my solution yesterday
which took care of this problem.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


