Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D86037EB24
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 08:18:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x628Fgie001817
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Jul 2019 01:18:19 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Tue, 2 Jul 2019 01:18:07 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 2 Jul 2019 16:16:17 +0800
Message-ID: <f5185f7cc4c068ba22b7ece05467fa48f0db8ea4.1562055251.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1562055251.git.hongxu.jia@windriver.com>
References: <cover.1562055251.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 3/8] python-pyparted/python3-pyparted: 3.11.1 -> 3.11.2
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
X-List-Received-Date: Tue, 02 Jul 2019 08:18:39 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-python/recipes-extended/python-pyparted/python-pyparted.inc        | 2 +-
 .../{python-pyparted_3.11.1.bb => python-pyparted_3.11.2.bb}            | 0
 .../{python3-pyparted_3.11.1.bb => python3-pyparted_3.11.2.bb}          | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-pyparted/{python-pyparted_3.11.1.bb => python-pyparted_3.11.2.bb} (100%)
 rename meta-python/recipes-extended/python-pyparted/{python3-pyparted_3.11.1.bb => python3-pyparted_3.11.2.bb} (100%)

diff --git a/meta-python/recipes-extended/python-pyparted/python-pyparted.inc b/meta-python/recipes-extended/python-pyparted/python-pyparted.inc
index a0ec028..f769f95 100644
--- a/meta-python/recipes-extended/python-pyparted/python-pyparted.inc
+++ b/meta-python/recipes-extended/python-pyparted/python-pyparted.inc
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "\
 DEPENDS += "parted"
 
 # upstream only publishes releases in github archives which are discouraged
-SRCREV = "1fdb15120f35f5da1dc7ec116522f0c796a8376a"
+SRCREV = "2396ba7df56de277b4999bdd5f7d1a1706a6388a"
 SRC_URI = "git://github.com/rhinstaller/pyparted.git;protocol=https"
 
 S = "${WORKDIR}/git"
diff --git a/meta-python/recipes-extended/python-pyparted/python-pyparted_3.11.1.bb b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.11.2.bb
similarity index 100%
rename from meta-python/recipes-extended/python-pyparted/python-pyparted_3.11.1.bb
rename to meta-python/recipes-extended/python-pyparted/python-pyparted_3.11.2.bb
diff --git a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.1.bb b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.2.bb
similarity index 100%
rename from meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.1.bb
rename to meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.2.bb
-- 
2.7.4


