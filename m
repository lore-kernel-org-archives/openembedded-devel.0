Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 096AF731E7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jan 2016 06:42:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u066gYUT020744
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 5 Jan 2016 22:42:34 -0800
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 5 Jan 2016 22:42:33 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Jan 2016 14:42:44 +0800
Message-ID: <294fa0ad186d05344edb8ffc5f8062a206218682.1452061871.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452061871.git.jackie.huang@windriver.com>
References: <cover.1452061871.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 3/7 v3] libtevent: upgrade to 0.9.25
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
X-List-Received-Date: Wed, 06 Jan 2016 06:42:34 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../libtevent/{libtevent_0.9.21.bb => libtevent_0.9.25.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libtevent/{libtevent_0.9.21.bb => libtevent_0.9.25.bb} (88%)

diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.9.21.bb b/meta-networking/recipes-support/libtevent/libtevent_0.9.25.bb
similarity index 88%
rename from meta-networking/recipes-support/libtevent/libtevent_0.9.21.bb
rename to meta-networking/recipes-support/libtevent/libtevent_0.9.25.bb
index 006b36d..2ec79e9 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.9.21.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.9.25.bb
@@ -9,8 +9,8 @@ RDEPENDS_python-tevent = "python"
 SRC_URI = "http://samba.org/ftp/tevent/tevent-${PV}.tar.gz"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b"
 
-SRC_URI[md5sum] = "3d5a76c0a1b5f724842d785fd055633f"
-SRC_URI[sha256sum] = "f2be7463573dab2d8210cb57fe7e7e2aeb323274cbdc865a6e29ddcfb977f0f4"
+SRC_URI[md5sum] = "8d01a2076cb8cd30cab40393d27043df"
+SRC_URI[sha256sum] = "fedeb0d55a11b3593b562ec09b32e44bd67619ed10e5fa10d1868adb1649c669"
 
 inherit waf-samba
 
-- 
1.9.1


