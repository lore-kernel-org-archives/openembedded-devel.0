Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <a0875592@swubn01>) id 1Q4q59-0003hf-Ci
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Mar 2011 09:44:47 +0200
Received: from dbdp31.itg.ti.com ([172.24.170.98])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id p2U7gj1D009321
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Mar 2011 02:42:47 -0500
Received: from swubn01 (localhost [127.0.0.1])
	by dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id p2U7giXA016609;
	Wed, 30 Mar 2011 13:12:44 +0530 (IST)
Received: from a0875592 by swubn01 with local (Exim 4.71)
	(envelope-from <a0875592@swubn01>)
	id 1Q4q3A-00048t-6Q; Wed, 30 Mar 2011 13:12:44 +0530
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Mar 2011 13:12:41 +0530
Message-Id: <1301470961-15808-3-git-send-email-heroor@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1301470961-15808-1-git-send-email-heroor@gmail.com>
References: <1301470961-15808-1-git-send-email-heroor@gmail.com>
Cc: Siddharth Heroor <heroor@ti.com>
Subject: [PATCH 3/3] TI EDMA3LLD Sysbios: Add version 02.11.01.02
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
X-List-Received-Date: Wed, 30 Mar 2011 07:44:47 -0000

From: Siddharth Heroor <heroor@ti.com>


Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 recipes/ti/ti-edma3lld-sysbios_02.11.01.02.bb |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ti/ti-edma3lld-sysbios_02.11.01.02.bb

diff --git a/recipes/ti/ti-edma3lld-sysbios_02.11.01.02.bb b/recipes/ti/ti-edma3lld-sysbios_02.11.01.02.bb
new file mode 100644
index 0000000..264dfb3
--- /dev/null
+++ b/recipes/ti/ti-edma3lld-sysbios_02.11.01.02.bb
@@ -0,0 +1,6 @@
+require ti-edma3lld-sysbios.inc
+
+PV = "02_11_01_02"
+
+SRC_URI[md5sum] = "270c15dc5f0a5761adb1ff45ab1adb99"
+SRC_URI[sha256sum] = "bd76114114a099eba15bdce8e3815a8cd2c01d819ebfc630f6abdd39da36b525"
-- 
1.7.0.4



