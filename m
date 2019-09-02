Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 937757ED64
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Sep 2019 09:41:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x829f9MV009521
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 2 Sep 2019 02:41:09 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Mon, 2 Sep 2019 02:41:09 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 2 Sep 2019 17:41:07 +0800
Message-ID: <1567417267-321641-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] postgresql: 11.4 -> 11.5
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
X-List-Received-Date: Mon, 02 Sep 2019 09:41:08 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-dbs/postgresql/{postgresql_11.4.bb => postgresql_11.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_11.4.bb => postgresql_11.5.bb} (63%)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_11.4.bb b/meta-oe/recipes-dbs/postgresql/postgresql_11.5.bb
similarity index 63%
rename from meta-oe/recipes-dbs/postgresql/postgresql_11.4.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_11.5.bb
index 0e7ddc8..fd4200a 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_11.4.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_11.5.bb
@@ -8,5 +8,5 @@ SRC_URI += "\
    file://0001-Improve-reproducibility.patch \
 "
 
-SRC_URI[md5sum] = "dab5eed8a5f9204bf2f03a209eead4c3"
-SRC_URI[sha256sum] = "02802ddffd1590805beddd1e464dd28a46a41a5f1e1df04bab4f46663195cc8b"
+SRC_URI[md5sum] = "580da94f6d85046ff2a228785ab2cc89"
+SRC_URI[sha256sum] = "7fdf23060bfc715144cbf2696cf05b0fa284ad3eb21f0c378591c6bca99ad180"
-- 
2.7.4


