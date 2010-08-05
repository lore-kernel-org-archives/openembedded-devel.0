Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1Oh6XG-0008JW-Tx
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 21:55:27 +0200
Received: by qwg8 with SMTP id 8so4468536qwg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Aug 2010 12:55:20 -0700 (PDT)
Received: by 10.229.51.197 with SMTP id e5mr3886813qcg.234.1281038120454;
	Thu, 05 Aug 2010 12:55:20 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id w2sm615100qcq.24.2010.08.05.12.55.19
	(version=SSLv3 cipher=RC4-MD5); Thu, 05 Aug 2010 12:55:19 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Aug 2010 14:55:18 -0500
Message-Id: <1281038118-15059-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] u-boot: beagleboard: fixed patch filename error
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
X-List-Received-Date: Thu, 05 Aug 2010 19:55:27 -0000


Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 recipes/u-boot/u-boot_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/u-boot/u-boot_git.bb b/recipes/u-boot/u-boot_git.bb
index 79c2b95..a016af8 100644
--- a/recipes/u-boot/u-boot_git.bb
+++ b/recipes/u-boot/u-boot_git.bb
@@ -69,8 +69,8 @@ SRC_URI_beagleboard = "git://www.denx.de/git/u-boot.git;protocol=git \
                        file://0042-BeagleBoard-New-command-for-status-of-USER-button.patch \
                        file://0043-BeagleBoard-Add-CONFIG_SYS_MEMTEST_SCRATCH.patch \
                        file://0044-Beagleboard-Adjust-boot.patch \
-                       file://0045-Beagleboard-Enable-pullups-on-i2c2.patch \
-                       file://0046-Beagleboard-Add-camera-to-default-bootargs.patch \
+                       file://0045-BeagleBoard-Enable-pullups-on-i2c2.patch \
+                       file://0046-BeagleBoard-Add-camera-to-default-bootargs.patch \
                        file://fw_env.config \
 "
 SRCREV_beagleboard = "ca6e1c136ddb720c3bb2cc043b99f7f06bc46c55"
-- 
1.5.6.4



