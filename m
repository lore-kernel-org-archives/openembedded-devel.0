Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GTGZV-0004L7-CC for openembedded-devel@lists.openembedded.org;
	Fri, 29 Sep 2006 13:30:25 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 20CA4401B48; Fri, 29 Sep 2006 04:00:42 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060929110042.20CA4401B48@tinman.treke.net>
Date: Fri, 29 Sep 2006 04:00:42 -0700 (PDT)
Subject: [Bug 1361] Compile error while building cyrus-imapd-2.2.12 with gcc4
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
X-List-Received-Date: Fri, 29 Sep 2006 11:30:25 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1361


nail@nslu2-linux.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |FIXED




------- Comment #3 from nail@nslu2-linux.org  2006-09-29 04:00 -------
Fix works for me. Committed in revision
a2ec817a8f25ad1adffa3c3df93d4ca4892612be


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


