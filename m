Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1ShT3t-0000CM-CU
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jun 2012 00:07:41 +0200
Received: from mizar.localdomain (79.21.254.221) by smtp206.alice.it
	(8.6.023.02) id 4F9BF1D306577246; Wed, 20 Jun 2012 23:56:56 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jun 2012 23:56:20 +0200
Message-Id: <1340229380-4646-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-oe][meta-initramfs][PATCH] kexecboot_git: bump PR after recipe update.
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
X-List-Received-Date: Wed, 20 Jun 2012 22:07:41 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../recipes-bsp/kexecboot/kexecboot_git.bb         |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
index b33b640..a3b4cde 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
@@ -1,6 +1,6 @@
 RDEPENDS_${PN} = "kexec"
 PV = "0.5.9"
-PR = "r8+gitr${SRCREV}"
+PR = "r9+gitr${SRCREV}"
 
 SRC_URI = "git://github.com/kexecboot/kexecboot.git;protocol=git"
 SRCREV = "0daa774eac019602cd89048961e95985ea50dadf"
-- 
1.7.3.4



