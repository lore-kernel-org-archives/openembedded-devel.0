Received: from smtprelay-h12.telenor.se ([62.127.194.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1NqDMi-00017r-18
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Mar 2010 23:30:00 +0100
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-h12.telenor.se (Postfix) with ESMTP id 64CEE241F0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Mar 2010 23:26:59 +0100 (CET)
X-SMTPAUTH-B2: 
X-SENDER-IP: 83.227.59.242
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Ao85AL9OmktT4zvyPGdsb2JhbACHYZMIDAEBAQE3La42jVSEewQ
X-IronPort-AV: E=Sophos;i="4.49,628,1262559600"; d="scan'208";a="49492110"
Received: from c-f23be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost.localdomain) ([83.227.59.242])
	by ipb1.telenor.se with ESMTP; 12 Mar 2010 23:26:56 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Mar 2010 23:26:55 +0100
Message-Id: <1268432815-4556-2-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.6.0.2
In-Reply-To: <1268432815-4556-1-git-send-email-ulf.samuelsson@atmel.com>
References: <1268432815-4556-1-git-send-email-ulf.samuelsson@atmel.com>
X-SA-Exim-Connect-IP: 62.127.194.5
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_SOFTFAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH] at91sam9-image: Add real author of file
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
X-List-Received-Date: Fri, 12 Mar 2010 22:30:01 -0000

From: Nicolas Ferre <nicolas.ferre@atmel.com>

The previous commit lacked --author="Nicolas Ferre <nicolas.ferre@atmel.com>
Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
 recipes/images/x11-at91sam9-image.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/images/x11-at91sam9-image.bb b/recipes/images/x11-at91sam9-image.bb
index 663d824..c2bd723 100755
--- a/recipes/images/x11-at91sam9-image.bb
+++ b/recipes/images/x11-at91sam9-image.bb
@@ -32,8 +32,8 @@ ANGSTROM_EXTRA_INSTALL += " \
 	dosfstools \
 	mtd-utils \
 	multimedia \
-#	nbench-byte \
 	gpe-mini-browser \
+#	nbench-byte \
 #	pointercal \
 	"
 
-- 
1.6.0.2



