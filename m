Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GSNX0-0004la-Sg for openembedded-devel@lists.openembedded.org;
	Wed, 27 Sep 2006 02:44:11 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 77EB2401B45; Tue, 26 Sep 2006 17:15:04 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060927001504.77EB2401B45@tinman.treke.net>
Date: Tue, 26 Sep 2006 17:15:04 -0700 (PDT)
Subject: [Bug 1091] ipkg list packages twice in certain circumstances
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
X-List-Received-Date: Wed, 27 Sep 2006 00:44:11 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1091


bugs.openembedded.org@rolf.leggewie.biz changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




------- Comment #4 from bugs.openembedded.org@rolf.leggewie.biz  2006-09-26 17:15 -------
hh.org bugzilla restructured:

http://bugzilla.handhelds.org/show_bug.cgi?id=1696

Fixed upstream.  ipkg will show the architecture to avoid confusion.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


