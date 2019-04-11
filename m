Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id EFF326C1CF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2019 04:54:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,336,1549900800"; d="scan'208";a="59004655"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Apr 2019 12:54:44 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 8FE224CD81BA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2019 12:54:45 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 11 Apr 2019 12:54:40 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 11 Apr 2019 12:55:22 +0800
Message-ID: <20190411045522.9370-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 8FE224CD81BA.AC345
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-editor: upgrade 1.0.3 -> 1.0.4
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
X-List-Received-Date: Thu, 11 Apr 2019 04:54:45 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-editor_1.0.3.bb to python-editor_1.0.4.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-editor.inc         | 4 ++--
 .../python/{python-editor_1.0.3.bb => python-editor_1.0.4.bb} | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-editor_1.0.3.bb => python-editor_1.0.4.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-editor.inc b/meta-python/recipes-devtools/python/python-editor.inc
index 30650bda4..734ce2bd7 100644
--- a/meta-python/recipes-devtools/python/python-editor.inc
+++ b/meta-python/recipes-devtools/python/python-editor.inc
@@ -2,8 +2,8 @@ DESCRIPTION = "Programmatically open and editor, capture the result"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
-SRC_URI[md5sum] = "0aca5f2ef176ce68e98a5b7e31372835"
-SRC_URI[sha256sum] = "a3c066acee22a1c94f63938341d4fb374e3fdd69366ed6603d7b24bed1efc565"
+SRC_URI[md5sum] = "0e52648a4a6e7c89e3be44e9456530b4"
+SRC_URI[sha256sum] = "51fda6bcc5ddbbb7063b2af7509e43bd84bfc32a4ff71349ec7847713882327b"
 
 PYPI_PACKAGE = "python-editor"
 
diff --git a/meta-python/recipes-devtools/python/python-editor_1.0.3.bb b/meta-python/recipes-devtools/python/python-editor_1.0.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-editor_1.0.3.bb
rename to meta-python/recipes-devtools/python/python-editor_1.0.4.bb
-- 
2.20.1




