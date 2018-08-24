Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9C03E7952E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2018 01:26:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7O1QKYX015005
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 18:26:20 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Thu, 23 Aug 2018 18:26:19 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 24 Aug 2018 08:48:54 +0800
Message-ID: <20180824004854.15059-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Subject: [meta-perl][PATCH] libio-socket-ssl-perl: 2.058 -> 2.059
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
X-List-Received-Date: Fri, 24 Aug 2018 01:26:19 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...ocket-ssl-perl_2.058.bb => libio-socket-ssl-perl_2.059.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libio/{libio-socket-ssl-perl_2.058.bb => libio-socket-ssl-perl_2.059.bb} (91%)

diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.058.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.059.bb
similarity index 91%
rename from meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.058.bb
rename to meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.059.bb
index 0fd5ea9d1..1e288dde7 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.058.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.059.bb
@@ -22,8 +22,8 @@ RDEPENDS_${PN} += "\
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SU/SULLR/IO-Socket-SSL-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[md5sum] = "5eb4091dc1e83d769cadbc925c721511"
-SRC_URI[sha256sum] = "746cd17c292cfc206b394497a060b0582d0b06a1040e6bb27e6530d56786e40b"
+SRC_URI[md5sum] = "0e329d3ce11563a27d70d63ad09ed5e9"
+SRC_URI[sha256sum] = "217debbe0a79f0b7c5669978b4d733271998df4497f4718f78456e5f54d64849"
 
 S = "${WORKDIR}/IO-Socket-SSL-${PV}"
 
-- 
2.18.0


