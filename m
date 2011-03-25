Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <a0875592@swubn01>) id 1Q2zCK-0004Un-42
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Mar 2011 06:04:33 +0100
Received: from dbdp31.itg.ti.com ([172.24.170.98])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id p2P52ZXR014600
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Mar 2011 00:02:37 -0500
Received: from swubn01 (localhost [127.0.0.1])
	by dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id p2P52X1U017739;
	Fri, 25 Mar 2011 10:32:34 +0530 (IST)
Received: from a0875592 by swubn01 with local (Exim 4.71)
	(envelope-from <a0875592@swubn01>)
	id 1Q2zAP-00005B-Gz; Fri, 25 Mar 2011 10:32:33 +0530
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Mar 2011 10:32:31 +0530
Message-Id: <1301029351-32736-1-git-send-email-heroor@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Siddharth Heroor <heroor@ti.com>
Subject: [PATCH] TI XDCTools: Add version 3.20.08.88
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Mar 2011 05:04:33 -0000

From: Siddharth Heroor <heroor@ti.com>


Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 recipes/ti/ti-xdctools_3.20.08.88.bb |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ti/ti-xdctools_3.20.08.88.bb

diff --git a/recipes/ti/ti-xdctools_3.20.08.88.bb b/recipes/ti/ti-xdctools_3.20.08.88.bb
new file mode 100644
index 0000000..bf0cdcd
--- /dev/null
+++ b/recipes/ti/ti-xdctools_3.20.08.88.bb
@@ -0,0 +1,6 @@
+require ti-xdctools.inc
+
+PV = "3_20_08_88"
+
+SRC_URI[xdcbin.md5sum] = "068447e935adb54f0cacf0e294a281f9"
+SRC_URI[xdcbin.sha256sum] = "a4616fae3cc2a9f46b5b4377bb57af7f7932297cda210a6cbcc5f942256db196"
-- 
1.7.0.4



