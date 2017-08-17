Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 53BBF78414
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 05:49:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.41,386,1498492800"; d="scan'208";a="23863605"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Aug 2017 13:49:52 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 79030472438F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 13:49:52 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Thu, 17 Aug 2017 13:49:52 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Aug 2017 13:49:39 +0800
Message-ID: <1502948979-4046-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: 79030472438F.A4377
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] openwsman: rename to 2.6.3
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
X-List-Received-Date: Thu, 17 Aug 2017 05:49:53 -0000
Content-Type: text/plain

As openwsman has been upgrdaed to v2.6.3, but the name of recipe file still v2.6.2, so rename it.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../recipes-extended/openwsman/{openwsman_2.6.2.bb => openwsman_2.6.3.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-extended/openwsman/{openwsman_2.6.2.bb => openwsman_2.6.3.bb} (100%)

diff --git a/meta-oe/recipes-extended/openwsman/openwsman_2.6.2.bb b/meta-oe/recipes-extended/openwsman/openwsman_2.6.3.bb
similarity index 100%
rename from meta-oe/recipes-extended/openwsman/openwsman_2.6.2.bb
rename to meta-oe/recipes-extended/openwsman/openwsman_2.6.3.bb
-- 
2.7.4




