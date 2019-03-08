Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0F2AE7CDB7
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Mar 2019 08:07:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2886TJY011281
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 8 Mar 2019 00:07:38 -0800
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 8 Mar 2019 00:07:06 -0800
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 8 Mar 2019 03:06:12 -0500
Message-ID: <20190308080614.184756-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190308080614.184756-1-kai.kang@windriver.com>
References: <20190308080614.184756-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 2/4] libxml-libxml-perl: 2.0132 -> 2.0134
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
X-List-Received-Date: Fri, 08 Mar 2019 08:07:58 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...xml-libxml-perl_2.0132.bb => libxml-libxml-perl_2.0134.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libxml/{libxml-libxml-perl_2.0132.bb => libxml-libxml-perl_2.0134.bb} (90%)

diff --git a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0132.bb b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
similarity index 90%
rename from meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0132.bb
rename to meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
index 1f1840118..9753520ae 100644
--- a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0132.bb
+++ b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
@@ -30,8 +30,8 @@ SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/XML-LibXML-${PV}.
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=64eda1bc135f0ece1d1187f2a8ac82c1 \
     file://LICENSE;md5=97871bde150daeb5e61ad95137ff2446 \
 "
-SRC_URI[libxml.md5sum] = "43546fd9a3974f19323f9fb04861ece9"
-SRC_URI[libxml.sha256sum] = "721452e3103ca188f5968ab06d5ba29fe8e00e49f4767790882095050312d476"
+SRC_URI[libxml.md5sum] = "dce687dd8b7e82d1c359fd74b1852f64"
+SRC_URI[libxml.sha256sum] = "f0bca4d0c2da35d879fee4cd13f352014186cedab27ab5e191f39b5d7d4f46cf"
 
 S = "${WORKDIR}/XML-LibXML-${PV}"
 
-- 
2.20.0


