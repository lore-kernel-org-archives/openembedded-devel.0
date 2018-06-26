Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BA572746F7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jun 2018 06:00:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w5Q60jnE003126
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jun 2018 23:00:45 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 25 Jun 2018 23:00:44 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Jun 2018 14:00:59 +0800
Message-ID: <1529992863-24711-16-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
References: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 16/20] python3-requests-file: upgrade 1.4.2 -> 1.4.3
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
X-List-Received-Date: Tue, 26 Jun 2018 06:00:43 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...{python3-requests-file_1.4.2.bb => python3-requests-file_1.4.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-requests-file_1.4.2.bb => python3-requests-file_1.4.3.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-requests-file_1.4.2.bb b/meta-python/recipes-devtools/python/python3-requests-file_1.4.3.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-requests-file_1.4.2.bb
rename to meta-python/recipes-devtools/python/python3-requests-file_1.4.3.bb
index 8652876a4..0407779da 100644
--- a/meta-python/recipes-devtools/python/python3-requests-file_1.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-file_1.4.3.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://github.com/dashea/requests-file"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9cc728d6087e43796227b0a31422de6b"
 
-SRC_URI[md5sum] = "a907efb75faf0ccbb1857432bf9d8c0f"
-SRC_URI[sha256sum] = "f518e7cfe048e053fd1019dfb891b4c55b871c56c5a31693d733240c80b8f191"
+SRC_URI[md5sum] = "470711c9b7e0de1057f7b72a58b7ab51"
+SRC_URI[sha256sum] = "8f04aa6201bacda0567e7ac7f677f1499b0fc76b22140c54bc06edf1ba92e2fa"
 
 inherit pypi setuptools3
 
-- 
2.11.0


