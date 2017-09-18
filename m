Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 48D8378264
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2017 04:45:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.42,410,1500912000"; d="scan'208";a="26727627"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Sep 2017 11:38:16 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 1687247CAADE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2017 11:38:15 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Mon, 18 Sep 2017 11:38:17 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 18 Sep 2017 11:38:04 +0800
Message-ID: <1505705885-40272-5-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505705885-40272-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1505705885-40272-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: 1687247CAADE.A90D9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [OE-core][PATCH] libnet-dns-perl: Add HOMEPAGE info into recipe file.
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
X-List-Received-Date: Mon, 18 Sep 2017 04:45:32 -0000
Content-Type: text/plain

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta-perl/recipes-perl/libnet/libnet-dns-perl_1.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.10.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.10.bb
index c92e265..0d89844 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.10.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.10.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "This package contains the DNS.pm module with friends."
-
+HOMEPAGE = "http://www.net-dns.org/"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 
-- 
2.7.4




