Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B02CD74793
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 09:50:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w5R9oJdY005267
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 02:50:19 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 27 Jun 2018 02:50:18 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 27 Jun 2018 02:49:17 -0700
Message-ID: <20180627094922.109996-7-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627094922.109996-1-mingli.yu@windriver.com>
References: <20180627094922.109996-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 07/13] hwdata: Upgrade to 0.312
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
X-List-Received-Date: Wed, 27 Jun 2018 09:50:17 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-support/hwdata/hwdata_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_git.bb b/meta-oe/recipes-support/hwdata/hwdata_git.bb
index 679673ba0..83b72535c 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_git.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_git.bb
@@ -5,8 +5,8 @@ SECTION = "System/Base"
 LICENSE = "GPL-2.0+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
-PV = "0.298+git${SRCPV}"
-SRCREV = "9030fbd6ab1538f4d77d3cf1e0b463a7ec25b5c4"
+PV = "0.312+git${SRCPV}"
+SRCREV = "016be785fd4f5f895c6482ec484507d5a08839fa"
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


