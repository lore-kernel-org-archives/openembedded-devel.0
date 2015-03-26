Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 12FF173C56
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Mar 2015 18:43:33 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Mar 2015 19:43:30 +0100
Message-Id: <1427395411-16303-4-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1427395411-16303-1-git-send-email-obi@opendreambox.org>
References: <1427395411-16303-1-git-send-email-obi@opendreambox.org>
Subject: [meta-python][PATCH 4/5] python-pycparser: Parser of the C language, written in pure Python, version 2.10
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
X-List-Received-Date: Thu, 26 Mar 2015 18:43:36 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-python/recipes-devtools/python/python-pycparser_2.10.bb | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pycparser_2.10.bb

diff --git a/meta-python/recipes-devtools/python/python-pycparser_2.10.bb b/meta-python/recipes-devtools/python/python-pycparser_2.10.bb
new file mode 100644
index 0000000..bee4052
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pycparser_2.10.bb
@@ -0,0 +1,8 @@
+SUMMARY = "Parser of the C language, written in pure Python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d29d3ce07825100c58ca57eea171ab65"
+
+SRC_URI[md5sum] = "d87aed98c8a9f386aa56d365fe4d515f"
+SRC_URI[sha256sum] = "957d98b661c0b64b580ab6f94b125e09b6714154ee51de40bca16d3f0076b86c"
+
+inherit pypi
-- 
1.9.1


