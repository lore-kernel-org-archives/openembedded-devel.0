Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web12.6851.1616723619455495120
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 18:53:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
Received: from [100.113.0.194] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id DA/D0-07430-0AE3D506; Fri, 26 Mar 2021 01:53:36 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+EI0V1gF5t
  gMHe6osXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnHz62amgvkcFRNX3WduYDzC3sXIxSEksIVJ
  ouPcKTYIZw+jxLPTLcxdjJwcbAIGEvvPXmAHsUUE9CWWzt4DFhcWcJDo+jqDFcRmEVCVOLn0M
  pjNK+AtsfXFbhYQW0JAQWLKw/fMEHFBiZMzn4DFmQUkJA6+eAEU5wCqUZSYPV0ewqySODJTbQ
  IjzywkDbOQNCxgZFrFaJFUlJmeUZKbmJmja2hgoGtoaKxrpGtqqJdYpZuol1qqm5yaV1KUCJT
  USywv1iuuzE3OSdHLSy3ZxAgMopRCJuMdjNdef9A7xCjJwaQkynvoREyCEF9SfkplRmJxRnxR
  aU5q8SFGGQ4OJQne17axCUKCRanpqRVpmTnAgIZJS3DwKInw/gBJ8xYXJOYWZ6ZDpE4xKkqJ8
  xaCJARAEhmleXBtsCi6xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY1wpkCk9mXgnc9FdAi5
  mAFm/8EQmyuCQRISXVwFR0YIrFPg3b9a6/30r9rr7q6CF7Zv3s2E/nZRiNvNc7TN1dd5fpv/B
  rJ2+7VxVKAX6Cxvr6kacjbmfOO/JuYvsSN53sRV9MjZs/idQuetRvL31ngcmfORsKHDNcyhzs
  j5SVpu759tN/58pIrZjepav/8k/vXp7Pvmxr0GSnm7e33l0rratxJ3z78UgR1/pM+ajlrytyf
  7vFKFlOKPrf03B2C8/h9P0ub0KFA96JRlWvj7qzbtmXC28LBJv4DKZqf8iVPfuVZ+HFtNff3+
  74lvqueofiEq8TjloOPlpZxxskthz/sqW75Hpl7pxLx1bF/56a1m71a9WLZffm+5fvMlY0iBF
  XXZr/a/lDjn6+SyJKLMUZiYZazEXFiQA7hvoBHQMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-17.tower-232.messagelabs.com!1616723615!89665!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 300 invoked from network); 26 Mar 2021 01:53:36 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-17.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Mar 2021 01:53:36 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12Q1rZ6t021775
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Mar 2021 01:53:35 GMT
Received: from localhost.localdomain (10.167.225.35) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 26 Mar 2021 01:53:34 +0000
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libgee: upgrade 0.20.3 -> 0.20.4
Date: Fri, 26 Mar 2021 18:25:15 +0800
Message-ID: <1616754315-67852-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../libgee/{libgee_0.20.3.bb => libgee_0.20.4.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/libgee/{libgee_0.20.3.bb => libgee_0.20.4.bb} (77%)

diff --git a/meta-oe/recipes-devtools/libgee/libgee_0.20.3.bb b/meta-oe/recipes-devtools/libgee/libgee_0.20.4.bb
similarity index 77%
rename from meta-oe/recipes-devtools/libgee/libgee_0.20.3.bb
rename to meta-oe/recipes-devtools/libgee/libgee_0.20.4.bb
index 576eff6d5..832254a00 100644
--- a/meta-oe/recipes-devtools/libgee/libgee_0.20.3.bb
+++ b/meta-oe/recipes-devtools/libgee/libgee_0.20.4.bb
@@ -18,5 +18,5 @@ do_configure_prepend() {
     done
 }
 
-SRC_URI[archive.md5sum] = "e574b3952b93d219b5ec7c74c5892c33"
-SRC_URI[archive.sha256sum] = "d0b5edefc88cbca5f1709d19fa62aef490922c6577a14ac4e7b085507911a5de"
+SRC_URI[archive.md5sum] = "4d7d6f1f8054f1b3466c752ac2e50946"
+SRC_URI[archive.sha256sum] = "524c1bf390f9cdda4fbd9a47b269980dc64ab5280f0801b53bc69d782c72de0e"
-- 
2.25.1

