Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.macdonald@windriver.com>) id 1TWBJL-0006tY-47
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Nov 2012 20:29:30 +0100
Received: from yow-assmunch-03.corp.ad.wrs.com (yow-jmacdona-d3.wrs.com
	[128.224.147.66])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qA7JFQ6Z019564;
	Wed, 7 Nov 2012 11:15:26 -0800 (PST)
From: Joe MacDonald <joe.macdonald@windriver.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Nov 2012 14:15:20 -0500
Message-Id: <1352315721-7792-1-git-send-email-joe.macdonald@windriver.com>
X-Mailer: git-send-email 1.7.11.3
Cc: dennis.hall@windriver.com
Subject: Adding aoetools to meta-networking
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Nov 2012 19:29:31 -0000

This work was actually done by Dennis Hall (copied here) but since he's not yet
on the list, I'm forwarding it for him.

Dennis:  I made a couple of minor changes to your recipe after you sent it to
me, collecting the SRC_URI values into a single block, removing the PRIROITY
field which I think is an artifact from the OE-Classic recipe, and moving
LIC_FILES_CHKSUM to be next to LICENSE.  I think other than those trivial
changes, this is exactly what you sent me.

--
-Joe MacDonald.
:wq



