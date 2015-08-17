Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 92F4D75E81
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2015 09:52:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7H9qHQN011103
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2015 02:52:17 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Mon, 17 Aug 2015 02:52:17 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 17 Aug 2015 17:48:36 +0800
Message-ID: <1439804916-23152-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-oe] sdparm: upgrade to 1.09
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Aug 2015 09:52:18 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-oe/recipes-support/sdparm/{sdparm_1.08.bb => sdparm_1.09.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/sdparm/{sdparm_1.08.bb => sdparm_1.09.bb} (83%)

diff --git a/meta-oe/recipes-support/sdparm/sdparm_1.08.bb b/meta-oe/recipes-support/sdparm/sdparm_1.09.bb
similarity index 83%
rename from meta-oe/recipes-support/sdparm/sdparm_1.08.bb
rename to meta-oe/recipes-support/sdparm/sdparm_1.09.bb
index b603a56..ca11ca4 100644
--- a/meta-oe/recipes-support/sdparm/sdparm_1.08.bb
+++ b/meta-oe/recipes-support/sdparm/sdparm_1.09.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://sg.danny.cz/sg/p/${BPN}-${PV}.tgz \
 PACKAGES =+ "${PN}-scripts"
 RDEPENDS_${PN}-scripts += "bash ${PN}"
 
-SRC_URI[md5sum] = "be5786f37499018ef44f409597c92d42"
-SRC_URI[sha256sum] = "376b78a414b1a9c47f3f13dbeb963e7a3ec7be126f83927d6856b5f7ac425e57"
+SRC_URI[md5sum] = "e51b1fd41c3e4c9d1274a2e4f046eebf"
+SRC_URI[sha256sum] = "7294f44173ac0946f1de8af02b1bdb0bd648079245396589397a2b0d3abc42d3"
 
 inherit autotools
 
-- 
1.9.1


