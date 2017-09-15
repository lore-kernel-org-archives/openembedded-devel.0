Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C934A7848D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 15:23:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v8FFNTwU011336
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 08:23:29 -0700 (PDT)
Received: from yow-rmacleod-lx3.wrs.com (128.224.56.85) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 15 Sep 2017 08:23:28 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Sep 2017 11:23:24 -0400
Message-ID: <1505489005-4115-1-git-send-email-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/2] librelp: upgrade from 1.2.12 to 1.2.14
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
X-List-Received-Date: Fri, 15 Sep 2017 15:23:28 -0000
Content-Type: text/plain

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../recipes-extended/rsyslog/{librelp_1.2.12.bb => librelp_1.2.14.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/rsyslog/{librelp_1.2.12.bb => librelp_1.2.14.bb} (86%)

diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.2.12.bb b/meta-oe/recipes-extended/rsyslog/librelp_1.2.14.bb
similarity index 86%
rename from meta-oe/recipes-extended/rsyslog/librelp_1.2.12.bb
rename to meta-oe/recipes-extended/rsyslog/librelp_1.2.14.bb
index 84c2583..28047eb 100644
--- a/meta-oe/recipes-extended/rsyslog/librelp_1.2.12.bb
+++ b/meta-oe/recipes-extended/rsyslog/librelp_1.2.14.bb
@@ -8,7 +8,7 @@ DEPENDS = "gmp nettle libidn zlib gnutls"
 
 SRC_URI = "git://github.com/rsyslog/librelp.git;protocol=https"
 
-SRCREV = "02c3be4f5c39fec59d05cd8b75b08dbba04098ad"
+SRCREV = "fc512e337bfc7c92770246dbff5f482b879498b9"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


