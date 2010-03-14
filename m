Received: from smtprelay-b12.telenor.se ([62.127.194.21])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Nqx7X-0006Hr-Fo
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 00:21:24 +0100
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-b12.telenor.se (Postfix) with ESMTP id 46D6AF994
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 00:18:18 +0100 (CET)
X-SMTPAUTH-B2: 
X-SENDER-IP: 83.227.59.242
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Akk4AA8LnUtT4zvyPGdsb2JhbACaaQwBAQEBNy2qFowfhHsE
X-IronPort-AV: E=Sophos;i="4.49,639,1262559600"; d="scan'208";a="50125773"
Received: from c-f23be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost.localdomain) ([83.227.59.242])
	by ipb2.telenor.se with ESMTP; 15 Mar 2010 00:18:17 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Mar 2010 00:18:16 +0100
Message-Id: <1268608696-31002-2-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.6.0.2
In-Reply-To: <1268608696-31002-1-git-send-email-ulf.samuelsson@atmel.com>
References: <1268608696-31002-1-git-send-email-ulf.samuelsson@atmel.com>
X-SA-Exim-Connect-IP: 62.127.194.21
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_SOFTFAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH 2/2] conf/checksum.ini: at91 linux + u-boot-2009.11
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
X-List-Received-Date: Sun, 14 Mar 2010 23:21:25 -0000

Add checksums for:
2.6.30-exp.2.patch.bz2
u-boot-2009.11.tar.bz2

Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
 conf/checksums.ini |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 70346bf..ba3b697 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -74,6 +74,10 @@ sha256=7a960180e7873b1bdb522e76b0423b5c2c1b8efe1d30d7ca80c41eb97d822b2d
 md5=f13ab353b11329ce3d605b6f40e77fa6
 sha256=41991e8aa2e5fe8e5dfd47b1e5c446fa03c3ee96a5eae54fd6ec15d1d9afef30
 
+[ftp://www.at91.com/pub/buildroot/2.6.30-exp.2.patch.bz2]
+md5=770c7a2bfb925111a8c0e0d4c8c4764e
+sha256=58894965b253eae0c4caacedc3463cf186c18431ca0d71b767a3b36aa40ec388
+
 [http://maxim.org.za/AT91RM9200/2.6/2.6.31-at91.patch.gz]
 md5=bf420f0340e30b0a2c42b2b36d0b2577
 sha256=738b88daa31e1a033646900813a5f1ce40ba21e2836500fd848a984565f27584
@@ -27022,6 +27026,10 @@ sha256=b0037cf21b67779ef5a0c585b32e46bde3b78df889484c78bb4318c9b448f560
 md5=cd4788ea1c6ac4f9b100b888a1063a6b
 sha256=858fd04efd5b98e99fd1a074998b1a8ac5fbd07b176de1d20d8eb148492d949d
 
+[ftp://ftp.denx.de/pub/u-boot/u-boot-2009.11.tar.bz2]
+md5=d94700614225f53c853dfe714eb5fa47
+sha256=066615314fc90a314823ac975ca2a525a51fdad41802f4088a3a21ce073e8de6
+
 [http://linux.omap.com/pub/bootloader/2430sdp/source/u-boot-SEP1106.tar.gz]
 md5=49c07dec9e1be69fd01d46f47ec03731
 sha256=a090786113b02647413ebc15888af269f2e6d50f73cbb94b0619cc1702911dae
-- 
1.6.0.2



