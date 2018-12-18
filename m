Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8AEB07C033
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2018 07:39:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wBI7dHfq009626
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Dec 2018 23:39:17 -0800 (PST)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Dec 2018 23:39:15 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 18 Dec 2018 15:38:36 +0800
Message-ID: <a8dfc07255c8d9b77434f4b0d4272f9711f9bb76.1545037250.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1545037250.git.hongxu.jia@windriver.com>
References: <cover.1545037250.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/8] libreport: 2.9.6 -> 2.9.7
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
X-List-Received-Date: Tue, 18 Dec 2018 07:39:16 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../libreport/{libreport_2.9.6.bb => libreport_2.9.7.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libreport/{libreport_2.9.6.bb => libreport_2.9.7.bb} (96%)

diff --git a/meta-oe/recipes-extended/libreport/libreport_2.9.6.bb b/meta-oe/recipes-extended/libreport/libreport_2.9.7.bb
similarity index 96%
rename from meta-oe/recipes-extended/libreport/libreport_2.9.6.bb
rename to meta-oe/recipes-extended/libreport/libreport_2.9.7.bb
index ce3d2db..da22836 100644
--- a/meta-oe/recipes-extended/libreport/libreport_2.9.6.bb
+++ b/meta-oe/recipes-extended/libreport/libreport_2.9.7.bb
@@ -17,7 +17,7 @@ SRC_URI += "file://0001-Makefile.am-remove-doc-and-apidoc.patch \
             file://0003-without-build-plugins.patch \
             file://0004-configure.ac-remove-prog-test-of-augparse.patch \
 "
-SRCREV = "e43eb0b747f58ef9be7e2d8fc9f3fafc93fa63c6"
+SRCREV = "1d5cc00e44af4800fcae9761625dd4230681e82a"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.7.4


