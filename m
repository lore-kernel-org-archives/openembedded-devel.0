Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GHJKd-0007zv-QE for openembedded-devel@lists.openembedded.org;
	Sun, 27 Aug 2006 14:01:39 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id E46B54014D4; Sun, 27 Aug 2006 04:40:20 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060827114020.E46B54014D4@tinman.treke.net>
Date: Sun, 27 Aug 2006 04:40:20 -0700 (PDT)
Subject: [Bug 1316] Touchscreen unstable for Tosa OZ 3.5.4.2 RC1
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
X-List-Received-Date: Sun, 27 Aug 2006 12:01:41 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1316





------- Comment #5 from Dirk@Opfer-Online.de  2006-08-27 04:40 -------
This is a knwon issue.
The lcd disturbs the touch. For a fix we need to sync the touch with the lcd.
I hope we have a patch next week.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


