Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TLUpF-0006p0-QL
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2012 10:06:01 +0200
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 62F98D22BD;
	Tue,  9 Oct 2012 09:52:44 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Oct 2012 09:52:24 +0200
Message-Id: <1349769155-12643-4-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1349769155-12643-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1349769155-12643-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [PATCH 03/14] lzip: update to 1.13
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Oct 2012 08:06:01 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta-oe/recipes-support/lzip/{lzip_1.12.bb => lzip_1.13.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/lzip/{lzip_1.12.bb => lzip_1.13.bb} (85%)

diff --git a/meta-oe/recipes-support/lzip/lzip_1.12.bb b/meta-oe/recipes-support/lzip/lzip_1.13.bb
similarity index 85%
rename from meta-oe/recipes-support/lzip/lzip_1.12.bb
rename to meta-oe/recipes-support/lzip/lzip_1.13.bb
index 68f9d0d..e04b6dc 100644
--- a/meta-oe/recipes-support/lzip/lzip_1.12.bb
+++ b/meta-oe/recipes-support/lzip/lzip_1.13.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 
 SRC_URI = "http://download.savannah.gnu.org/releases/lzip/lzip-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "69a40172db5ce896b58d862c50fcd517"
-SRC_URI[sha256sum] = "eabc590d02d404dc1a1cc8e2777ed398370174b68edb22043c8ca0b209dfcd27"
+SRC_URI[md5sum] = "2f401e995c36cca05bd1805aa9c28231"
+SRC_URI[sha256sum] = "c73d36c0a926b71d484eacc192262a1d209674e3f903016f2c74a2bcbc5c28ac"
 
 CONFIGUREOPTS = "\
     '--srcdir=${S}' \
-- 
1.7.10.4



