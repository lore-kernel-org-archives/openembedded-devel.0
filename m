Return-Path: <kai.kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2C95471BA0
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Aug 2018 08:54:27 +0000 (UTC)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id w768sRRL011203
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Aug 2018 01:54:27 -0700 (PDT)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Mon, 06 Aug 2018 01:54:27 -0700
From: Kai Kang <kai.kang@windriver.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Aug 2018 01:54:07 -0700
Message-Id: <20180806085408.44739-10-kai.kang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180806085408.44739-1-kai.kang@windriver.com>
References: <20180806085408.44739-1-kai.kang@windriver.com>
Subject: [meta-xfce][PATCH 09/10] xfconf: 4.13.4 -> 4.13.5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Aug 2018 08:54:27 -0000

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-xfce/recipes-xfce/xfconf/{xfconf_4.13.4.bb => xfconf_4.13.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.13.4.bb => xfconf_4.13.5.bb} (75%)

diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.4.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.5.bb
similarity index 75%
rename from meta-xfce/recipes-xfce/xfconf/xfconf_4.13.4.bb
rename to meta-xfce/recipes-xfce/xfconf/xfconf_4.13.5.bb
index b69215064..615350240 100644
--- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.4.bb
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.5.bb
@@ -8,8 +8,8 @@ inherit xfce gtk-doc
 
 EXTRA_OECONF += "PERL=${STAGING_DIR_TARGET}/usr/bin/perl"
 
-SRC_URI[md5sum] = "200d46c4e5a6019bb2b1cc3948b90c9c"
-SRC_URI[sha256sum] = "4808997894ad9b6bcd39b0e8c609129e60d204c038d4edc4e9b8c55ea2d094c9"
+SRC_URI[md5sum] = "1ce1a7f694fb6a4a4a32000f72131ea9"
+SRC_URI[sha256sum] = "90b4eb0cdf407339c091e9811f7a40b4cfa215ebb03a921503b7e21f0f4f63cb"
 
 FILES_${PN} += "${libdir}/xfce4/xfconf/xfconfd \
                 ${datadir}/dbus-1/services/org.xfce.Xfconf.service"
-- 
2.11.0


