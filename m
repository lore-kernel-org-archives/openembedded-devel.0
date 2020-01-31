Return-Path: <michael.haener@siemens.com>
X-Greylist: delayed 364 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 31 Jan 2020 10:09:06 UTC
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 7E30360661
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2020 10:09:06 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 00VA32G8016515
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2020 11:03:02 +0100
Received: from dev.vm6.ccp.siemens.com (md1quwnc.ad001.siemens.net
	[139.16.77.74])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id 00VA30UL020620;
	Fri, 31 Jan 2020 11:03:01 +0100
Received: from dev.localdomain (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id D204523B0A87;
	Fri, 31 Jan 2020 11:03:00 +0100 (CET)
From: Michael Haener <michael.haener@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Jan 2020 11:02:57 +0100
Message-Id: <20200131100257.2898-1-michael.haener@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH] modemmanager: upgrade 1.10.8 -> 1.12.4
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
X-List-Received-Date: Fri, 31 Jan 2020 10:09:07 -0000

Signed-off-by: Michael Haener <michael.haener@siemens.com>
---
 .../modemmanager/{modemmanager_1.10.8.bb => modemmanager_1.12.4.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.10.8.bb => modemmanager_1.12.4.bb} (92%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.8.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.4.bb
similarity index 92%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.8.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.4.bb
index 3cd21cc0d..3639f02ca 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.8.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.4.bb
@@ -14,8 +14,8 @@ DEPENDS = "glib-2.0 libgudev intltool-native libxslt-native"
 SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz \
            "
 
-SRC_URI[md5sum] = "c05ac4246c81cc15d617c4a129232988"
-SRC_URI[sha256sum] = "cbe174078dbdf3f746a55f0004353d3c27da2a31da553036d90fc7dc34a0169a"
+SRC_URI[md5sum] = "22280110d75c87a89786a317aa9cee04"
+SRC_URI[sha256sum] = "852d61755e0c1a8d0c609b17192d742b324fdd2e513f3ed64b228befb859a95b"
 
 S = "${WORKDIR}/ModemManager-${PV}"
 
-- 
2.11.0


