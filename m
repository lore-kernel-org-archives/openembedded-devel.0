Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <a0875592@swubn01>) id 1Q2kEd-000078-Cf
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 14:05:55 +0100
Received: from dbdp31.itg.ti.com ([172.24.170.98])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id p2OD1WIN015485
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 08:01:34 -0500
Received: from swubn01 (localhost [127.0.0.1])
	by dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id p2OD1Uqq010935;
	Thu, 24 Mar 2011 18:31:31 +0530 (IST)
Received: from a0875592 by swubn01 with local (Exim 4.71)
	(envelope-from <a0875592@swubn01>)
	id 1Q2kAM-00071F-8r; Thu, 24 Mar 2011 18:31:30 +0530
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Mar 2011 18:31:14 +0530
Message-Id: <1300971676-31774-1-git-send-email-heroor@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Siddharth Heroor <heroor@ti.com>
Subject: [PATCH 1/3] TI IPC: Fix License field.
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
X-List-Received-Date: Thu, 24 Mar 2011 13:05:55 -0000

From: Siddharth Heroor <heroor@ti.com>

* The correct license for TI IPC is BSD and not TI.

Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 recipes/ti/ti-ipc.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/ti/ti-ipc.inc b/recipes/ti/ti-ipc.inc
index cd6ad6e..fc9b908 100644
--- a/recipes/ti/ti-ipc.inc
+++ b/recipes/ti/ti-ipc.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "TI Inter Process Ccommunication (IPC) Mechanisms (for Uni- and Multi- Processor Configurations)"
 HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ipc/index.html"
 SECTION = "devel"
-LICENSE = "TI" 
+LICENSE = "BSD" 
 
 require ti-paths.inc
 require ti-staging.inc
-- 
1.7.0.4



