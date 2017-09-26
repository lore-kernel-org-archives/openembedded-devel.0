Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1BC9178339
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Sep 2017 02:35:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.42,438,1500912000"; d="scan'208";a="28235460"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Sep 2017 10:35:59 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id BE67447CAACB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Sep 2017 10:35:59 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Tue, 26 Sep 2017 10:35:58 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Sep 2017 10:35:59 +0800
Message-ID: <1506393360-10404-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: BE67447CAACB.AA7D0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] ebtables: Add HOMEPAGE info into recipe file.
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
X-List-Received-Date: Tue, 26 Sep 2017 02:36:00 -0000
Content-Type: text/plain

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
index e724731..d5e7341 100644
--- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
+++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Filtering tool for a Linux-based bridging firewall"
+HOMEPAGE = "http://sourceforge.net/projects/ebtables/"
 DESCRIPTION = "Utility for basic Ethernet frame filtering on a Linux bridge, \
                advanced logging, MAC DNAT/SNAT and brouting."
 LICENSE = "GPLv2"
-- 
2.7.4




