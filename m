Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7C05977E97
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 06:41:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.42,424,1500912000"; d="scan'208";a="27557068"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Sep 2017 14:40:56 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 8588247CA56C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 14:40:56 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Thu, 21 Sep 2017 14:40:55 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Sep 2017 14:41:04 +0800
Message-ID: <1505976064-45756-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505976064-45756-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1505976064-45756-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: 8588247CA56C.A7BDE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] dfu-util: Add HOMEPAGE info into recipe file.
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
X-List-Received-Date: Thu, 21 Sep 2017 06:41:12 -0000
Content-Type: text/plain

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/dfu-util/dfu-util_0.9.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/dfu-util/dfu-util_0.9.bb b/meta-oe/recipes-support/dfu-util/dfu-util_0.9.bb
index 01bca22..76e1552 100644
--- a/meta-oe/recipes-support/dfu-util/dfu-util_0.9.bb
+++ b/meta-oe/recipes-support/dfu-util/dfu-util_0.9.bb
@@ -1,4 +1,5 @@
 DESCRIPTION = "USB Device Firmware Upgrade utility"
+HOMEPAGE = "http://dfu-util.sourceforge.net"
 SECTION = "devel"
 AUTHOR = "Harald Welte <laforge@openmoko.org>"
 LICENSE = "GPLv2"
-- 
2.7.4




