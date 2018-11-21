Return-Path: <martin@geanix.com>
X-Greylist: delayed 503 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 21 Nov 2018 08:18:41 UTC
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id 7D6106BD73
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2018 08:18:41 +0000 (UTC)
Received: from zen.localdomain (unknown [85.184.147.232])
	by mail.hundeboll.net (Postfix) with ESMTPSA id 442E21C1AF1;
	Wed, 21 Nov 2018 09:11:07 +0100 (CET)
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Nov 2018 09:10:11 +0100
Message-Id: <20181121081012.118414-2-martin@geanix.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181121081012.118414-1-martin@geanix.com>
References: <20181121081012.118414-1-martin@geanix.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/3] ell: update to 0.15
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
X-List-Received-Date: Wed, 21 Nov 2018 08:18:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Hundebøll <martin@geanix.com>
---
 meta-oe/recipes-core/ell/{ell_0.8.bb => ell_0.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/ell/{ell_0.8.bb => ell_0.15.bb} (88%)

diff --git a/meta-oe/recipes-core/ell/ell_0.8.bb b/meta-oe/recipes-core/ell/ell_0.15.bb
similarity index 88%
rename from meta-oe/recipes-core/ell/ell_0.8.bb
rename to meta-oe/recipes-core/ell/ell_0.15.bb
index 0428cab28..5dbad50f3 100644
--- a/meta-oe/recipes-core/ell/ell_0.8.bb
+++ b/meta-oe/recipes-core/ell/ell_0.15.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 inherit autotools pkgconfig
 
 S = "${WORKDIR}/git"
-SRCREV = "d572281caedef357c392a7c9aa65a3b21a18cfdb"
+SRCREV = "ea0f5f42e3af3fad2b60ee87719cdd227fd89ab0"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/ell/ell.git"
 
 do_configure_prepend () {
-- 
2.19.1


