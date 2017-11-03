Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 4568678332
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Nov 2017 14:42:39 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id vA3Ege4Y025227
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Fri, 3 Nov 2017 15:42:40 +0100
Received: from dev.sbt.siemens.com (MD1FZU9C.ad001.siemens.net [139.16.78.191])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id vA3EgeXE020963;
	Fri, 3 Nov 2017 15:42:40 +0100
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Nov 2017 15:42:37 +0100
Message-Id: <1509720157-17531-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Cc: Pascal Bach <pascal.bach@nextrem.ch>
Subject: [meta-python][PATCH] python-paho-mqtt, python3-paho-mqtt: update to 1.3.1
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
X-List-Received-Date: Fri, 03 Nov 2017 14:42:40 -0000

From: Pascal Bach <pascal.bach@nextrem.ch>

Signed-off-by: Pascal Bach <pascal.bach@nextrem.ch>
---
 meta-python/recipes-devtools/python/python-paho-mqtt.inc              | 4 ++--
 .../python/{python-paho-mqtt_1.3.0.bb => python-paho-mqtt_1.3.1.bb}   | 0
 .../python/{python3-paho-mqtt_1.3.0.bb => python3-paho-mqtt_1.3.1.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-paho-mqtt_1.3.0.bb => python-paho-mqtt_1.3.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-paho-mqtt_1.3.0.bb => python3-paho-mqtt_1.3.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-paho-mqtt.inc b/meta-python/recipes-devtools/python/python-paho-mqtt.inc
index ad1ce6a..9efbd2f 100644
--- a/meta-python/recipes-devtools/python/python-paho-mqtt.inc
+++ b/meta-python/recipes-devtools/python/python-paho-mqtt.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=eb48c6ee2cb9f5b8b9fe75e6f817bdfc \
 SRCNAME = "paho-mqtt"
 
 inherit pypi
-SRC_URI[md5sum] = "b9338236e2836e8579ef140956189cc4"
-SRC_URI[sha256sum] = "2c9ef5494cfc1e41a9fff6544c5a2cd59ea5d401d9119a06ecf7fad6a2ffeb93"
+SRC_URI[md5sum] = "2cc27d8b369700b1fc99325add0dadd2"
+SRC_URI[sha256sum] = "31911f6031de306c27ed79dc77b690d7c55b0dcb0f0434ca34ec6361d0371122"
 
 DEPENDS += "${PYTHON_PN}-pytest-runner-native"
 
diff --git a/meta-python/recipes-devtools/python/python-paho-mqtt_1.3.0.bb b/meta-python/recipes-devtools/python/python-paho-mqtt_1.3.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-paho-mqtt_1.3.0.bb
rename to meta-python/recipes-devtools/python/python-paho-mqtt_1.3.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-paho-mqtt_1.3.0.bb b/meta-python/recipes-devtools/python/python3-paho-mqtt_1.3.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-paho-mqtt_1.3.0.bb
rename to meta-python/recipes-devtools/python/python3-paho-mqtt_1.3.1.bb
-- 
2.1.4


