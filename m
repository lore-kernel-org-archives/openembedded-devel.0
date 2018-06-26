Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0273674788
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jun 2018 05:59:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5Q5x2ZR013297
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jun 2018 22:59:02 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 25 Jun 2018 22:59:01 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Jun 2018 14:00:51 +0800
Message-ID: <1529992863-24711-8-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
References: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 08/20] python-ipaddress: upgrade 1.0.19 -> 1.0.22
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
X-List-Received-Date: Tue, 26 Jun 2018 05:59:01 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../python/{python-ipaddress_1.0.19.bb => python-ipaddress_1.0.22.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-ipaddress_1.0.19.bb => python-ipaddress_1.0.22.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python-ipaddress_1.0.19.bb b/meta-python/recipes-devtools/python/python-ipaddress_1.0.22.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python-ipaddress_1.0.19.bb
rename to meta-python/recipes-devtools/python/python-ipaddress_1.0.22.bb
index 9c50b4670..66de8b637 100644
--- a/meta-python/recipes-devtools/python/python-ipaddress_1.0.19.bb
+++ b/meta-python/recipes-devtools/python/python-ipaddress_1.0.22.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7f538584cc3407bf76042def7168548a"
 
 DEPENDS += "python-pip"
 
-SRC_URI[md5sum] = "d0687efaf93a32476d81e90ba0609c57"
-SRC_URI[sha256sum] = "200d8686011d470b5e4de207d803445deee427455cd0cb7c982b68cf82524f81"
+SRC_URI[md5sum] = "74c1ce3109f30eaa1ab3dd342e7b76d4"
+SRC_URI[sha256sum] = "b146c751ea45cad6188dd6cf2d9b757f6f4f8d6ffb96a023e6f2e26eea02a72c"
 
 inherit pypi setuptools
 
-- 
2.11.0


