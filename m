Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GKMBW-0004ga-8M for openembedded-devel@lists.openembedded.org;
	Mon, 04 Sep 2006 23:40:50 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id DF2FE4014D4; Mon,  4 Sep 2006 14:17:22 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060904211722.DF2FE4014D4@tinman.treke.net>
Date: Mon,  4 Sep 2006 14:17:22 -0700 (PDT)
Subject: [Bug 1383] [PATCH] packages ztenv and libeb
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
X-List-Received-Date: Mon, 04 Sep 2006 21:40:51 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1383





------- Comment #4 from bugs.openembedded.org@rolf.leggewie.biz  2006-09-04 14:17 -------
While I generally agree with the direction that koen is proposing, I think it
might nonetheless be a good idea to include what we have now.  My reasoning is
as follows.

* release early and often so others have something to play with
* zten is still the benchmark app for dictionary lookup in the Japanese world
AFAIK
* eblookup is available from ozja and works with the patched libeb
* the only other alternatives possibly (!) available to OE are thus ebview and
gxdic of which I have never heard


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


