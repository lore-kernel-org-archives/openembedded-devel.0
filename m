Received: from smtprelay-h22.telenor.se ([195.54.99.197])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1NqDAL-0004Uu-Ny
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Mar 2010 23:17:14 +0100
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-h22.telenor.se (Postfix) with ESMTP id 4CCBDCE22
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Mar 2010 23:14:08 +0100 (CET)
X-SMTPAUTH-B2: 
X-SENDER-IP: 83.227.59.242
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AuY3AO9LmktT4zvyPGdsb2JhbACaaQwBAQEBNy2uNY1XhHsE
X-IronPort-AV: E=Sophos;i="4.49,628,1262559600"; d="scan'208";a="49449879"
Received: from c-f23be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost.localdomain) ([83.227.59.242])
	by ipb2.telenor.se with ESMTP; 12 Mar 2010 23:14:07 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Mar 2010 23:14:06 +0100
Message-Id: <1268432046-4052-2-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.6.0.2
In-Reply-To: <1268432046-4052-1-git-send-email-ulf.samuelsson@atmel.com>
References: <1268432046-4052-1-git-send-email-ulf.samuelsson@atmel.com>
X-SA-Exim-Connect-IP: 195.54.99.197
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH] fbv-1.0: Bump recipe version
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
X-List-Received-Date: Fri, 12 Mar 2010 22:17:14 -0000

Forgot to bump recipe version in previous patch
Signe-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
 recipes/fbv/fbv_1.0b.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/fbv/fbv_1.0b.bb b/recipes/fbv/fbv_1.0b.bb
index 4a5bd6b..ba7cc06 100644
--- a/recipes/fbv/fbv_1.0b.bb
+++ b/recipes/fbv/fbv_1.0b.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Frame Buffer Viewer"
 LICENSE = "GPL"
 DEPENDS = "libpng jpeg"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://s-tech.elsat.net.pl/fbv/fbv-1.0b.tar.gz \
 	file://cross_compile.patch;patch=1 \
-- 
1.6.0.2



