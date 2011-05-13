Received: from smtp201.alice.it ([82.57.200.97])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1QKrll-0003CS-1R
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 May 2011 14:47:01 +0200
Received: from localhost.localdomain (79.51.85.13) by smtp201.alice.it
	(8.5.124.08) (authenticated as editempo@alice.it)
	id 4CC05A4C06BF0174; Fri, 13 May 2011 14:44:14 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: Stefan Schmidt <stefan@buglabs.net>
Date: Fri, 13 May 2011 14:43:05 +0200
Message-Id: <1305290588-7057-7-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1305290080.2448.3.camel@gnutoo-laptop>
References: <1305290080.2448.3.camel@gnutoo-laptop>
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 07/12] linux-bug20-linaro: use newer srcrev
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
X-List-Received-Date: Fri, 13 May 2011 12:47:01 -0000

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 recipes/linux/linux-bug20-linaro_2.6.35.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/linux/linux-bug20-linaro_2.6.35.bb b/recipes/linux/linux-bug20-linaro_2.6.35.bb
index 6f1bafe..8b8a6ef 100644
--- a/recipes/linux/linux-bug20-linaro_2.6.35.bb
+++ b/recipes/linux/linux-bug20-linaro_2.6.35.bb
@@ -5,9 +5,9 @@ KERNEL_IMAGETYPE = "uImage"
 
 COMPATIBLE_MACHINE = "bug20"
 
-PR = "r0"
+PR = "r1"
 
-SRCREV = "be4f840306ef858cffc182cde38714f9423bdeb3"
+SRCREV = "42f43f4bd4a0b612b7bcad3414e42a507282fe8b"
 
 
 SRC_URI = "git://github.com/buglabs/bug20-2.6.35-linaro.git;branch=master;protocol=git"
-- 
1.7.0.4



