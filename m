Return-Path: <Haitao.Liu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 684F86086F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 03:28:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5R3S41M012892
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jun 2018 20:28:19 -0700
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Tue, 26 Jun 2018 20:27:53 -0700
From: Liu Haitao <haitao.liu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 27 Jun 2018 11:13:15 +0800
Message-ID: <1530069195-36531-1-git-send-email-haitao.liu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Subject: [meta-networking][PATCH] ifenslave:Update the repo link
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
X-List-Received-Date: Wed, 27 Jun 2018 03:28:29 -0000
Content-Type: text/plain

The https://anonscm.debian.org service has been replaced by salsa.debian.org.

Signed-off-by: Liu Haitao <haitao.liu@windriver.com>
---
 meta-networking/recipes-support/ifenslave/ifenslave_2.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ifenslave/ifenslave_2.9.bb b/meta-networking/recipes-support/ifenslave/ifenslave_2.9.bb
index ea28b34aa..2a6a6097c 100644
--- a/meta-networking/recipes-support/ifenslave/ifenslave_2.9.bb
+++ b/meta-networking/recipes-support/ifenslave/ifenslave_2.9.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=acc89812938cf9ad6b1debc37cea0253
 
 
 SRCREV = "42bfbb9beb924672ca86b86e9679ac3d6b87d992"
-SRC_URI = "git://anonscm.debian.org/collab-maint/ifenslave.git"
+SRC_URI = "git://salsa.debian.org/debian/ifenslave.git;protocol=https"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


