Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9CA4060657
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 18:24:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9MIOPXY024136
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 11:24:25 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 22 Oct 2015 11:24:25 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <randy.macleod@windriver.com>
Date: Thu, 22 Oct 2015 11:24:25 -0700
Message-ID: <1445538265-14160-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/1] libmodbus: version 3.0.5 -> 3.0.6
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
X-List-Received-Date: Thu, 22 Oct 2015 18:24:27 -0000
Content-Type: text/plain

Rename recipe then change md5sum and sha256sum.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../{libmodbus_3.0.5.bb => libmodbus_3.0.6.bb}     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/libmodbus/{libmodbus_3.0.5.bb => libmodbus_3.0.6.bb} (76%)

diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.5.bb b/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.6.bb
similarity index 76%
rename from meta-oe/recipes-extended/libmodbus/libmodbus_3.0.5.bb
rename to meta-oe/recipes-extended/libmodbus/libmodbus_3.0.6.bb
index 19ca24c..c5e6ae8 100644
--- a/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.5.bb
+++ b/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.6.bb
@@ -12,5 +12,5 @@ SRC_URI = "http://libmodbus.org/site_media/build/${BP}.tar.gz"
 
 inherit autotools pkgconfig
 
-SRC_URI[md5sum] = "18860375a7aa0ca9cba7d6ece54ab666"
-SRC_URI[sha256sum] = "19aad5d55fa315602d6e836a858a3802f1608f9d824afba05fa12a58a1b1e656"
+SRC_URI[md5sum] = "c80f88b6ca19cabc4ceffc195ca07771"
+SRC_URI[sha256sum] = "046d63f10f755e2160dc56ef681e5f5ad3862a57c1955fd82e0ce036b69471b6"
-- 
1.7.9.5


