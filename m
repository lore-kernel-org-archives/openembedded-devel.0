Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1UPf9y-00043A-QW
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Apr 2013 22:28:56 +0200
Received: from localhost (176-26-190-109.dsl.ovh.fr [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 8FE0DEA042
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Apr 2013 22:18:48 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id B463EA40354; Tue,  9 Apr 2013 22:12:02 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Apr 2013 22:11:52 +0200
Message-Id: <10488ed08c8f281d9dbbb34d9ed76fb50b849bea.1365536829.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1365536829.git.apelete@seketeli.net>
References: <20130409102828.GB2474@jama>
	<cover.1365536829.git.apelete@seketeli.net>
In-Reply-To: <cover.1365536829.git.apelete@seketeli.net>
References: <cover.1365536829.git.apelete@seketeli.net>
Subject: [meta-oe][PATCH 1/1] ttf-inconsolata: add LIC_FILES_CHKSUM variable
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
X-List-Received-Date: Tue, 09 Apr 2013 20:29:08 -0000

Add mandataroy LIC_FILES_CHKSUM variable to fix build error.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
index 37c4120..8359bd8 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
@@ -3,6 +3,7 @@ require ttf.inc
 DESCRIPTION = "Inconsolata font - TTF Version"
 HOMEPAGE = "http://www.levien.com/type/myfonts/inconsolata.html"
 LICENSE = "SIL Open Font License"
+LIC_FILES_CHKSUM = "file://../OFL.txt;md5=969851e3a70122069a4d9ee61dd5a2ed"
 PR = "r0"
 
 SRC_URI = "http://levien.com/type/myfonts/Inconsolata.otf \
-- 
1.7.10.4



