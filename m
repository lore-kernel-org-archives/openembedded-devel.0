Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 260737F238
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2019 05:30:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,224,1571673600"; d="scan'208";a="78830311"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Nov 2019 13:30:38 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id E37844CE14FF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2019 13:22:16 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 21 Nov 2019 13:30:33 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Nov 2019 13:31:08 +0800
Message-ID: <20191121053108.15446-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: E37844CE14FF.A81A5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-perl] [PATCH] libmoo-perl: upgrade 2.003004 -> 2.003006
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
X-List-Received-Date: Thu, 21 Nov 2019 05:30:39 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-License-Update: Change the LICENSE URL from http to https.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{libmoo-perl_2.003004.bb => libmoo-perl_2.003006.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libmoo/{libmoo-perl_2.003004.bb => libmoo-perl_2.003006.bb} (85%)

diff --git a/meta-perl/recipes-perl/libmoo/libmoo-perl_2.003004.bb b/meta-perl/recipes-perl/libmoo/libmoo-perl_2.003006.bb
similarity index 85%
rename from meta-perl/recipes-perl/libmoo/libmoo-perl_2.003004.bb
rename to meta-perl/recipes-perl/libmoo/libmoo-perl_2.003006.bb
index a260ab87d..0bd0eae92 100644
--- a/meta-perl/recipes-perl/libmoo/libmoo-perl_2.003004.bb
+++ b/meta-perl/recipes-perl/libmoo/libmoo-perl_2.003006.bb
@@ -7,11 +7,11 @@ SECTION = "libs"
 HOMEPAGE = "http://metapan.org/release/Moo/"
 
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-LIC_FILES_CHKSUM = "file://README;beginline=731;endline=776;md5=27efedd175eeaddbd18f4e3572bd72a8"
+LIC_FILES_CHKSUM = "file://README;beginline=742;endline=787;md5=2ee6a628a04af08d75bc73a86da86d4a"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Moo-${PV}.tar.gz"
-SRC_URI[md5sum] = "d4fcd0f240033198571fcc81ce7c5f15"
-SRC_URI[sha256sum] = "f8bbb625f8e963eabe05cff9048fdd72bdd26777404ff2c40bc690f558be91e1"
+SRC_URI[md5sum] = "53af7e7849492a8e3994ee379d12e348"
+SRC_URI[sha256sum] = "bcb2092ab18a45005b5e2e84465ebf3a4999d8e82a43a09f5a94d859ae7f2472"
 
 S = "${WORKDIR}/Moo-${PV}"
 
-- 
2.20.1




