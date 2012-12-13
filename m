Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1Tj6Mx-00039X-9S
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Dec 2012 11:50:23 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 208A0D22CD;
	Thu, 13 Dec 2012 11:36:06 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Dec 2012 11:35:27 +0100
Message-Id: <1355394929-25182-6-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1355394929-25182-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1355394929-25182-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [meta-oe][PATCH 5/7] xorg-sgml-doctools: added LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 13 Dec 2012 10:50:23 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.7.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.7.bb b/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.7.bb
index 502723c..a75c41d 100644
--- a/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.7.bb
+++ b/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.7.bb
@@ -1,4 +1,7 @@
 require xorg-doc-common.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=c8c6c808cd3c797a07b24e443af1c449"
+
 PE = "1"
 PR = "${INC_PR}.0"
 
-- 
1.8.0



