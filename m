Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GMoVI-0000fY-Sv for openembedded-devel@lists.openembedded.org;
	Mon, 11 Sep 2006 18:19:25 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id F1659401B45; Mon, 11 Sep 2006 08:54:13 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060911155413.F1659401B45@tinman.treke.net>
Date: Mon, 11 Sep 2006 08:54:13 -0700 (PDT)
Subject: [Bug 1410] Boost DEPENDs on Python and thus on x11
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
X-List-Received-Date: Mon, 11 Sep 2006 16:19:25 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1410





------- Comment #2 from openembedded@hrw.one.pl  2006-09-11 08:54 -------
You can build libx11 even if your machine does not support running them (on
device without remote control). Only python-thinker will depend on x11 libs and
noone force you to use them.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


