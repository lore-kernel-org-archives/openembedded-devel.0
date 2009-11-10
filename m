Received: from [66.33.216.122] (helo=hapkido.dreamhost.com ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sebastian@SSpaeth.de>) id 1N7pe6-0006IJ-JA
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 13:16:29 +0100
Received: from homiemail-a21.g.dreamhost.com (caiajhbdcbbj.dreamhost.com
	[208.97.132.119])
	by hapkido.dreamhost.com (Postfix) with ESMTP id BDE0317ECA2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2009 04:15:11 -0800 (PST)
Received: from localhost.localdomain (mtec-hg-docking-1-dhcp-199.ethz.ch
	[129.132.133.199])
	by homiemail-a21.g.dreamhost.com (Postfix) with ESMTPA id 8E909300064; 
	Tue, 10 Nov 2009 04:15:07 -0800 (PST)
From: Sebastian Spaeth <Sebastian@SSpaeth.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Nov 2009 13:14:59 +0100
Message-Id: <1257855299-29638-1-git-send-email-Sebastian@SSpaeth.de>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 66.33.216.122
X-SA-Exim-Mail-From: Sebastian@SSpaeth.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Sebastian Spaeth <Sebastian@SSpaeth.de>
Subject: [PATCH] minimal.conf: fix spelling for BAD_RECOMMENDATIONS
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
X-List-Received-Date: Tue, 10 Nov 2009 12:16:29 -0000

Signed-off-by: Sebastian Spaeth <Sebastian@SSpaeth.de>
---
 conf/distro/minimal.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
index ecf6649..33eceab 100644
--- a/conf/distro/minimal.conf
+++ b/conf/distro/minimal.conf
@@ -126,7 +126,7 @@ DISTRO_EXTRA_RDEPENDS += "\
   ${DISTRO_EXTRA_APPS} \
 "
 
-# Additional content II (can be masked with BAD_RECOMMENDS)
+# Additional content II (can be masked with BAD_RECOMMENDATIONS)
 DISTRO_EXTRA_RRECOMMENDS += " \
     kernel-module-vfat \
     kernel-module-ext2 \
-- 
1.6.3.3



