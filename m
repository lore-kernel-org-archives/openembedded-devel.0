Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5106877D6E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Sep 2017 09:08:55 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.42,357,1500912000"; d="scan'208";a="25383307"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Sep 2017 17:08:57 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 327E448A61F3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Sep 2017 17:08:57 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Thu, 7 Sep 2017 17:08:56 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 7 Sep 2017 17:08:52 +0800
Message-ID: <1504775332-22166-3-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1504775332-22166-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1504775332-22166-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: 327E448A61F3.A5A81
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] fetchmail: Add HOMEPAGE info into recipe file.
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
X-List-Received-Date: Thu, 07 Sep 2017 09:08:55 -0000
Content-Type: text/plain

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta-networking/recipes-support/fetchmail/fetchmail_6.3.26.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/fetchmail/fetchmail_6.3.26.bb b/meta-networking/recipes-support/fetchmail/fetchmail_6.3.26.bb
index 359911e..1d78288 100644
--- a/meta-networking/recipes-support/fetchmail/fetchmail_6.3.26.bb
+++ b/meta-networking/recipes-support/fetchmail/fetchmail_6.3.26.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Fetchmail retrieves mail from remote mail servers and forwards it via SMTP"
+HOMEPAGE = "http://www.fetchmail.info/"
 DESCRIPTION = "Fetchmail is a full-featured, robust, well-documented remote-mail retrieval and forwarding utility intended to be used over on-demand TCP/IP links (such as SLIP or PPP connections). It supports every remote-mail protocol now in use on the Internet: POP2, POP3, RPOP, APOP, KPOP, all flavors of IMAP, ETRN, and ODMR. It can even support IPv6 and IPSEC."
 SECTION = "mail"
 LICENSE = "GPLv2 & MIT"
-- 
2.7.4




