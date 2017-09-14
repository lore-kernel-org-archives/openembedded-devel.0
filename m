Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C82047857B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 01:58:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.42,390,1500912000"; d="scan'208";a="26250057"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Sep 2017 09:58:43 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 076D946BA6A8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 09:58:40 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Thu, 14 Sep 2017 09:58:39 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Sep 2017 09:58:31 +0800
Message-ID: <1505354318-33200-3-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505354318-33200-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1505354318-33200-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: 076D946BA6A8.A5442
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] ipvsadm: Add HOMEPAGE info into recipe file.
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
X-List-Received-Date: Thu, 14 Sep 2017 01:58:45 -0000
Content-Type: text/plain

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta-networking/recipes-support/ipvsadm/ipvsadm_1.26.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/ipvsadm/ipvsadm_1.26.bb b/meta-networking/recipes-support/ipvsadm/ipvsadm_1.26.bb
index 8d1b3f0..b35a9f4 100644
--- a/meta-networking/recipes-support/ipvsadm/ipvsadm_1.26.bb
+++ b/meta-networking/recipes-support/ipvsadm/ipvsadm_1.26.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Linux Virtual Server administration Utility"
+HOMEPAGE = "http://www.linux-vs.org/software/index.html"
 DESCRIPTION = "Ipvsadm  is  used  to set up, maintain or inspect the virtual server \
 table in the Linux kernel. The Linux Virtual  Server  can  be  used  to \
 build  scalable  network  services  based  on  a cluster of two or more nodes. \
-- 
2.7.4




