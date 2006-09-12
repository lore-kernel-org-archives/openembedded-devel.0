Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GN9uZ-0002Ww-4U for openembedded-devel@lists.openembedded.org;
	Tue, 12 Sep 2006 17:10:55 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id B2CFC401B45; Tue, 12 Sep 2006 07:45:29 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060912144529.B2CFC401B45@tinman.treke.net>
Date: Tue, 12 Sep 2006 07:45:29 -0700 (PDT)
Subject: [Bug 1413] package ntp is not created
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
X-List-Received-Date: Tue, 12 Sep 2006 15:10:55 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1413


pmiscml@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |pmiscml@gmail.com
             Status|ASSIGNED                    |NEW




------- Comment #2 from pmiscml@gmail.com  2006-09-12 07:45 -------
Not exactly, this is not related to runstrip(). This is due to duplicate
package declaration, I'm working on this.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


