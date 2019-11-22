Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6D1767FC33
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Nov 2019 01:34:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,228,1571673600"; d="scan'208";a="78885641"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Nov 2019 09:34:14 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 9F1D74CE1507
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Nov 2019 09:25:52 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 22 Nov 2019 09:34:16 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 22 Nov 2019 09:34:44 +0800
Message-ID: <20191122013444.28213-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 9F1D74CE1507.A7FA9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-perl] [PATCHv2] librole-tiny-perl: upgrade 2.000006 -> 2.001004
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
X-List-Received-Date: Fri, 22 Nov 2019 01:34:15 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-License-Update: Only changed the location of the license in the file.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...-tiny-perl_2.000006.bb => librole-tiny-perl_2.001004.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/librole/{librole-tiny-perl_2.000006.bb => librole-tiny-perl_2.001004.bb} (77%)

diff --git a/meta-perl/recipes-perl/librole/librole-tiny-perl_2.000006.bb b/meta-perl/recipes-perl/librole/librole-tiny-perl_2.001004.bb
similarity index 77%
rename from meta-perl/recipes-perl/librole/librole-tiny-perl_2.000006.bb
rename to meta-perl/recipes-perl/librole/librole-tiny-perl_2.001004.bb
index c2755ea0f..41743d508 100644
--- a/meta-perl/recipes-perl/librole/librole-tiny-perl_2.000006.bb
+++ b/meta-perl/recipes-perl/librole/librole-tiny-perl_2.001004.bb
@@ -6,11 +6,11 @@ SECTION = "libs"
 HOMEPAGE = "https://metacpan.org/pod/Role::Tiny"
 
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-LIC_FILES_CHKSUM = "file://README;beginline=177;endline=214;md5=26df7e7c20551fb1906e2286624f0b71"
+LIC_FILES_CHKSUM = "file://README;beginline=182;endline=219;md5=26df7e7c20551fb1906e2286624f0b71"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Role-Tiny-${PV}.tar.gz"
-SRC_URI[md5sum] = "7c277728a7e090f64b495857cadfed08"
-SRC_URI[sha256sum] = "cc73418c904a0286ecd8915eac11f5be2a8d1e17ea9cb54c9116b0340cd3e382"
+SRC_URI[md5sum] = "98446826608b1e943e65c1f6e35942fe"
+SRC_URI[sha256sum] = "92ba5712850a74102c93c942eb6e7f62f7a4f8f483734ed289d08b324c281687"
 
 S = "${WORKDIR}/Role-Tiny-${PV}"
 
-- 
2.20.1




