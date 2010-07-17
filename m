Received: from smtp202.alice.it ([82.57.200.98])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1Oa8vo-0000FJ-Ve
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Jul 2010 17:04:01 +0200
Received: from localhost.localdomain (95.232.142.62) by smtp202.alice.it
	(8.5.124.08) (authenticated as editempo@alice.it)
	id 4C1A2A7C005F757F for openembedded-devel@lists.openembedded.org;
	Sat, 17 Jul 2010 17:03:54 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Jul 2010 17:03:23 +0200
Message-Id: <1279379004-15038-1-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 82.57.200.98
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] fix pulling initscripts in keymaps
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
X-List-Received-Date: Sat, 17 Jul 2010 15:04:03 -0000


Hi,
I've an issue with initscripts(instead of my specific distro initscript)
 beeing pulled by keymaps.

As it may be considered core, Here's a patch attached.

Denis.



