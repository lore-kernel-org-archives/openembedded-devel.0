Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C83017F546
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Aug 2019 01:54:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,332,1559491200"; d="scan'208";a="72633342"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Aug 2019 09:54:45 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id EBBA24CDDAEB
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Aug 2019 09:54:42 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 1 Aug 2019 09:54:47 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 1 Aug 2019 09:54:01 +0800
Message-ID: <20190801015401.4956-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: EBBA24CDDAEB.AD8B9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCHv2] openldap: upgrade 2.4.47 -> 2.4.48
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
X-List-Received-Date: Thu, 01 Aug 2019 01:54:50 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-License-Update: Copyright year updated to 2019.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../openldap/{openldap_2.4.47.bb => openldap_2.4.48.bb}             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/openldap/{openldap_2.4.47.bb => openldap_2.4.48.bb} (97%)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.47.bb b/meta-oe/recipes-support/openldap/openldap_2.4.48.bb
similarity index 97%
rename from meta-oe/recipes-support/openldap/openldap_2.4.47.bb
rename to meta-oe/recipes-support/openldap/openldap_2.4.48.bb
index 4345d7d..ecc219d 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.47.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.48.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://www.OpenLDAP.org/license.html"
 # basically BSD.  opensource.org does not record this license
 # at present (so it is apparently not OSI certified).
 LICENSE = "OpenLDAP"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=25b4ead0e45182e7c2914e59ff57009f \
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=ad914c35f97b468f421f8ac0f3d821f4 \
                     file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972 \
                     "
 SECTION = "libs"
@@ -26,8 +26,8 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://remove-user-host-pwd-from-version.patch \
 "
 
-SRC_URI[md5sum] = "e508f97bfd778fec7799f286e5c07176"
-SRC_URI[sha256sum] = "f54c5877865233d9ada77c60c0f69b3e0bfd8b1b55889504c650047cc305520b"
+SRC_URI[md5sum] = "0729a0711fe096831dedc159e0bbe73f"
+SRC_URI[sha256sum] = "d9523ffcab5cd14b709fcf3cb4d04e8bc76bb8970113255f372bc74954c6074d"
 
 DEPENDS = "util-linux groff-native"
 
-- 
2.7.4




