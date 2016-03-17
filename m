Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id CF9596FF93
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2016 13:25:24 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id u2HDPO0k002322
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2016 14:25:24 +0100
Received: from dev.sbt.siemens.com (MD1FZU9C.ww002.siemens.net [139.16.85.179])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id u2HDPLJp031546;
	Thu, 17 Mar 2016 14:25:24 +0100
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Mar 2016 14:25:11 +0100
Message-Id: <1458221111-14049-2-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1458221111-14049-1-git-send-email-pascal.bach@siemens.com>
References: <1458221111-14049-1-git-send-email-pascal.bach@siemens.com>
Subject: [meta-networking][PATCH 2/2] dhcpcd: update to version 6.10.1
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
X-List-Received-Date: Thu, 17 Mar 2016 13:25:25 -0000

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../dhcpcd/{dhcpcd_6.10.0.bb => dhcpcd_6.10.1.bb}                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/dhcpcd/{dhcpcd_6.10.0.bb => dhcpcd_6.10.1.bb} (84%)

diff --git a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.10.0.bb b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.10.1.bb
similarity index 84%
rename from meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.10.0.bb
rename to meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.10.1.bb
index 76d0103..cd80428 100644
--- a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.10.0.bb
+++ b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.10.1.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://dhcpcd.c;endline=26;md5=77c40d671aff804ca91ea99556da8
 
 SRC_URI = "http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "f39c5773e7c4bea352d9fb7367c899de"
-SRC_URI[sha256sum] = "ab56af9b2e86913c55a965cb0f835e87749df78318564acf90d5d698f413ad35"
+SRC_URI[md5sum] = "a7b83c57f47b62f48373905d3b4f7978"
+SRC_URI[sha256sum] = "284abf8c3be0580bbac5eaca95359346ab0d78d4072317b6ce87cc68f2e8ae7b"
 
 inherit autotools-brokensep
 
-- 
2.1.4


