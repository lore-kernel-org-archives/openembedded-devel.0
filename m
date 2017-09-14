Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id A70ED785D5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 09:08:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.42,391,1500912000"; d="scan'208";a="26274351"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Sep 2017 17:08:09 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id A004447278FB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 17:08:07 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Thu, 14 Sep 2017 17:08:06 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Sep 2017 17:07:36 +0800
Message-ID: <1505380056-34092-8-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505380056-34092-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1505380056-34092-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: A004447278FB.A5AF0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] stunnel: Add HOMEPAGE info into recipe file.
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
X-List-Received-Date: Thu, 14 Sep 2017 09:08:09 -0000
Content-Type: text/plain

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta-networking/recipes-support/stunnel/stunnel_5.35.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.35.bb b/meta-networking/recipes-support/stunnel/stunnel_5.35.bb
index 3e2e2c2..efe9d9e 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.35.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.35.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Program for providing universal TLS/SSL tunneling service"
+HOMEPAGE = "http://www.stunnel.org/"
 DESCRIPTION = "SSL encryption wrapper between remote client and local (inetd-startable) or remote server."
 SECTION = "net"
 LICENSE = "GPLv2"
-- 
2.7.4




