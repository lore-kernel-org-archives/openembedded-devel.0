Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TLUpG-0006pG-H8
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2012 10:06:02 +0200
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id A76FBD22C1;
	Tue,  9 Oct 2012 09:52:46 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Oct 2012 09:52:28 +0200
Message-Id: <1349769155-12643-8-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1349769155-12643-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1349769155-12643-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [PATCH 07/14] ttf-hunkyfonts: added license stuff
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
X-List-Received-Date: Tue, 09 Oct 2012 08:06:02 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb
index a2ef0cf..4a23451 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb
@@ -3,6 +3,7 @@ require ttf.inc
 DESCRIPTION = "Hunky fonts - TTF Version"
 HOMEPAGE = "http://sourceforge.net/projects/hunkyfonts"
 LICENSE = "LGPL"
+LIC_FILES_CHKSUM = "file://../LICENSE;md5=7fbc338309ac38fefcd64b04bb903e34"
 PR = "r5"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/hunkyfonts/hunkyfonts-${PV}.tar.bz2"
-- 
1.7.10.4



