Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B109B7CF52
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Mar 2019 08:07:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2886TJW011281
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 8 Mar 2019 00:07:06 -0800
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 8 Mar 2019 00:06:49 -0800
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 8 Mar 2019 03:06:11 -0500
Message-ID: <20190308080614.184756-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190308080614.184756-1-kai.kang@windriver.com>
References: <20190308080614.184756-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 1/4] libnet-dns-perl: 1.18 -> 1.19
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
X-List-Received-Date: Fri, 08 Mar 2019 08:07:25 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{libnet-dns-perl_1.18.bb => libnet-dns-perl_1.19.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.18.bb => libnet-dns-perl_1.19.bb} (92%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.18.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.19.bb
similarity index 92%
rename from meta-perl/recipes-perl/libnet/libnet-dns-perl_1.18.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-perl_1.19.bb
index 4e0c9c446..b0be604f8 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.18.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.19.bb
@@ -9,8 +9,8 @@ DEPENDS += "perl"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "67af7e5c1c339f60c45c1054374bd8ee"
-SRC_URI[sha256sum] = "52ce1494fc9707fd5a60ed71db5cde727157b7f2363787d730d4d1bd9800a9d3"
+SRC_URI[md5sum] = "8a40402888487b853f861d21433f341a"
+SRC_URI[sha256sum] = "206278bdd9a538bec3e45b50e80cc5a9d7dc6e70ebf0889ef78254f0f710ccd7"
 
 UPSTREAM_CHECK_REGEX = "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.20.0


