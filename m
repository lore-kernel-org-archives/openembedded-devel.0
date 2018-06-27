Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EBB5B60248
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 09:50:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5R9o22g021415
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 02:50:18 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 27 Jun 2018 02:49:52 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 27 Jun 2018 02:49:16 -0700
Message-ID: <20180627094922.109996-6-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627094922.109996-1-mingli.yu@windriver.com>
References: <20180627094922.109996-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 06/13] libfastjson: Upgrade to 0.99.8
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
X-List-Received-Date: Wed, 27 Jun 2018 09:50:27 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../rsyslog/{libfastjson_0.99.4.bb => libfastjson_0.99.8.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/rsyslog/{libfastjson_0.99.4.bb => libfastjson_0.99.8.bb} (85%)

diff --git a/meta-oe/recipes-extended/rsyslog/libfastjson_0.99.4.bb b/meta-oe/recipes-extended/rsyslog/libfastjson_0.99.8.bb
similarity index 85%
rename from meta-oe/recipes-extended/rsyslog/libfastjson_0.99.4.bb
rename to meta-oe/recipes-extended/rsyslog/libfastjson_0.99.8.bb
index 2e23d7ec6..ea089de84 100644
--- a/meta-oe/recipes-extended/rsyslog/libfastjson_0.99.4.bb
+++ b/meta-oe/recipes-extended/rsyslog/libfastjson_0.99.8.bb
@@ -8,7 +8,7 @@ DEPENDS = ""
 
 SRC_URI = "git://github.com/rsyslog/libfastjson.git;protocol=https"
 
-SRCREV = "6e057a094cb225c9d80d8d6e6b1f36ca88a942dd"
+SRCREV = "4758b1caf69ada911ef79e1d80793fe489b98dff"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


