Return-Path: <aguirre.nicolas@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5AFAD6AC43
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jun 2015 06:41:15 +0000 (UTC)
Received: by wizo1 with SMTP id o1so91546127wiz.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 May 2015 23:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=snZ63zNUNJSNX9gPomfdH8cA7QVSlWiHvd7glrlp3P4=;
	b=PmleYc5ZUQ7fPmSaC1RyAA/5N9MBoNqxbIJEUeuJm5XAF/Xyl8vbxUGKoeUzGiFGTY
	5Oy+8KIUfNWcypN2jG372vPmMoprVg3bHpd2uRWFzup7KUUvFWFvhLNw/5eX6KSiUW1y
	24pEipqRXB48MdOW3mrUyNlDk7m6dLFooDvXH7vmZRLOb+tDWPwOuEeTpHDbrGHElbp9
	zGWDKaFC11A4Rvc6VIRceF/AKipi3k5uPki2Yjf3CgorWepNHunAEgYC0dfB3GZUJtwT
	HACKZVnkZlAAqStbaq8UIgyAhq1mNUdCbIeu6GSsOx1i3xmYkxacBscPR0IuJQwLRwjN
	ZirA==
X-Received: by 10.180.215.101 with SMTP id oh5mr18304308wic.6.1433140875310;
	Sun, 31 May 2015 23:41:15 -0700 (PDT)
Received: from localhost.localdomain (74.243.118.80.rev.sfr.net.
	[80.118.243.74])
	by mx.google.com with ESMTPSA id c3sm13388993wja.3.2015.05.31.23.41.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 31 May 2015 23:41:14 -0700 (PDT)
From: Nicolas Aguirre <aguirre.nicolas@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Jun 2015 08:41:06 +0200
Message-Id: <1433140867-1089-1-git-send-email-aguirre.nicolas@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH 1/2] mm-common: bump version to 0.9.7
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Jun 2015 06:41:16 -0000

---
 .../recipes-core/mm-common/{mm-common_0.9.6.bb => mm-common_0.9.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/mm-common/{mm-common_0.9.6.bb => mm-common_0.9.7.bb} (51%)

diff --git a/meta-oe/recipes-core/mm-common/mm-common_0.9.6.bb b/meta-oe/recipes-core/mm-common/mm-common_0.9.7.bb
similarity index 51%
rename from meta-oe/recipes-core/mm-common/mm-common_0.9.6.bb
rename to meta-oe/recipes-core/mm-common/mm-common_0.9.7.bb
index f7e2507..8a75cd2 100644
--- a/meta-oe/recipes-core/mm-common/mm-common_0.9.6.bb
+++ b/meta-oe/recipes-core/mm-common/mm-common_0.9.7.bb
@@ -2,8 +2,8 @@ inherit gnomebase
 
 GNOME_COMPRESS_TYPE="xz"
 
-SRC_URI[archive.md5sum] = "3b23749ab39441c392c016ce74632678"
-SRC_URI[archive.sha256sum] = "7c37158a1f37604705a9b9305d3b335fb8256f5de701c8801269dde4e2ce7dde"
+SRC_URI[archive.md5sum] = "a8b7c11db81a72168bf38d88d97df686"
+SRC_URI[archive.sha256sum] = "78f47336f3bdf034a384c59a39cc9f0d566e69e36aa7c9ee3ec0bb6a94bf8b3e"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-- 
1.9.1


