Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 488927EAFC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 08:19:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x628JB6x008738
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Jul 2019 01:19:11 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Tue, 2 Jul 2019 01:19:11 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 2 Jul 2019 16:16:22 +0800
Message-ID: <ab56d19838d836dafc57dd0c092781ae76a13866.1562055251.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1562055251.git.hongxu.jia@windriver.com>
References: <cover.1562055251.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 8/8] libreport: 2.9.7 -> 2.10.0
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
X-List-Received-Date: Tue, 02 Jul 2019 08:19:11 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../libreport/{libreport_2.9.7.bb => libreport_2.10.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libreport/{libreport_2.9.7.bb => libreport_2.10.0.bb} (96%)

diff --git a/meta-oe/recipes-extended/libreport/libreport_2.9.7.bb b/meta-oe/recipes-extended/libreport/libreport_2.10.0.bb
similarity index 96%
rename from meta-oe/recipes-extended/libreport/libreport_2.9.7.bb
rename to meta-oe/recipes-extended/libreport/libreport_2.10.0.bb
index da22836..e50226e 100644
--- a/meta-oe/recipes-extended/libreport/libreport_2.9.7.bb
+++ b/meta-oe/recipes-extended/libreport/libreport_2.10.0.bb
@@ -17,7 +17,7 @@ SRC_URI += "file://0001-Makefile.am-remove-doc-and-apidoc.patch \
             file://0003-without-build-plugins.patch \
             file://0004-configure.ac-remove-prog-test-of-augparse.patch \
 "
-SRCREV = "1d5cc00e44af4800fcae9761625dd4230681e82a"
+SRCREV = "eaff08f38d771d9362923765bb404b1514c5ca0a"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.7.4


