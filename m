Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 15B627ED5C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2019 08:41:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,276,1571673600"; d="scan'208";a="79573706"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Dec 2019 16:41:24 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 4759B4CE1C86
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2019 16:32:53 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 4 Dec 2019 16:41:22 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 4 Dec 2019 07:02:18 -0800
Message-ID: <1575471738-11717-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1575471738-11717-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1575471738-11717-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 4759B4CE1C86.A812C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] postgresql: 12.0 -> 12.1
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
X-List-Received-Date: Wed, 04 Dec 2019 08:41:25 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../recipes-dbs/postgresql/{postgresql_12.0.bb => postgresql_12.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_12.0.bb => postgresql_12.1.bb} (63%)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_12.0.bb b/meta-oe/recipes-dbs/postgresql/postgresql_12.1.bb
similarity index 63%
rename from meta-oe/recipes-dbs/postgresql/postgresql_12.0.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_12.1.bb
index d5b1ebd..4868519 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_12.0.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_12.1.bb
@@ -8,5 +8,5 @@ SRC_URI += "\
    file://0001-Improve-reproducibility.patch \
 "
 
-SRC_URI[md5sum] = "87545416ef021eee8621d31a93fcc899"
-SRC_URI[sha256sum] = "cda2397215f758b793f741c86be05468257b0e6bcb1a6113882ab5d0df0855c6"
+SRC_URI[md5sum] = "2ee1bd4ec5f49363a3f456f07e599b41"
+SRC_URI[sha256sum] = "a09bf3abbaf6763980d0f8acbb943b7629a8b20073de18d867aecdb7988483ed"
-- 
2.7.4




