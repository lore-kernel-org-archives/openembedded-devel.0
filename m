Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1208373C4E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Mar 2015 18:43:33 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Mar 2015 19:43:28 +0100
Message-Id: <1427395411-16303-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1427395411-16303-1-git-send-email-obi@opendreambox.org>
References: <1427395411-16303-1-git-send-email-obi@opendreambox.org>
Subject: [meta-python][PATCH 2/5] python-six: Python 2 and 3 compatibility library, version 1.9.0
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
 meta-python/recipes-devtools/python/python-six_1.9.0.bb | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-six_1.9.0.bb

diff --git a/meta-python/recipes-devtools/python/python-six_1.9.0.bb b/meta-python/recipes-devtools/python/python-six_1.9.0.bb
new file mode 100644
index 0000000..aa96dc9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-six_1.9.0.bb
@@ -0,0 +1,8 @@
+SUMMARY = "Python 2 and 3 compatibility library"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6f00d4a50713fa859858dd9abaa35b21"
+
+SRC_URI[md5sum] = "476881ef4012262dfc8adc645ee786c4"
+SRC_URI[sha256sum] = "e24052411fc4fbd1f672635537c3fc2330d9481b18c0317695b46259512c91d5"
+
+inherit pypi
-- 
1.9.1


