Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0E2B47759A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 09:30:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uBM9UR2e015491
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 01:30:27 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 22 Dec 2016 01:30:27 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 22 Dec 2016 17:28:09 +0800
Message-ID: <20161222092809.13510-4-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <20161222092809.13510-1-kai.kang@windriver.com>
References: <20161222092809.13510-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] pimd: update SRC_URI
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
X-List-Received-Date: Thu, 22 Dec 2016 09:30:26 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-networking/recipes-support/pimd/pimd_2.1.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/pimd/pimd_2.1.8.bb b/meta-networking/recipes-support/pimd/pimd_2.1.8.bb
index 41b8f6d..7edb642 100644
--- a/meta-networking/recipes-support/pimd/pimd_2.1.8.bb
+++ b/meta-networking/recipes-support/pimd/pimd_2.1.8.bb
@@ -4,7 +4,7 @@ SECTION = "net"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94f108f91fab720d62425770b70dd790"
 
-SRC_URI = "ftp://troglobit.com/pimd/${BP}.tar.bz2"
+SRC_URI = "ftp://ftp.troglobit.com/pimd/${BP}.tar.bz2"
 SRC_URI[md5sum] = "a12448bc7c9bfcebf51a13ebf1ffa962"
 SRC_URI[sha256sum] = "01016940543a0a6131d4e6c91b595d47e187012c59a298eec14c3dbc38564b3a"
 
-- 
2.10.1


