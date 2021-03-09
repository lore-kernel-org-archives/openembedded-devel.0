Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web08.2303.1615251860018791140
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 17:04:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
Received: from [100.113.0.194] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id 50/1D-07430-099C6406; Tue, 09 Mar 2021 01:04:16 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MxRXfCSbc
  Eg0U7NC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oxDt7+yFhzjr1j34xlbA+Nn3i5GLg4hgc1M
  Els/7maDcHYzSiw4/Y2li5GTg03AQGL/2QvsILaIgL7E0tl7mEFsYQFPiUW7d7OC2CwCKhLrf
  zxiBLF5BbwkGiY1gsUlBBQkpjx8zwwRF5Q4OfMJ2ExmAQmJgy9eAMU5gGoUJWZPl4cwqySOzF
  SbwMgzC0nDLCQNCxiZVjFaJBVlpmeU5CZm5ugaGhjoGhoa6xrqmhrqJVbpJuqlluomp+aVFCU
  CJfUSy4v1iitzk3NS9PJSSzYxAoMopZDReAfjwdcf9A4xSnIwKYnyyra6JQjxJeWnVGYkFmfE
  F5XmpBYfYpTh4FCS4D1/HCgnWJSanlqRlpkDDGiYtAQHj5IIr+JRoDRvcUFibnFmOkTqFKMux
  7ufixcxC7Hk5eelSonzzj0BVCQAUpRRmgc3AhZdlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMC
  oJ8/4DuYQnM68EbtMroCOYgI5QMAA7oiQRISXVwMTVY+spVXv4yNJdKyfYWzasT9BfWP/8Uyf
  PyzLLxKhV3v0fz7/vuSa2lsvY6c3Tt0/X2sVtWzCr99Rqv2v3M05t3y90vWriwfe5h64r31Kc
  crx/4WTPTUWXDQ502feUBJyQPXLoh7HvefUjmz6k7+muujRb6c3Pe6K1/rb8Vvdu2lyzaj6gu
  ovhtw23j+0qw7hJqtlOa9NY+NUu711QOmsx86mvjpIl3G4Lq53Vz3318z71cqs/89nj5fx2oS
  3iL58blH869L/6nU+607OHZ8yqWZnE+i/NPm18ckJtSetz9xe5hY8OPD3kfJ/7hvhmIYaXE3S
  1M434WAov3n2mM1F8r6GJ6F+v1xyB1g1b9HuUWIozEg21mIuKEwGsq41mKQMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-228.messagelabs.com!1615251856!241690!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22842 invoked from network); 9 Mar 2021 01:04:16 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-11.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Mar 2021 01:04:16 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12914Fuw017374
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Mar 2021 01:04:16 GMT
Received: from localhost.localdomain (10.167.225.35) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 9 Mar 2021 01:04:14 +0000
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-webserver] [PATCH] phpmyadmin: upgrade 5.0.4 -> 5.1.0
Date: Tue, 9 Mar 2021 18:03:53 +0800
Message-ID: <1615284233-3508-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

The following changes have taken place in copyright:
-Copyright 2013 jQuery Foundation and other contributors
-http://jquery.com/
+Copyright JS Foundation and other contributors, https://js.foundation/

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../phpmyadmin/{phpmyadmin_5.0.4.bb => phpmyadmin_5.1.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_5.0.4.bb => phpmyadmin_5.1.0.bb} (89%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.0.4.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.0.bb
similarity index 89%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.0.4.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.0.bb
index 43fed10810..cbb5bd9713 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.0.4.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.0.bb
@@ -4,15 +4,15 @@ HOMEPAGE = "http://www.phpmyadmin.net"
 LICENSE = "GPLv2 & LGPLv3 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://vendor/tecnickcom/tcpdf/LICENSE.TXT;md5=dd6470bbcd3436ca317f82d34abaf688 \
-                    file://js/vendor/jquery/MIT-LICENSE.txt;md5=e43aa437a6a1ba421653bd5034333bf9 \
+                    file://js/vendor/jquery/MIT-LICENSE.txt;md5=75308107741f7dcdc39127209c7e3fc8 \
 "
 
 SRC_URI = "https://files.phpmyadmin.net/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-languages.tar.xz \
            file://apache.conf \
 "
 
-SRC_URI[md5sum] = "38c6b9f38e4aeb68a2840d5903dd00c5"
-SRC_URI[sha256sum] = "1578c1a08e594da4f4f62e676ccbdbd17784c3de769b094ba42c35bf05c057db"
+SRC_URI[md5sum] = "4587343e706c5434adf91c396b418731"
+SRC_URI[sha256sum] = "aa8ccf357f672012384df34e1c2bc70147476761c8458a0dad6233497e142c68"
 
 UPSTREAM_CHECK_URI = "https://www.phpmyadmin.net/downloads/"
 UPSTREAM_CHECK_REGEX = "phpMyAdmin-(?P<pver>\d+(\.\d+)+)-all-languages.tar.xz"
-- 
2.25.1

