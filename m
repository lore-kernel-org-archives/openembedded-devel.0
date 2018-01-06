Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0704D78837
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Jan 2018 08:32:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="34927433"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Jan 2018 16:32:03 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 46978486A77F
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Jan 2018 16:32:02 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Sat, 6 Jan 2018 16:32:01 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 6 Jan 2018 16:32:20 +0800
Message-ID: <1515227540-18600-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 46978486A77F.A44D7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] bdftopcf: 1.0.5 -> 1.1
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
X-List-Received-Date: Sat, 06 Jan 2018 08:32:03 -0000
Content-Type: text/plain

Upgrade bdftopcf from 1.0.5 to 1.1

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../recipes-graphics/xorg-app/{bdftopcf_1.0.5.bb => bdftopcf_1.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{bdftopcf_1.0.5.bb => bdftopcf_1.1.bb} (70%)

diff --git a/meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.5.bb b/meta-oe/recipes-graphics/xorg-app/bdftopcf_1.1.bb
similarity index 70%
rename from meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.5.bb
rename to meta-oe/recipes-graphics/xorg-app/bdftopcf_1.1.bb
index 35d5002..9116b5f 100644
--- a/meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.5.bb
+++ b/meta-oe/recipes-graphics/xorg-app/bdftopcf_1.1.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f9a35333adf75edd1eaef84bca65a490"
 DEPENDS = "libxfont"
 
-SRC_URI[md5sum] = "53a48e1fdfec29ab2e89f86d4b7ca902"
-SRC_URI[sha256sum] = "38f447be0c61f94c473f128cf519dd0cff63b5d7775240a2e895a183a61e2026"
+SRC_URI[md5sum] = "2a455d3c02390597feb9cefb3fe97a45"
+SRC_URI[sha256sum] = "4b4df05fc53f1e98993638d6f7e178d95b31745c4568cee407e167491fd311a2"
 
 BBCLASSEXTEND = "native"
-- 
2.7.4




