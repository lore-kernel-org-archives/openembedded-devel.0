Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id CB3E87F69B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2019 06:06:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,224,1571673600"; d="scan'208";a="78832078"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Nov 2019 14:06:03 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id AF4494CE1BF2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2019 13:57:46 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 21 Nov 2019 14:06:04 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Nov 2019 14:06:34 +0800
Message-ID: <20191121060634.20904-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: AF4494CE1BF2.AB3E8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-perl] [PATCH] libclass-method-modifiers-perl: upgrade 2.12 -> 2.13
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
X-List-Received-Date: Thu, 21 Nov 2019 06:06:04 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...rs-perl_2.12.bb => libclass-method-modifiers-perl_2.13.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libclass/{libclass-method-modifiers-perl_2.12.bb => libclass-method-modifiers-perl_2.13.bb} (84%)

diff --git a/meta-perl/recipes-perl/libclass/libclass-method-modifiers-perl_2.12.bb b/meta-perl/recipes-perl/libclass/libclass-method-modifiers-perl_2.13.bb
similarity index 84%
rename from meta-perl/recipes-perl/libclass/libclass-method-modifiers-perl_2.12.bb
rename to meta-perl/recipes-perl/libclass/libclass-method-modifiers-perl_2.13.bb
index 3979b3142..58ed37ca8 100644
--- a/meta-perl/recipes-perl/libclass/libclass-method-modifiers-perl_2.12.bb
+++ b/meta-perl/recipes-perl/libclass/libclass-method-modifiers-perl_2.13.bb
@@ -10,8 +10,8 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=16fd0ec7b73c0e158426f753943f1058"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETHER/Class-Method-Modifiers-${PV}.tar.gz"
-SRC_URI[md5sum] = "f55400c7a8134acf3657f8af89bdd7af"
-SRC_URI[sha256sum] = "e44c1073020bf55b8c97975ed77235fd7e2a6a56f29b5c702301721184e27ac8"
+SRC_URI[md5sum] = "b1398e3682aa2e075b913b9f9000b596"
+SRC_URI[sha256sum] = "ab5807f71018a842de6b7a4826d6c1f24b8d5b09fcce5005a3309cf6ea40fd63"
 
 S = "${WORKDIR}/Class-Method-Modifiers-${PV}"
 
-- 
2.20.1




