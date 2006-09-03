Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GJuE3-0004t6-8Z for openembedded-devel@lists.openembedded.org;
	Sun, 03 Sep 2006 17:49:35 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 1BF5A4014D2; Sun,  3 Sep 2006 08:26:27 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060903152627.1BF5A4014D2@tinman.treke.net>
Date: Sun,  3 Sep 2006 08:26:27 -0700 (PDT)
Subject: [Bug 1376] cairo 1.2.4 + cairo-fixed.patch fails to render
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
X-List-Received-Date: Sun, 03 Sep 2006 15:49:35 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1376





------- Comment #7 from mreimer@vpop.net  2006-09-03 08:26 -------
I was using xserver-kdrive-fbdev, gtk+-2.8.9/2.8.16, and cairo 1.2.2/1.2.4. Gtk
version didn't matter. Downgrading to cairo 1.2.2 fixed the problem, as did
1.2.4 when not using the patch.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


