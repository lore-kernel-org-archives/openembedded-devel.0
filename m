Received: from [148.204.65.238] (helo=localhost.localdomain)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso@localhost.localdomain>) id 1Nh5OZ-0007qo-Jn
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Feb 2010 19:10:11 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by localhost.localdomain (8.14.3/8.14.3) with ESMTP id o1FHhUJc004099; 
	Mon, 15 Feb 2010 11:43:31 -0600
Received: (from aalonso@localhost)
	by localhost.localdomain (8.14.3/8.14.3/Submit) id o1FHhUsC004098;
	Mon, 15 Feb 2010 11:43:30 -0600
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Feb 2010 11:42:46 -0600
Message-Id: <1266255767-4031-2-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.6.6
In-Reply-To: <1266255767-4031-1-git-send-email-aalonso00@gmail.com>
References: <1266255767-4031-1-git-send-email-aalonso00@gmail.com>
X-SA-Exim-Connect-IP: 148.204.65.238
X-SA-Exim-Mail-From: aalonso@localhost.localdomain
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] device tree for xilinx ml507
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
X-List-Received-Date: Mon, 15 Feb 2010 18:10:11 -0000

From: aalonso <aalonso00@gmail.com>

---
 recipes/linux/linux.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/linux/linux.inc b/recipes/linux/linux.inc
index 7405c08..b562657 100644
--- a/recipes/linux/linux.inc
+++ b/recipes/linux/linux.inc
@@ -38,6 +38,7 @@ KERNEL_DEVICETREE_mpc8313e-rdb = "arch/${ARCH}/boot/dts/mpc8313erdb.dts"
 KERNEL_DEVICETREE_mpc8315e-rdb = "arch/${ARCH}/boot/dts/mpc8315erdb.dts"
 KERNEL_DEVICETREE_mpc8323e-rdb = "arch/${ARCH}/boot/dts/mpc832x_rdb.dts"
 KERNEL_DEVICETREE_sequoia = "arch/${ARCH}/boot/dts/sequoia.dts"
+KERNEL_DEVICETREE_xilinx-ml507 = "arch/${ARCH}/boot/dts/virtex440-ml507.dts"
 
 KERNEL_DEVICETREE_FLAGS = "-R 8 -S 0x3000"
 
-- 
1.6.6



