Return-Path: <kai.kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6E4D3755AD
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Aug 2018 10:39:15 +0000 (UTC)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id w76AdFNU028712
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Aug 2018 03:39:15 -0700 (PDT)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Mon, 06 Aug 2018 03:39:15 -0700
From: Kai Kang <kai.kang@windriver.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Aug 2018 03:39:06 -0700
Message-Id: <20180806103907.37227-5-kai.kang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180806103907.37227-1-kai.kang@windriver.com>
References: <20180806103907.37227-1-kai.kang@windriver.com>
Subject: [meta-perl][PATCH 4/5] libio-socket-ssl-perl: 2.054 -> 2.508
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
X-List-Received-Date: Mon, 06 Aug 2018 10:39:15 -0000

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...{libio-socket-ssl-perl_2.054.bb => libio-socket-ssl-perl_2.058.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libio/{libio-socket-ssl-perl_2.054.bb => libio-socket-ssl-perl_2.058.bb} (91%)

diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.054.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.058.bb
similarity index 91%
rename from meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.054.bb
rename to meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.058.bb
index ea78bc4e0..0fd5ea9d1 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.054.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.058.bb
@@ -22,8 +22,8 @@ RDEPENDS_${PN} += "\
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SU/SULLR/IO-Socket-SSL-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[md5sum] = "e1b412e28d107c716e7ca637e2b7f8bd"
-SRC_URI[sha256sum] = "02ea04e9a336a7d3ca9aa604c0c5b5aaf3efa513cefecfc73cc79ceeb5131e4b"
+SRC_URI[md5sum] = "5eb4091dc1e83d769cadbc925c721511"
+SRC_URI[sha256sum] = "746cd17c292cfc206b394497a060b0582d0b06a1040e6bb27e6530d56786e40b"
 
 S = "${WORKDIR}/IO-Socket-SSL-${PV}"
 
-- 
2.11.0


