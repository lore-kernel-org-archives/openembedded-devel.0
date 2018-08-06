Return-Path: <kai.kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E6FBF74C8A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Aug 2018 10:39:13 +0000 (UTC)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id w76AdE8H028709
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Aug 2018 03:39:14 -0700 (PDT)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Mon, 06 Aug 2018 03:39:14 -0700
From: Kai Kang <kai.kang@windriver.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Aug 2018 03:39:05 -0700
Message-Id: <20180806103907.37227-4-kai.kang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180806103907.37227-1-kai.kang@windriver.com>
References: <20180806103907.37227-1-kai.kang@windriver.com>
Subject: [meta-perl][PATCH 3/5] libnet-ssleay-perl: 1.84 -> 1.85
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
X-List-Received-Date: Mon, 06 Aug 2018 10:39:14 -0000

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../libnet/{libnet-ssleay-perl_1.84.bb => libnet-ssleay-perl_1.85.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libnet/{libnet-ssleay-perl_1.84.bb => libnet-ssleay-perl_1.85.bb} (90%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.84.bb b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
similarity index 90%
rename from meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.84.bb
rename to meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
index cfecef9cf..a0bb90e7d 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.84.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
@@ -25,8 +25,8 @@ RDEPENDS_${PN} += "\
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MI/MIKEM/Net-SSLeay-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[md5sum] = "cfbe968487149626978f427cc9fb8c77"
-SRC_URI[sha256sum] = "823ec3cbb428309d6a9e56f362a9300693ce3215b7fede109adb7be361fff177"
+SRC_URI[md5sum] = "d602bdce4e0531c6efc276e3e429ca69"
+SRC_URI[sha256sum] = "9d8188b9fb1cae3bd791979c20554925d5e94a138d00414f1a6814549927b0c8"
 
 S = "${WORKDIR}/Net-SSLeay-${PV}"
 
-- 
2.11.0


