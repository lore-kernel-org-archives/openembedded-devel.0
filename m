Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3415960068
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 09:49:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w5R9nNQV005116
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 02:49:23 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 27 Jun 2018 02:49:22 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 27 Jun 2018 02:49:11 -0700
Message-ID: <20180627094922.109996-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 01/13] liblogging: upgrade to 1.0.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jun 2018 09:49:23 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../liblogging/{liblogging_1.0.5.bb => liblogging_1.0.6.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/liblogging/{liblogging_1.0.5.bb => liblogging_1.0.6.bb} (86%)

diff --git a/meta-oe/recipes-extended/liblogging/liblogging_1.0.5.bb b/meta-oe/recipes-extended/liblogging/liblogging_1.0.6.bb
similarity index 86%
rename from meta-oe/recipes-extended/liblogging/liblogging_1.0.5.bb
rename to meta-oe/recipes-extended/liblogging/liblogging_1.0.6.bb
index 64a258b01..bb5984519 100644
--- a/meta-oe/recipes-extended/liblogging/liblogging_1.0.5.bb
+++ b/meta-oe/recipes-extended/liblogging/liblogging_1.0.6.bb
@@ -12,8 +12,8 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=63fe03535d83726f5655072502bef1bc"
 SRC_URI = "http://download.rsyslog.com/${BPN}/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "44b8ce2daa1bfb84c9feaf42f9925fd7"
-SRC_URI[sha256sum] = "310dc1691279b7a669d383581fe4b0babdc7bf75c9b54a24e51e60428624890b"
+SRC_URI[md5sum] = "f215c7e7ac6cfd1f5dabdba08c522b29"
+SRC_URI[sha256sum] = "338c6174e5c8652eaa34f956be3451f7491a4416ab489aef63151f802b00bf93"
 
 inherit autotools pkgconfig
 
-- 
2.17.1


