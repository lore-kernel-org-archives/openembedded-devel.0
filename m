Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RmaIk-0001qT-EL
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jan 2012 01:19:54 +0100
Received: from mizar.localdomain (87.5.74.30) by smtp206.alice.it (8.6.023.02)
	id 4ECA607907BDFA32; Mon, 16 Jan 2012 01:12:21 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 16 Jan 2012 01:12:10 +0100
Message-Id: <1326672731-7001-3-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1326672731-7001-1-git-send-email-andrea.adami@gmail.com>
References: <1326672731-7001-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld] [PATCH 2/3] linux-kexecboot: bump INC_PR to follow kexecboot upgrade
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
X-List-Received-Date: Mon, 16 Jan 2012 00:19:54 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-kexecboot.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/linux-kexecboot.inc b/recipes-kernel/linux/linux-kexecboot.inc
index f6a061e..b2758a6 100644
--- a/recipes-kernel/linux/linux-kexecboot.inc
+++ b/recipes-kernel/linux/linux-kexecboot.inc
@@ -3,7 +3,7 @@ SECTION = "kernel"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 inherit kernel siteinfo
 
-- 
1.7.3.4



