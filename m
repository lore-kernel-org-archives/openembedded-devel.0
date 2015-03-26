Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 101386AC36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Mar 2015 18:43:33 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Mar 2015 19:43:31 +0100
Message-Id: <1427395411-16303-5-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1427395411-16303-1-git-send-email-obi@opendreambox.org>
References: <1427395411-16303-1-git-send-email-obi@opendreambox.org>
Subject: [meta-python][PATCH 5/5] python-cffi: Foreign Function Interface for Python calling C code, version 0.9.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Mar 2015 18:43:35 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-python/recipes-devtools/python/python-cffi_0.9.2.bb | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-cffi_0.9.2.bb

diff --git a/meta-python/recipes-devtools/python/python-cffi_0.9.2.bb b/meta-python/recipes-devtools/python/python-cffi_0.9.2.bb
new file mode 100644
index 0000000..6c34b67
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-cffi_0.9.2.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Foreign Function Interface for Python calling C code"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
+DEPENDS = "libffi python-pycparser"
+
+SRC_URI[md5sum] = "b1bf4625ae07a8a932f2f1a2eb200c54"
+SRC_URI[sha256sum] = "1988ce7ff9c64ecd5077776175e90fd8f0a8c827cb241a23647175ce08126bb2"
+
+inherit pypi
-- 
1.9.1


