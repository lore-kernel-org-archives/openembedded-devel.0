Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GHxJp-0004Pn-CT for openembedded-devel@lists.openembedded.org;
	Tue, 29 Aug 2006 08:43:29 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 53C864014D4; Mon, 28 Aug 2006 23:21:43 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060829062143.53C864014D4@tinman.treke.net>
Date: Mon, 28 Aug 2006 23:21:43 -0700 (PDT)
Subject: [Bug 1341] kernel-module-pcnet-cs-2.6 depends on kernel-module-8390-2.6
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
X-List-Received-Date: Tue, 29 Aug 2006 06:43:29 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1341


openembedded@hrw.one.pl changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
         Resolution|                            |FIXED




------- Comment #4 from openembedded@hrw.one.pl  2006-08-28 23:21 -------
http://ewi546.ewi.utwente.nl/tmp/hrw/t/bootstrap-image-3.5.4.2-rc2-tosa.rootfs.tar.gz
is one of my 3.5.4.2-rc2 test images for tosa - it was built 2006.08.17 and it
contain all needed dependencies on kernel module pcnet-cs.

It was built with OE without any local unpushed patches.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


