Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TGSpg-0007Fq-BU
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Sep 2012 12:57:40 +0200
Received: from localhost.localdomain (public-gprs372485.centertel.pl
	[37.47.86.70])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 2B758D22DB;
	Tue, 25 Sep 2012 12:44:56 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Sep 2012 12:44:50 +0200
Message-Id: <1348569890-20572-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] ca-certificates: update to 20120623 version
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
X-List-Received-Date: Tue, 25 Sep 2012 10:57:40 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../{ca-certificates_20120212.bb => ca-certificates_20120623.bb} |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/ca-certificates/{ca-certificates_20120212.bb => ca-certificates_20120623.bb} (83%)

diff --git a/meta-oe/recipes-support/ca-certificates/ca-certificates_20120212.bb b/meta-oe/recipes-support/ca-certificates/ca-certificates_20120623.bb
similarity index 83%
rename from meta-oe/recipes-support/ca-certificates/ca-certificates_20120212.bb
rename to meta-oe/recipes-support/ca-certificates/ca-certificates_20120623.bb
index b3d7b9c..66150f0 100644
--- a/meta-oe/recipes-support/ca-certificates/ca-certificates_20120212.bb
+++ b/meta-oe/recipes-support/ca-certificates/ca-certificates_20120623.bb
@@ -2,13 +2,13 @@ DESCRIPTION = "Common CA certificates"
 HOMEPAGE = "http://packages.debian.org/sid/ca-certificates"
 SECTION = "misc"
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=6275b491c91b57d92ebe11205ebf4dfe"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=6135800ff6d893c7904d7aad90972eb5"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/ca-certificates_${PV}.tar.gz \
            file://0001-update-ca-certificates-remove-c-rehash.patch"
 
-SRC_URI[md5sum] = "391dea8d827db935ca0d0d1e6641bf23"
-SRC_URI[sha256sum] = "95f3eac93dad4433b5731bc9e106a26e2ccf210acace1927e597477b24187dce"
+SRC_URI[md5sum] = "5105d4cc086f0d4ecf7bf2e4c4667289"
+SRC_URI[sha256sum] = "878cd1130ba056fe5f96decde7e5fc1b71d35eb8565a1515744912e100731ee9"
 
 inherit autotools allarch
 
-- 
1.7.10.4



