Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.5786.1610434234247797295
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jan 2021 22:50:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,340,1602518400"; 
   d="scan'208";a="103391373"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 12 Jan 2021 14:50:40 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id C2DB34CE603C
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Jan 2021 14:50:39 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 12 Jan 2021 14:50:38 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] opensc: Fix the wrong version number.
Date: Tue, 12 Jan 2021 14:50:41 +0800
Message-ID: <1610434241-106312-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: C2DB34CE603C.A7226
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

The corresponding version number of commit 30180986a08cf71fe4af4b50251a8bb5b1ab95af is 0.21.0.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-support/opensc/{opensc_0.20.1.bb => opensc_0.21.0.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-support/opensc/{opensc_0.20.1.bb => opensc_0.21.0.bb} (100%)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.20.1.bb b/meta-oe/recipes-support/opensc/opensc_0.21.0.bb
similarity index 100%
rename from meta-oe/recipes-support/opensc/opensc_0.20.1.bb
rename to meta-oe/recipes-support/opensc/opensc_0.21.0.bb
-- 
2.25.1



