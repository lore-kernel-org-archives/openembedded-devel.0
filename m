Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3E47C785A6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 01:18:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.42,385,1500912000"; d="scan'208";a="26028327"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Sep 2017 09:18:59 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 178F747CA462
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 09:18:58 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 13 Sep 2017 09:18:57 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 13 Sep 2017 09:18:49 +0800
Message-ID: <1505265529-31477-5-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505265529-31477-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1505265529-31477-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: 178F747CA462.A594E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] samba: Add HOMEPAGE info into recipe file.
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
X-List-Received-Date: Wed, 13 Sep 2017 01:18:58 -0000
Content-Type: text/plain

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.6.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.6.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.6.5.bb
index 389a274..fec9b0f 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.6.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.6.5.bb
@@ -1,3 +1,4 @@
+HOMEPAGE = "https://www.samba.org/"
 SECTION = "console/network"
 
 LICENSE = "GPL-3.0+ & LGPL-3.0+ & GPL-2.0+"
-- 
2.7.4




