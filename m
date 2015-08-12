Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 631FA7685A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2015 07:45:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7C7jmNU021388
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2015 00:45:48 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.235.1;
	Wed, 12 Aug 2015 00:45:48 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Aug 2015 15:45:35 +0800
Message-ID: <978ca7f4bfa02a09d864a51c25fc7a90fe3069dc.1439365242.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1439365242.git.yi.zhao@windriver.com>
References: <cover.1439365242.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 2/3] vboxguestdrivers: upgrade 4.3.22 -> 4.3.30
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Aug 2015 07:45:48 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...rivers_4.3.22.bb => vboxguestdrivers_4.3.30.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_4.3.22.bb => vboxguestdrivers_4.3.30.bb} (93%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.22.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.30.bb
similarity index 93%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.22.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.30.bb
index 270bdd3..fd2187b 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.22.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.30.bb
@@ -14,8 +14,8 @@ VBOX_NAME = "VirtualBox-${PV}"
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
            file://Makefile.utils \
 "
-SRC_URI[md5sum] = "fc21ecc1044dc13cd6c6b601823c6df3"
-SRC_URI[sha256sum] = "0d41e044589d3371f765a98ddc071d9cf9788289f72b7efbb5db64f5488c8eba"
+SRC_URI[md5sum] = "cc053340f88922a11ad9d4fab56557bd"
+SRC_URI[sha256sum] = "ea9569ec16cd6202ee61bcadb2506d31ac12fd343adb91565773a05eaaea9a36"
 
 S = "${WORKDIR}/vbox_module"
 
-- 
1.7.9.5


