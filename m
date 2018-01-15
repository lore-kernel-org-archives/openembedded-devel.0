Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2D9A578689
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 02:13:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="35302282"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Jan 2018 10:13:17 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 4D440486A78F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 10:13:13 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Mon, 15 Jan 2018 10:13:15 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Jan 2018 10:13:44 +0800
Message-ID: <1515982424-32256-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 4D440486A78F.A5F0A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] cim-schema-exper: 2.39.0 -> 2.50.0
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
X-List-Received-Date: Mon, 15 Jan 2018 02:13:17 -0000
Content-Type: text/plain

Update cim-schema-exper from 2.39.0 to 2.50.0

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../{cim-schema-exper_2.39.0.bb => cim-schema-exper_2.50.0.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/cim-schema/{cim-schema-exper_2.39.0.bb => cim-schema-exper_2.50.0.bb} (81%)

diff --git a/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.39.0.bb b/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.50.0.bb
similarity index 81%
rename from meta-networking/recipes-support/cim-schema/cim-schema-exper_2.39.0.bb
rename to meta-networking/recipes-support/cim-schema/cim-schema-exper_2.50.0.bb
index 2b49096..90ea882 100644
--- a/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.39.0.bb
+++ b/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.50.0.bb
@@ -4,11 +4,11 @@ LICENSE = "DMTF"
 
 RCONFLICTS_${PN} = "cim-schema-final"
 
-SRC_URI = "http://dmtf.org/sites/default/files/cim/cim_schema_v2390/cim_schema_${PV}Experimental-MOFs.zip;subdir=${BPN}-${PV} \
+SRC_URI = "http://dmtf.org/sites/default/files/cim/cim_schema_v2500/cim_schema_${PV}Experimental-MOFs.zip;subdir=${BPN}-${PV} \
     file://LICENSE \
 "
-SRC_URI[md5sum] = "b82b31c609c6bcc69521829409f58ccc"
-SRC_URI[sha256sum] = "ed2096ef1ea25d189a02bbc6603fed7a48297f2987f254265763a6eecb7fc870"
+SRC_URI[md5sum] = "ee4ad6441a2b65ca60a3abc53e3ec629"
+SRC_URI[sha256sum] = "a44d67881325e267ef46b72eabe0c69f90470b1033b1ce7c26d9ba99072adb50"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=eecc6f71a56ff3caf17f15bf7aeac7b4"
 
 do_install() {
-- 
2.7.4




