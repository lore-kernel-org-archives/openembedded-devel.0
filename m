Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id CD1B177D81
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 07:51:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.42,376,1500912000"; d="scan'208";a="25613176"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Sep 2017 15:51:38 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id D9C5147278C9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 15:51:33 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Mon, 11 Sep 2017 15:51:36 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 11 Sep 2017 15:51:09 +0800
Message-ID: <1505116275-28580-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505116275-28580-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1505116275-28580-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: D9C5147278C9.A6407
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python-pretend: Add HOMEPAGE info into recipe file.
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
X-List-Received-Date: Mon, 11 Sep 2017 07:51:37 -0000
Content-Type: text/plain

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pretend.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-pretend.inc b/meta-python/recipes-devtools/python/python-pretend.inc
index 2d21cc4..78b6717 100644
--- a/meta-python/recipes-devtools/python/python-pretend.inc
+++ b/meta-python/recipes-devtools/python/python-pretend.inc
@@ -1,4 +1,5 @@
 SUMMARY = "A library for stubbing in Python"
+HOMEPAGE = "https://github.com/alex/pretend"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=411780c0b7fa756753e94affeee5bc99"
 
-- 
2.7.4




