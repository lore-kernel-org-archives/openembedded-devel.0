Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C123377117
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 06:58:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7G6wEtC017494
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 23:58:14 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 15 Aug 2016 23:58:13 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 16 Aug 2016 14:57:11 +0800
Message-ID: <20160816065711.5083-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160816065711.5083-1-kai.kang@windriver.com>
References: <20160816065711.5083-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] libnftnl: 1.0.5 -> 1.0.6
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
X-List-Received-Date: Tue, 16 Aug 2016 06:58:13 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade libnftnl from 1.0.5 to 1.0.6.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-filter/libnftnl/{libnftnl_1.0.5.bb => libnftnl_1.0.6.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-filter/libnftnl/{libnftnl_1.0.5.bb => libnftnl_1.0.6.bb} (70%)

diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.0.5.bb b/meta-networking/recipes-filter/libnftnl/libnftnl_1.0.6.bb
similarity index 70%
rename from meta-networking/recipes-filter/libnftnl/libnftnl_1.0.5.bb
rename to meta-networking/recipes-filter/libnftnl/libnftnl_1.0.6.bb
index 6171151..72aec19 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl_1.0.5.bb
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.0.6.bb
@@ -7,7 +7,7 @@ DEPENDS = "libmnl"
 SRC_URI = "http://netfilter.org/projects/libnftnl/files/${BP}.tar.bz2  \
           "
 
-SRC_URI[md5sum] = "af0c62ce6bbd7a7d39def0996c1c17c9"
-SRC_URI[sha256sum] = "f6d4f5a702e38bc7987f2363f9fcd65930e8b702595c221a497e2f3a359be497"
+SRC_URI[md5sum] = "6d7f9f161538ca7efd535dcc70caf964"
+SRC_URI[sha256sum] = "ad3b932a39a1e567308e91b683b32239a5e1aea9b4582dfffe2288c3400ab07e"
 
 inherit autotools pkgconfig
-- 
2.9.3


