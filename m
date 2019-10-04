Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7CE0B7ED41
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2019 15:56:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x94FuC77011203
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 4 Oct 2019 08:56:13 -0700
Received: from fidler.wrs.com (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 4 Oct 2019 08:56:12 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 4 Oct 2019 11:56:11 -0400
Message-ID: <20191004155611.22562-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH] libteam: update from 1.28 to 1.29
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
X-List-Received-Date: Fri, 04 Oct 2019 15:56:12 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../libteam/{libteam_1.28.bb => libteam_1.29.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libteam/{libteam_1.28.bb => libteam_1.29.bb} (95%)

diff --git a/meta-oe/recipes-support/libteam/libteam_1.28.bb b/meta-oe/recipes-support/libteam/libteam_1.29.bb
similarity index 95%
rename from meta-oe/recipes-support/libteam/libteam_1.28.bb
rename to meta-oe/recipes-support/libteam/libteam_1.29.bb
index b80bb4efa..821ca1938 100644
--- a/meta-oe/recipes-support/libteam/libteam_1.28.bb
+++ b/meta-oe/recipes-support/libteam/libteam_1.29.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/jpirko/libteam \
            file://0001-team_basic_test.py-disable-RedHat-specific-test.patch \
            file://run-ptest \
            "
-SRCREV = "903950c7fcf28c32f4b62d9d1c07c0234e8378a2"
+SRCREV = "e897f02bf2403d4859a99e090e34ea768b4c0540"
 
 S = "${WORKDIR}/git"
 
-- 
2.22.0


