Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 8F446782EF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jul 2017 15:33:23 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v6JFXODU030321
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 19 Jul 2017 17:33:24 +0200
Received: from dev.sbt.siemens.com ([139.16.24.9])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id v6JFXNkU007068;
	Wed, 19 Jul 2017 17:33:23 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jul 2017 17:33:16 +0200
Message-Id: <1500478396-18291-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Cc: Pascal Bach <pascal.bach@nextrem.ch>
Subject: [meta-oe][PATCH] python-paho-mqtt, python3-paho-mqtt: update to 1.3.0
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
X-List-Received-Date: Wed, 19 Jul 2017 15:33:24 -0000

From: Pascal Bach <pascal.bach@nextrem.ch>

Signed-off-by: Pascal Bach <pascal.bach@nextrem.ch>
---
 meta-python/recipes-devtools/python/python-paho-mqtt.inc              | 4 ++--
 .../python/{python-paho-mqtt_1.2.3.bb => python-paho-mqtt_1.3.0.bb}   | 0
 .../python/{python3-paho-mqtt_1.2.3.bb => python3-paho-mqtt_1.3.0.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-paho-mqtt_1.2.3.bb => python-paho-mqtt_1.3.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-paho-mqtt_1.2.3.bb => python3-paho-mqtt_1.3.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-paho-mqtt.inc b/meta-python/recipes-devtools/python/python-paho-mqtt.inc
index 545985c..531fdf7 100644
--- a/meta-python/recipes-devtools/python/python-paho-mqtt.inc
+++ b/meta-python/recipes-devtools/python/python-paho-mqtt.inc
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=eb48c6ee2cb9f5b8b9fe75e6f817bdfc"
 SRCNAME = "paho-mqtt"
 
 inherit pypi
-SRC_URI[md5sum] = "4bd192ea24e7aa347f6d240101ef82f6"
-SRC_URI[sha256sum] = "0fd746d8650563290f1bd0fec01e74cb57c3ab7406bdb58e5d9252bb5fa5ca44"
+SRC_URI[md5sum] = "b9338236e2836e8579ef140956189cc4"
+SRC_URI[sha256sum] = "2c9ef5494cfc1e41a9fff6544c5a2cd59ea5d401d9119a06ecf7fad6a2ffeb93"
 
 RDEPENDS_${PN} = "\
                ${PYTHON_PN}-math \
diff --git a/meta-python/recipes-devtools/python/python-paho-mqtt_1.2.3.bb b/meta-python/recipes-devtools/python/python-paho-mqtt_1.3.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-paho-mqtt_1.2.3.bb
rename to meta-python/recipes-devtools/python/python-paho-mqtt_1.3.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-paho-mqtt_1.2.3.bb b/meta-python/recipes-devtools/python/python3-paho-mqtt_1.3.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-paho-mqtt_1.2.3.bb
rename to meta-python/recipes-devtools/python/python3-paho-mqtt_1.3.0.bb
-- 
2.1.4


