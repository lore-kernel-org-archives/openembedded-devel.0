Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GVuZY-0007jJ-5u for openembedded-devel@lists.openembedded.org;
	Fri, 06 Oct 2006 20:37:24 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 4B2BB401C8C; Fri,  6 Oct 2006 11:05:45 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20061006180545.4B2BB401C8C@tinman.treke.net>
Date: Fri,  6 Oct 2006 11:05:45 -0700 (PDT)
Subject: [Bug 1312] Build of libvncserver failed
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
X-List-Received-Date: Fri, 06 Oct 2006 18:37:24 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1312





------- Comment #13 from dp@xora.org.uk  2006-10-06 11:05 -------
Once upon a time they used to be seperate bb's as I got roasted and had my
commits rejected for daring to add x11vnc to libvncserver.

So I commited x11vnc as a seperate .bb

Looks like the situation that existed then still exists now where some people
need them seperate.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


