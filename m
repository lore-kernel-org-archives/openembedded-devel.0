Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GHHln-00065l-Cv for openembedded-devel@lists.openembedded.org;
	Sun, 27 Aug 2006 12:21:35 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 8069B4014D4; Sun, 27 Aug 2006 03:00:17 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060827100017.8069B4014D4@tinman.treke.net>
Date: Sun, 27 Aug 2006 03:00:17 -0700 (PDT)
Subject: [Bug 1115] libgcrypt_1.2.2.bb fails to compile with MACHINE=native
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
X-List-Received-Date: Sun, 27 Aug 2006 10:21:36 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1115


bugs.openembedded.org@rolf.leggewie.biz changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bugs.openembedded.org@rolf.l
                   |                            |eggewie.biz




------- Comment #2 from bugs.openembedded.org@rolf.leggewie.biz  2006-08-27 03:00 -------
Yamamoto-san,

it builds fine here straight from the OE tree.  But maybe that is because I
just changed the machine variable to native in conf/local.conf without cleaning
out tmp/  Nonetheless, can you please verify this problem still exists?  Thank
you.

Regards

Rolf


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


