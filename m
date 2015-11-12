Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 78D74771EF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 10:44:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tACAiP5x023427
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 02:44:26 -0800
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 12 Nov 2015 02:44:24 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 12 Nov 2015 18:44:20 +0800
Message-ID: <6fa4f676f5146c609b858017045e9408b251f034.1447324249.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1447324249.git.jackie.huang@windriver.com>
References: <cover.1447324249.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/6] libtevent: upgrade to 0.9.25
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
X-List-Received-Date: Thu, 12 Nov 2015 10:44:26 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../libtevent/{libtevent_0.9.21.bb => libtevent_0.9.25.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libtevent/{libtevent_0.9.21.bb => libtevent_0.9.25.bb} (86%)

diff --git a/meta-oe/recipes-support/libtevent/libtevent_0.9.21.bb b/meta-oe/recipes-support/libtevent/libtevent_0.9.25.bb
similarity index 86%
rename from meta-oe/recipes-support/libtevent/libtevent_0.9.21.bb
rename to meta-oe/recipes-support/libtevent/libtevent_0.9.25.bb
index f297f30..ad45aa0 100644
--- a/meta-oe/recipes-support/libtevent/libtevent_0.9.21.bb
+++ b/meta-oe/recipes-support/libtevent/libtevent_0.9.25.bb
@@ -10,8 +10,8 @@ RDEPENDS_python-tevent = "python"
 SRC_URI = "http://samba.org/ftp/tevent/tevent-${PV}.tar.gz"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b"
 
-SRC_URI[md5sum] = "3d5a76c0a1b5f724842d785fd055633f"
-SRC_URI[sha256sum] = "f2be7463573dab2d8210cb57fe7e7e2aeb323274cbdc865a6e29ddcfb977f0f4"
+SRC_URI[md5sum] = "8d01a2076cb8cd30cab40393d27043df"
+SRC_URI[sha256sum] = "fedeb0d55a11b3593b562ec09b32e44bd67619ed10e5fa10d1868adb1649c669"
 
 inherit waf-samba
 
-- 
1.9.1


