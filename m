Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id BA70078597
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 09:07:55 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.42,391,1500912000"; d="scan'208";a="26274314"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Sep 2017 17:07:57 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 431A847ACDAF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 17:07:58 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Thu, 14 Sep 2017 17:07:57 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Sep 2017 17:07:32 +0800
Message-ID: <1505380056-34092-4-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505380056-34092-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1505380056-34092-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: 431A847ACDAF.A8A40
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] mozjs: Add HOMEPAGE info into recipe file.
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
X-List-Received-Date: Thu, 14 Sep 2017 09:07:56 -0000
Content-Type: text/plain

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
index b72ee7b..49b7f15 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
@@ -1,4 +1,5 @@
 SUMMARY = "SpiderMonkey is Mozilla's JavaScript engine written in C/C++"
+HOMEPAGE = "http://www.mozilla.org/js/"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://../../LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
 
-- 
2.7.4




