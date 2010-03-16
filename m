Received: from smtprelay-h22.telenor.se ([195.54.99.197])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Nre8k-0002qA-EZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 22:17:26 +0100
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-h22.telenor.se (Postfix) with ESMTP id 9915B1474D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Mar 2010 22:14:23 +0100 (CET)
X-SENDER-IP: [83.227.59.242]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AnI+AHeRn0tT4zvyPGdsb2JhbACHYJMjDAEBAQE3LaxvjXSEdgQ
X-IronPort-AV: E=Sophos;i="4.49,652,1262559600"; d="scan'208";a="51335656"
Received: from c-f23be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost.localdomain) ([83.227.59.242])
	by ipb2.telenor.se with ESMTP; 16 Mar 2010 22:14:18 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Mar 2010 22:14:18 +0100
Message-Id: <1268774058-15518-1-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.6.0.2
X-SA-Exim-Connect-IP: 195.54.99.197
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH 1/1] at91-l9260.conf: Fix spelling error
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
X-List-Received-Date: Tue, 16 Mar 2010 21:17:26 -0000

Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
 conf/machine/at91-l9260.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/at91-l9260.conf b/conf/machine/at91-l9260.conf
index f95fb2d..3dbbc0a 100644
--- a/conf/machine/at91-l9260.conf
+++ b/conf/machine/at91-l9260.conf
@@ -1,6 +1,6 @@
 #@TYPE: Machine
 #@Name: Olimex eval board for the AT91SAM9260
-#@DESCRIPTION: Machine.inciguration for the AT91SAM9260 development board with a at91sam9260 processor
+#@DESCRIPTION: Machine configuration for the AT91SAM9260 development board with a at91sam9260 processor
 
 TARGET_ARCH = "arm"
 
-- 
1.6.0.2



