Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GJWEv-0006u2-0I for openembedded-devel@lists.openembedded.org;
	Sat, 02 Sep 2006 16:12:53 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 230E1401B3E; Sat,  2 Sep 2006 06:50:01 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060902135001.230E1401B3E@tinman.treke.net>
Date: Sat,  2 Sep 2006 06:50:01 -0700 (PDT)
Subject: [Bug 1380] HEAD uClibc build fails on uClibc install
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
X-List-Received-Date: Sat, 02 Sep 2006 14:12:53 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1380





------- Comment #1 from jonesml@fastmail.to  2006-09-02 06:50 -------
By the way, libcrt1.o does seem to exist in the WORKDIR/uClibc-0.9.28/lib
directory, but for whatever reason isn't found by the linker.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


