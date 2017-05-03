Return-Path: <Frederico.Cadete-ext@oneaccess-net.com>
X-Greylist: delayed 309 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 03 May 2017 12:58:56 UTC
Received: from mail.oneaccess-net.com (mail2.belgium.oneaccess-net.com
	[91.183.184.101])
	by mail.openembedded.org (Postfix) with ESMTP id 7669671A92
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 May 2017 12:58:56 +0000 (UTC)
Received: from frederico-HP-8100.oneaccess.intra (10.0.21.144) by
	mail.oneaccess-net.com (10.0.24.95) with Microsoft SMTP Server (TLS) id
	14.3.339.0; Wed, 3 May 2017 14:53:47 +0200
From: Frederico Cadete <Frederico.Cadete-ext@oneaccess-net.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 3 May 2017 14:53:31 +0200
Message-ID: <1493816011-4633-1-git-send-email-Frederico.Cadete-ext@oneaccess-net.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] python-pyudev: correct LICENSE from GPLv2 to LGPLv2.1+
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
X-List-Received-Date: Wed, 03 May 2017 12:58:57 -0000
Content-Type: text/plain

LGPLv2.1 is what is in the project's COPYING file.
LGPLv2.1+ is what is mentioned in the project's setup.py and in the
headers of the source files.

Signed-off-by: Frederico Cadete <Frederico.Cadete-ext@oneaccess-net.com>
---
 meta-python/recipes-devtools/python/python-pyudev_0.21.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pyudev_0.21.0.bb b/meta-python/recipes-devtools/python/python-pyudev_0.21.0.bb
index 7253f88..b0a1acb 100644
--- a/meta-python/recipes-devtools/python/python-pyudev_0.21.0.bb
+++ b/meta-python/recipes-devtools/python/python-pyudev_0.21.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A libudev binding"
-LICENSE = "GPLv2"
+LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 SRC_URI[md5sum] = "cf4d9db7d772622144ca1be6b5d9353b"
-- 
2.7.4


