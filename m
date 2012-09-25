Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TGS0l-00067Q-KF
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Sep 2012 12:05:03 +0200
Received: from localhost.localdomain (public-gprs371602.centertel.pl
	[37.47.82.211])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 19092D22DD;
	Tue, 25 Sep 2012 11:52:19 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Sep 2012 11:52:02 +0200
Message-Id: <1348566723-29065-4-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1348566723-29065-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1348566723-29065-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [PATCH 4/5] ttf-wqy-zenhei: added license stuff
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
X-List-Received-Date: Tue, 25 Sep 2012 10:05:03 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb
index f1eb6ff..d8c88d5 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb
@@ -4,6 +4,7 @@ DESCRIPTION = "WenQuanYi Zen Hei - A Hei-Ti Style Chinese font"
 AUTHOR = "Qianqian Fang and The WenQuanYi Project Contributors"
 HOMEPAGE = "http://wqy.sourceforge.net/en/"
 LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=cf540fc7d35b5777e36051280b3a911c"
 PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/wqy/wqy-zenhei-${PV}-0.tar.gz"
-- 
1.7.10.4



