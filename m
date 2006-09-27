Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GSNkZ-0004xj-20 for openembedded-devel@lists.openembedded.org;
	Wed, 27 Sep 2006 02:58:11 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 13257401B46; Tue, 26 Sep 2006 17:29:05 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060927002905.13257401B46@tinman.treke.net>
Date: Tue, 26 Sep 2006 17:29:05 -0700 (PDT)
Subject: [Bug 1385] "perl-module-encode" and "perl-module-encode-alias" dependency problem
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
X-List-Received-Date: Wed, 27 Sep 2006 00:58:11 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1385





------- Comment #1 from lenehan@twibble.org  2006-09-26 17:29 -------
You should be able to install them if you ask ipkg to install them both at the
same time. I've checked the dependencies and it appears that they are correct
in that each one does depend on the other.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


