Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id CBF8A77DCD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 02:16:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.42,375,1500912000"; d="scan'208";a="25591652"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Sep 2017 10:17:01 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 81E7F46BA6AE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 10:16:59 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Mon, 11 Sep 2017 10:17:01 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 11 Sep 2017 10:16:46 +0800
Message-ID: <1505096207-27989-4-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505096207-27989-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1505096207-27989-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: 81E7F46BA6AE.A8DB2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python-enum34: Add HOMEPAGE info into recipe file.
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
X-List-Received-Date: Mon, 11 Sep 2017 02:17:00 -0000
Content-Type: text/plain

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-enum34_1.1.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-enum34_1.1.6.bb b/meta-python/recipes-devtools/python/python-enum34_1.1.6.bb
index 31d2147..d50b5c7 100644
--- a/meta-python/recipes-devtools/python/python-enum34_1.1.6.bb
+++ b/meta-python/recipes-devtools/python/python-enum34_1.1.6.bb
@@ -1,4 +1,5 @@
 SUMMARY = "backport of Python 3.4's enum package"
+HOMEPAGE = "https://bitbucket.org/stoneleaf/enum34"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://enum/LICENSE;md5=0a97a53a514564c20efd7b2e8976c87e"
 
-- 
2.7.4




