Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CD18471A62
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Nov 2016 06:03:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uA263WiZ008683
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 1 Nov 2016 23:03:33 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 1 Nov 2016 23:03:32 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 2 Nov 2016 02:03:30 -0400
Message-ID: <1478066610-22067-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] ttf-abyssinica: update SRC_URI
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
X-List-Received-Date: Wed, 02 Nov 2016 06:03:33 -0000
Content-Type: text/plain

The SRC_URI is unable to fetch, update to a valid one.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_1.500.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_1.500.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_1.500.bb
index d0c3ae5..cd96fbb 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_1.500.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_1.500.bb
@@ -6,7 +6,7 @@ LICENSE = "OFL-1.1"
 LIC_FILES_CHKSUM = "file://OFL.txt;md5=1694c7fc245cdc85c9971db707928159"
 
 SRCNAME = "AbyssinicaSIL"
-SRC_URI = "http://software.sil.org/downloads/abyssinica/${SRCNAME}-${PV}.zip"
+SRC_URI = "http://software.sil.org/downloads/d/abyssinica/${SRCNAME}-${PV}.zip"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 SRC_URI[md5sum] = "a3d943d18e303197c8d3d92d2de54d1e"
-- 
2.8.1


