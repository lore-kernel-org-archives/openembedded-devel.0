Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C59E060017
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2019 09:23:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7D9Nup8017379
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Aug 2019 02:23:56 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 13 Aug 2019 02:23:55 -0700
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>, <raj.khem@gmail.com>
Date: Tue, 13 Aug 2019 05:21:16 -0400
Message-ID: <20190813092118.113213-15-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190813092118.113213-1-kai.kang@windriver.com>
References: <20190813092118.113213-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch 14/16] xfce4-settings: 4.13.7 -> 4.14.0
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
X-List-Received-Date: Tue, 13 Aug 2019 09:23:55 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{xfce4-settings_4.13.7.bb => xfce4-settings_4.14.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.13.7.bb => xfce4-settings_4.14.0.bb} (89%)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.13.7.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.14.0.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.13.7.bb
rename to meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.14.0.bb
index 2d16a02ce..902e326de 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.13.7.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.14.0.bb
@@ -11,8 +11,8 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI += " \
     file://0001-xsettings.xml-Set-default-themes.patch \
 "
-SRC_URI[md5sum] = "ec0a3daa810bce57cf140317243eeb1d"
-SRC_URI[sha256sum] = "ac11391eee22cb5fbffe3342916bcf9805f29c722aca825c2f57d98dc167a065"
+SRC_URI[md5sum] = "dcbc673448e1a816b2c47a7ce0ca13aa"
+SRC_URI[sha256sum] = "e03040d623abda0222ad04f226582277a1936507ddfa927ec8e87927debc113c"
 
 EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
 
-- 
2.20.0


