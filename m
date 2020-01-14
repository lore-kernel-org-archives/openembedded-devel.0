Return-Path: <Matthew.Zeng@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CB0E57F986
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2020 21:05:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 00EL4pOE009782
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2020 13:05:12 -0800
Received: from mzeng (128.224.141.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 14 Jan 2020 13:05:00 -0800
User-agent: mu4e 1.3.6; emacs 28.0.50
From: "Mingde (Matthew) Zeng" <matthew.zeng@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 14 Jan 2020 16:04:59 -0500
Message-ID: <878sm9kav8.fsf@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.141.67]
Subject: [meta-oe][PATCH] byacc: upgrade 20191103 -> 20191125
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
X-List-Received-Date: Tue, 14 Jan 2020 21:05:22 -0000
Content-Type: text/plain


Signed-off-by: Matthew Zeng <Matthew.Zeng@windriver.com>
---
 .../byacc/{byacc_20191103.bb => byacc_20191125.bb}           | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/byacc/{byacc_20191103.bb => byacc_20191125.bb} (74%)

diff --git a/meta-oe/recipes-extended/byacc/byacc_20191103.bb b/meta-oe/recipes-extended/byacc/byacc_20191125.bb
similarity index 74%
rename from meta-oe/recipes-extended/byacc/byacc_20191103.bb
rename to meta-oe/recipes-extended/byacc/byacc_20191125.bb
index eae4618e2..a4e57f5c1 100644
--- a/meta-oe/recipes-extended/byacc/byacc_20191103.bb
+++ b/meta-oe/recipes-extended/byacc/byacc_20191125.bb
@@ -7,6 +7,5 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=3eb7c635434fafe23ef30fc263e63b2f"
 require byacc.inc

-SRC_URI[md5sum] = "84ffe59166f67bbe147a6f502c7af309"
-SRC_URI[sha256sum] = "d291fb34816f45079067366b7f7300ffbf9f7e3f1aaf6d509b84442d065d11b9"
-
+SRC_URI[md5sum] = "6745a4fbf0723c4c9280fc3e568b3d1b"
+SRC_URI[sha256sum] = "071c2ebe36afaa8448b80e893473a681e63a3b8a4ed636c0d675780a02411cde"
--
2.24.0

