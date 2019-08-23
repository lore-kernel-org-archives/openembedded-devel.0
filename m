Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4404F6C1D5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2019 05:22:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,420,1559491200"; d="scan'208";a="74142608"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Aug 2019 13:22:26 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 9DFB04CE0873
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2019 13:22:23 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 23 Aug 2019 13:22:30 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Aug 2019 14:22:15 +0900
Message-ID: <20190823052215.3208-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: 9DFB04CE0873.A106E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] kpatch: upgrade 0.7.1 -> 0.8.0
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
X-List-Received-Date: Fri, 23 Aug 2019 05:22:27 -0000
Content-Type: text/plain

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-kernel/kpatch/kpatch_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-kernel/kpatch/kpatch_git.bb b/meta-oe/recipes-kernel/kpatch/kpatch_git.bb
index dc247942f..508bddb86 100644
--- a/meta-oe/recipes-kernel/kpatch/kpatch_git.bb
+++ b/meta-oe/recipes-kernel/kpatch/kpatch_git.bb
@@ -2,9 +2,9 @@ require kpatch.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV = "d7c5810e2a6acacfa5fec1e38d2f75af8e8c818c"
+SRCREV = "2a29bc7dea9a7da12705c7b50315eee1acdd9156"
 
-PV = "0.7.1+git${SRCPV}"
+PV = "0.8.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1




