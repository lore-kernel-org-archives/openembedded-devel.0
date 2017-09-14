Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C836E78598
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 09:07:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.42,391,1500912000"; d="scan'208";a="26274304"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Sep 2017 17:07:51 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id D8C0C46BA6A8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 17:07:49 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Thu, 14 Sep 2017 17:07:49 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Sep 2017 17:07:30 +0800
Message-ID: <1505380056-34092-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505380056-34092-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1505380056-34092-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: D8C0C46BA6A8.A8274
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] libtdb: Add HOMEPAGE info into recipe file.
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
X-List-Received-Date: Thu, 14 Sep 2017 09:07:50 -0000
Content-Type: text/plain

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta-networking/recipes-support/libtdb/libtdb_1.3.14.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.3.14.bb b/meta-networking/recipes-support/libtdb/libtdb_1.3.14.bb
index ccc4ee4..3122b93 100644
--- a/meta-networking/recipes-support/libtdb/libtdb_1.3.14.bb
+++ b/meta-networking/recipes-support/libtdb/libtdb_1.3.14.bb
@@ -1,4 +1,5 @@
 SUMMARY = "The tdb library"
+HOMEPAGE = "http://tdb.samba.org/"
 SECTION = "libs"
 LICENSE = "LGPL-3.0+ & GPL-3.0+"
 
-- 
2.7.4




