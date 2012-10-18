Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TOyn8-0002x4-2A
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Oct 2012 00:42:14 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TOyaG-0003jL-Dp
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Oct 2012 00:28:56 +0200
Message-ID: <1350599179.4470.180.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Oct 2012 23:26:19 +0100
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Subject: [PATCH] atk: update to 2.6.0
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
X-List-Received-Date: Thu, 18 Oct 2012 22:42:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/recipes-support/atk/{atk_2.4.0.bb => atk_2.6.0.bb} |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/atk/{atk_2.4.0.bb => atk_2.6.0.bb} (75%)

diff --git a/meta/recipes-support/atk/atk_2.4.0.bb b/meta/recipes-support/atk/atk_2.6.0.bb
similarity index 75%
rename from meta/recipes-support/atk/atk_2.4.0.bb
rename to meta/recipes-support/atk/atk_2.6.0.bb
index 4a2d853..f9cefde 100644
--- a/meta/recipes-support/atk/atk_2.4.0.bb
+++ b/meta/recipes-support/atk/atk_2.6.0.bb
@@ -13,9 +13,9 @@ DEPENDS = "glib-2.0"
 
 inherit autotools gtk-doc pkgconfig
 
-SRC_URI = "http://download.gnome.org/sources/atk/2.4/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "2184a140f71d50276669d6eda5cce5db"
-SRC_URI[sha256sum] = "091e9ce975a9fbbc7cd8fa64c9c389ffb7fa6cdde58b6d5c01b2c267093d888d"
+SRC_URI = "http://download.gnome.org/sources/atk/2.6/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "6b34e2a63dda4429b5692be7ca3aa5bf"
+SRC_URI[sha256sum] = "eff663f90847620bb68c9c2cbaaf7f45e2ff44163b9ab3f10d15be763680491f"
 
 BBCLASSEXTEND = "native"
 
-- 
1.7.10.4





