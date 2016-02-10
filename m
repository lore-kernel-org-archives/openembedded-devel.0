Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 268267328A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2016 14:44:36 +0000 (UTC)
Received: from comp_016_pc_buildenv.localdomain (unknown [31.182.60.238])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 2B0212DAE8A;
	Wed, 10 Feb 2016 15:44:35 +0100 (CET)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-devel@lists.openembedded.org,
	Li xin <lixin.fnst@cn.fujitsu.com>, Kang Kai <kai.kang@windriver.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 10 Feb 2016 15:44:24 +0100
Message-Id: <1455115465-28799-1-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 2.5.0
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [meta-oe][PATCH 1/2] lua: bump lua.pc version
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
X-List-Received-Date: Wed, 10 Feb 2016 14:44:37 -0000

Lua was updated to 5.3.2, however lua.pc still has 5.2.2 listed as
Version.

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
---
 meta-oe/recipes-devtools/lua/lua/lua.pc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/lua/lua/lua.pc b/meta-oe/recipes-devtools/lua/lua/lua.pc
index e6f8b6f096dbcf578665699d2e3570dd22088d40..f14d227543c04189c5c31cd2c2737ac68933979f 100644
--- a/meta-oe/recipes-devtools/lua/lua/lua.pc
+++ b/meta-oe/recipes-devtools/lua/lua/lua.pc
@@ -4,7 +4,7 @@ includedir=${prefix}/include
 
 Name: Lua
 Description: Lua language engine
-Version: 5.2.2
+Version: 5.3.2
 Requires:
 Libs: -L${libdir} -llua
 Libs.private: -lm
-- 
2.5.0


