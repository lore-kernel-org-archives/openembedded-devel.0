Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MJ1yc-0006C2-UQ
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 11:07:39 +0200
Received: (qmail 32481 invoked by uid 813007); 23 Jun 2009 08:56:36 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 23 Jun 2009 08:56:36 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Jun 2009 10:55:51 +0200
Message-Id: <1245747353-27218-3-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <200906230939.34062.marcin@juszkiewicz.com.pl>
References: <200906230939.34062.marcin@juszkiewicz.com.pl>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [STABLE][PATCH 049/125] Documentation for PACKAGE_ARCH is actually for PACKAGE_ARCHS
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
X-List-Received-Date: Tue, 23 Jun 2009 09:07:39 -0000

From: Mario Domenech Goulart <mario@ossystems.com.br>

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 docs/usermanual/reference/class_rootfs_ipkg.xml |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/usermanual/reference/class_rootfs_ipkg.xml b/docs/usermanual/reference/class_rootfs_ipkg.xml
index 98e6e25..fde8a38 100644
--- a/docs/usermanual/reference/class_rootfs_ipkg.xml
+++ b/docs/usermanual/reference/class_rootfs_ipkg.xml
@@ -114,7 +114,7 @@
     </varlistentry>
 
     <varlistentry>
-      <term>PACKAGE_ARCH</term>
+      <term>PACKAGE_ARCHS</term>
 
       <listitem>
         <para>Defines the list of architectures that are support by the target
-- 
1.6.3.1





