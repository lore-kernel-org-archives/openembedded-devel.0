Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A61B7605F9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Feb 2020 02:28:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 01C2Sx3E021413
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2020 18:28:59 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Tue, 11 Feb 2020 18:28:58 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Feb 2020 10:28:57 +0800
Message-ID: <1581474537-285529-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libteam: Upgrade to 1.30
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
X-List-Received-Date: Wed, 12 Feb 2020 02:28:59 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-support/libteam/{libteam_1.29.bb => libteam_1.30.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libteam/{libteam_1.29.bb => libteam_1.30.bb} (95%)

diff --git a/meta-oe/recipes-support/libteam/libteam_1.29.bb b/meta-oe/recipes-support/libteam/libteam_1.30.bb
similarity index 95%
rename from meta-oe/recipes-support/libteam/libteam_1.29.bb
rename to meta-oe/recipes-support/libteam/libteam_1.30.bb
index 4ccc280..9cd02b0 100644
--- a/meta-oe/recipes-support/libteam/libteam_1.29.bb
+++ b/meta-oe/recipes-support/libteam/libteam_1.30.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/jpirko/libteam \
            file://0001-team_basic_test.py-use-python3-interpreter.patch \
            file://run-ptest \
            "
-SRCREV = "e897f02bf2403d4859a99e090e34ea768b4c0540"
+SRCREV = "471fb50d206e5a3f2eef9e4247329b51edc5c493"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


