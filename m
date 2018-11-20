Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9A5B165CE9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 06:04:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAK63mOR031852
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 19 Nov 2018 22:03:58 -0800
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 19 Nov 2018 22:03:38 -0800
From: <mingli.yu@windriver.com>
To: <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
Date: Mon, 19 Nov 2018 22:03:37 -0800
Message-ID: <20181120060337.68821-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] krb5: Upgrade to 1.16.2
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
X-List-Received-Date: Tue, 20 Nov 2018 06:04:24 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../krb5/{krb5_1.16.1.bb => krb5_1.16.2.bb}                   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/krb5/{krb5_1.16.1.bb => krb5_1.16.2.bb} (98%)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.16.1.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.16.2.bb
similarity index 98%
rename from meta-oe/recipes-connectivity/krb5/krb5_1.16.1.bb
rename to meta-oe/recipes-connectivity/krb5/krb5_1.16.2.bb
index 11748cbd0..c770f7bbe 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.16.1.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.16.2.bb
@@ -31,8 +31,8 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
            file://krb5-kdc.service \
            file://krb5-admin-server.service \
 "
-SRC_URI[md5sum] = "848e9b80d6aaaa798e3f3df24b83c407"
-SRC_URI[sha256sum] = "214ffe394e3ad0c730564074ec44f1da119159d94281bbec541dc29168d21117"
+SRC_URI[md5sum] = "ffd52595e969fb700d37313606e4dc3d"
+SRC_URI[sha256sum] = "9f721e1fe593c219174740c71de514c7228a97d23eb7be7597b2ae14e487f027"
 
 CVE_PRODUCT = "kerberos"
 
-- 
2.17.1


