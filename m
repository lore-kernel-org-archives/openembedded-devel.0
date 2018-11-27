Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A26716C108
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 08:16:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wAR8GbQ4012600
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Nov 2018 00:16:37 -0800 (PST)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 27 Nov 2018 00:16:36 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 27 Nov 2018 16:32:39 +0800
Message-ID: <4200a94be4e33565aef30f99a5fd08e51c1cad8d.1543307294.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1543307294.git.hongxu.jia@windriver.com>
References: <cover.1543307294.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 05/12] libreport: 2.9.5 -> 2.9.6
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
X-List-Received-Date: Tue, 27 Nov 2018 08:16:36 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../libreport/{libreport_2.9.5.bb => libreport_2.9.6.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libreport/{libreport_2.9.5.bb => libreport_2.9.6.bb} (96%)

diff --git a/meta-oe/recipes-extended/libreport/libreport_2.9.5.bb b/meta-oe/recipes-extended/libreport/libreport_2.9.6.bb
similarity index 96%
rename from meta-oe/recipes-extended/libreport/libreport_2.9.5.bb
rename to meta-oe/recipes-extended/libreport/libreport_2.9.6.bb
index 542956c..ce3d2db 100644
--- a/meta-oe/recipes-extended/libreport/libreport_2.9.5.bb
+++ b/meta-oe/recipes-extended/libreport/libreport_2.9.6.bb
@@ -17,7 +17,7 @@ SRC_URI += "file://0001-Makefile.am-remove-doc-and-apidoc.patch \
             file://0003-without-build-plugins.patch \
             file://0004-configure.ac-remove-prog-test-of-augparse.patch \
 "
-SRCREV = "15f92bcaf73e5eb8958fbde655a57dcd111757a7"
+SRCREV = "e43eb0b747f58ef9be7e2d8fc9f3fafc93fa63c6"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.7.4


