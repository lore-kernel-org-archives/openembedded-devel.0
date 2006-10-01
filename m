Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GTpTb-00065s-UT for openembedded-devel@lists.openembedded.org;
	Sun, 01 Oct 2006 02:46:40 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id D809B401B45; Sat, 30 Sep 2006 17:16:28 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20061001001628.D809B401B45@tinman.treke.net>
Date: Sat, 30 Sep 2006 17:16:28 -0700 (PDT)
Subject: [Bug 1425] libfontconfig picks up host's /usr/lib/libz.la (but then fails)
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
X-List-Received-Date: Sun, 01 Oct 2006 00:46:40 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1425


likewise@gmx.net changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |INVALID




------- Comment #1 from likewise@gmx.net  2006-09-30 17:16 -------
Although the error does indeed occur, it is a chainr eaction of the bitbake
process failing earlier, but not bailing out.

As I have no clear idea where the chain reaction starts, I cannot file a new
bug currently.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


