Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GHxYt-0004Vj-24 for openembedded-devel@lists.openembedded.org;
	Tue, 29 Aug 2006 08:59:03 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id CEB534014D2; Mon, 28 Aug 2006 23:37:16 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060829063716.CEB534014D2@tinman.treke.net>
Date: Mon, 28 Aug 2006 23:37:16 -0700 (PDT)
Subject: [Bug 202] Kernel Module in fbvncserver-kmodule incorectly named
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
X-List-Received-Date: Tue, 29 Aug 2006 06:59:03 -0000

http://bugs.openembedded.org/show_bug.cgi?id=202





------- Comment #6 from openembedded@hrw.one.pl  2006-08-28 23:37 -------
Stefan: which machine you have? 

module is provided for collie and poodle, I can build it also for tosa/3.5.4
but other machines use 2.6 kernel and this module is for 2.4 kernel.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


