Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.3957.1586311013693237212
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2020 18:56:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,357,1580745600"; 
   d="scan'208";a="88653193"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Apr 2020 09:56:52 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 6DA2C49DF150
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Apr 2020 09:46:29 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 8 Apr 2020 09:56:51 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 8 Apr 2020 09:56:58 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] byacc: upgrade 20191125 -> 20200330
Date: Wed, 8 Apr 2020 02:04:06 -0700
Message-ID: <1586336650-19326-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1586336650-19326-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1586336650-19326-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 6DA2C49DF150.A44D6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-License-Update: Copyright year updated to 2020.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../byacc/{byacc_20191125.bb => byacc_20200330.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/byacc/{byacc_20191125.bb => byacc_20200330.bb} (58%)

diff --git a/meta-oe/recipes-extended/byacc/byacc_20191125.bb b/meta-oe/recipes-extended/byacc/byacc_20200330.bb
similarity index 58%
rename from meta-oe/recipes-extended/byacc/byacc_20191125.bb
rename to meta-oe/recipes-extended/byacc/byacc_20200330.bb
index a4e57f5c1..975311c92 100644
--- a/meta-oe/recipes-extended/byacc/byacc_20191125.bb
+++ b/meta-oe/recipes-extended/byacc/byacc_20200330.bb
@@ -4,8 +4,8 @@
 # Setting to PD as this is what the upstream has it as.
 
 LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=3eb7c635434fafe23ef30fc263e63b2f"
+LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=262857ec5923f073fa06a1f1812225ea"
 require byacc.inc
 
-SRC_URI[md5sum] = "6745a4fbf0723c4c9280fc3e568b3d1b"
-SRC_URI[sha256sum] = "071c2ebe36afaa8448b80e893473a681e63a3b8a4ed636c0d675780a02411cde"
+SRC_URI[md5sum] = "decf6e6b82ea2efae6bbad32d7777da8"
+SRC_URI[sha256sum] = "e099e2dd8a684d739ac6b9a0e43d468314a5bc34fd21466502d120b18df51fb0"
-- 
2.17.1



