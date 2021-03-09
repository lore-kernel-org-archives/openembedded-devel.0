Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web10.2324.1615251799508555422
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 17:03:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.5, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
Received: from [100.112.192.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id CD/14-42970-459C6406; Tue, 09 Mar 2021 01:03:16 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeJIrShJLcpLzFFi42Kxs+EI1Q056ZZ
  gsGGJhsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnF8iWnBKc6KHbcPsjQwnuXoYuTiEBLYzCTR
  MG8vI4Szm1Hi8IapLF2MnBxsAgYS+89eYAexRQT0JZbO3sMMYgsLuEnc/XyQCcRmEVCR+PZkP
  1g9r4CXxLvGS2D1EgIKElMevmeGiAtKnJz5BKyGWUBC4uCLF0BxDqAaRYnZ0+UhzCqJIzPVJj
  DyzELSMAtJwwJGplWM5klFmekZJbmJmTm6hgYGuoaGRrqGlka6JiZ6iVW6iXqppbrlqcUluoZ
  6ieXFesWVuck5KXp5qSWbGIEBlFJwQGcH489XH/QOMUpyMCmJ8sq2uiUI8SXlp1RmJBZnxBeV
  5qQWH2KU4eBQkuA9fxwoJ1iUmp5akZaZAwxmmLQEB4+SCK/iUaA0b3FBYm5xZjpE6hSjopQ47
  9wTQAkBkERGaR5cGyyCLjHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5v0Hsp0nM68EbvoroM
  VMQIsVDMAWlyQipKQamDKWdLtMCvRYeZV337IgTjOPZdMk3XkczNiu31ZtsCpWEHeR2sol5ee
  wdlFa2KRgw48SRkdUfT4c2xmztPnNKgFlgY1ilvasFiysctW7A0XmbdZIWbTz0GwZvZmvTZ3n
  bErvvsG77Bbzuevp8bMyRFjYLxr5az1id1x54rp6dLeph1tP3bZG+XOmm7VvsnoKrda1k2Ez+
  8vsGXUkLeX2x4f9Vld013r9iZ9wJf79QZY49murept3JOz/Er75YHH99DlTTSrObDv8wNXC3k
  nCZGdEptGCGP3In0/LnCbz53Kafs/cuM3c6+kv3aMeTqKSVzQMrC5oGxhbrtQJ/2Z3becPuXf
  sV1a4TV+ju1hAiaU4I9FQi7moOBEAwq6QNhsDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-19.tower-267.messagelabs.com!1615251796!1547624!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24273 invoked from network); 9 Mar 2021 01:03:16 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-19.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Mar 2021 01:03:16 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 129137cp004467
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Mar 2021 01:03:16 GMT
Received: from localhost.localdomain (10.167.225.35) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 9 Mar 2021 01:03:06 +0000
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] [oe] [meta-oe] [PATCH] uthash: upgrade 2.2.0 -> 2.3.0
Date: Tue, 9 Mar 2021 18:02:58 +0800
Message-ID: <1615284178-3454-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

-License-Update: Copyright year updated to 2021.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../uthash/{uthash_2.2.0.bb => uthash_2.3.0.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/uthash/{uthash_2.2.0.bb => uthash_2.3.0.bb} (90%)

diff --git a/meta-oe/recipes-support/uthash/uthash_2.2.0.bb b/meta-oe/recipes-support/uthash/uthash_2.3.0.bb
similarity index 90%
rename from meta-oe/recipes-support/uthash/uthash_2.2.0.bb
rename to meta-oe/recipes-support/uthash/uthash_2.3.0.bb
index 4ec7bc2f5e..ca8a3c0bb1 100644
--- a/meta-oe/recipes-support/uthash/uthash_2.2.0.bb
+++ b/meta-oe/recipes-support/uthash/uthash_2.3.0.bb
@@ -8,8 +8,8 @@ DESCRIPTION = " uthash-dev provides a hash table implementation using C preproce
 HOMEPAGE = "https://troydhanson.github.io/uthash/"
 SECTION = "base"
 LICENSE = "BSD-1-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6891c324eb59289db33bac74d4cbb0d4"
-SRCREV = "66e2668795d0aaf4977523f828e548470a680c33"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=736712b5904dd42f8678df7172bc5f2b"
+SRCREV = "e493aa90a2833b4655927598f169c31cfcdf7861"
 
 SRC_URI = "\
     git://github.com/troydhanson/${BPN}.git \
-- 
2.25.1

