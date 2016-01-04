Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id D6786731BE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 02:09:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2172011"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Jan 2016 10:09:45 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 31E9440427FE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 10:09:28 +0800 (CST)
Received: from localhost.localdomain (10.167.226.51) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 4 Jan 2016 10:09:27 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 3 Jan 2016 18:09:26 -0800
Message-ID: <1451873366-5054-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.51]
X-yoursite-MailScanner-ID: 31E9440427FE.AF08D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] lua: 5.3.1 -> 5.3.2
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
X-List-Received-Date: Mon, 04 Jan 2016 02:09:47 -0000
Content-Type: text/plain

Upgrade lua from 5.3.1 to 5.3.2.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-devtools/lua/{lua_5.3.1.bb => lua_5.3.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/lua/{lua_5.3.1.bb => lua_5.3.2.bb} (90%)

diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.1.bb b/meta-oe/recipes-devtools/lua/lua_5.3.2.bb
similarity index 90%
rename from meta-oe/recipes-devtools/lua/lua_5.3.1.bb
rename to meta-oe/recipes-devtools/lua/lua_5.3.2.bb
index a0c993c..3fe8c3f 100644
--- a/meta-oe/recipes-devtools/lua/lua_5.3.1.bb
+++ b/meta-oe/recipes-devtools/lua/lua_5.3.2.bb
@@ -11,8 +11,8 @@ SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz \
            file://lua.pc \
 "
 
-SRC_URI[md5sum] = "797adacada8d85761c079390ff1d9961"
-SRC_URI[sha256sum] = "072767aad6cc2e62044a66e8562f51770d941e972dc1e4068ba719cd8bffac17"
+SRC_URI[md5sum] = "33278c2ab5ee3c1a875be8d55c1ca2a1"
+SRC_URI[sha256sum] = "c740c7bb23a936944e1cc63b7c3c5351a8976d7867c5252c8854f7b2af9da68f"
 
 inherit pkgconfig binconfig
 
-- 
1.9.1




