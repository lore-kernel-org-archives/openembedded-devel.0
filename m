Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.macdonald@windriver.com>) id 1T8L3x-0002fp-FV
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Sep 2012 03:02:49 +0200
Received: from yow-assmunch-03.corp.ad.wrs.com (yow-jmacdona-d3.wrs.com
	[128.224.147.66])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q830oRp7014519
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 2 Sep 2012 17:50:28 -0700 (PDT)
From: Joe MacDonald <joe.macdonald@windriver.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Sep 2012 20:50:18 -0400
Message-Id: <1346633420-10990-1-git-send-email-joe.macdonald@windriver.com>
X-Mailer: git-send-email 1.7.11.3
Subject: [meta-oe][meta-networking] Migrate dnsmasq
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
X-List-Received-Date: Mon, 03 Sep 2012 01:02:50 -0000

The original proposal for creating meta-networking was to migrate a list of
packages currently in meta-oe.  The first such package to be proposed is
dnsmasq.  The second patch is simply making updates to the recipes based on
recommendations from oe-stylize.py and to fit the whitespace requirements for
oe-core recipes.

-J.



