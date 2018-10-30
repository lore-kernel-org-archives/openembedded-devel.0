Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 072CD79C76
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 08:42:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9U8glRc021339
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 01:42:47 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 30 Oct 2018 01:42:46 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 30 Oct 2018 15:59:27 +0800
Message-ID: <20181030075927.23175-5-kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181030075927.23175-1-kai.kang@windriver.com>
References: <20181030075927.23175-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-perl][PATCH 4/4] libio-socket-ssl-perl: 2.059 -> 2.060
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
X-List-Received-Date: Tue, 30 Oct 2018 08:42:46 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...ocket-ssl-perl_2.059.bb => libio-socket-ssl-perl_2.060.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libio/{libio-socket-ssl-perl_2.059.bb => libio-socket-ssl-perl_2.060.bb} (91%)

diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.059.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.060.bb
similarity index 91%
rename from meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.059.bb
rename to meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.060.bb
index 1e288dde7..20f880829 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.059.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.060.bb
@@ -22,8 +22,8 @@ RDEPENDS_${PN} += "\
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SU/SULLR/IO-Socket-SSL-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[md5sum] = "0e329d3ce11563a27d70d63ad09ed5e9"
-SRC_URI[sha256sum] = "217debbe0a79f0b7c5669978b4d733271998df4497f4718f78456e5f54d64849"
+SRC_URI[md5sum] = "97fa6cd64f15db60f810cd8ab02d57fc"
+SRC_URI[sha256sum] = "fb5b2877ac5b686a5d7b8dd71cf5464ffe75d10c32047b5570674870e46b1b8c"
 
 S = "${WORKDIR}/IO-Socket-SSL-${PV}"
 
-- 
2.18.0


