Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.6329.1616058471762947542
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Mar 2021 02:07:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
Received: from [100.113.6.176] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 32/CF-38008-56813506; Thu, 18 Mar 2021 09:07:49 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MxVTdVIjj
  BYN8jVouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaP75SGWgg6uihWPSxsYF3J2MXJxCAlsYZLY
  /vsqM4RzglHi9ed37F2MnBxsAvoSDe9fMYPYIkD20tl7wGxhAQ+Jm5uPs4LYLAKqEuc2fmACs
  XkFPCWePFrHBmJLCChITHn4nhkiLihxcuYTFhCbWUBC4uCLF8wQNYoS23eeAYpzANlVEkdmqk
  1g5JmFpGMWko4FjEyrGC2TijLTM0pyEzNzdA0NDHQNDY11zXQNLcz0Eqt0k/RSS3WTU/NKihK
  BsnqJ5cV6xZW5yTkpenmpJZsYgWGUUsi2awfj59cf9A4xSnIwKYny/uUPThDiS8pPqcxILM6I
  LyrNSS0+xCjDwaEkwWsmDpQTLEpNT61Iy8wBhjRMWoKDR0mENxskzVtckJhbnJkOkTrFqMtx+
  fq8RcxCLHn5ealS4rwnxYCKBECKMkrz4EbA4usSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJW
  HeapBVPJl5JXCbXgEdwQR0RAR/EMgRJYkIKakGpkXz7mndZLsQO//q1/66RQKTL76q3bH/386
  ibr2Ywj979nF/2ujh9145guvBJJbarQHcBTExRn127++ImEk2rV72atWV1AcCV25/PmA4Vaxc
  3oNHJcZ7F9/BOim7K4y3Nj+/ySOzWNTq77RVeeJrA1LtnKqbCqMPHFZcPmOepp7bz4fdQtfkM
  68rOOzyfcJeYe/us89iwZlVLeznzge2eGe5bvqjs5z7Wl52T88kv42uFz6s5v0kdLIk+jL7r6
  VNK34F9ZaJNn72aLQ1XXfrnn+/Xr/2Na2arNuX3gmfMX67V7NSTpTPYSv7nAkLk5w1Ixi747w
  4r0/QDPg7fbvTWq/fK5afm/3kje6LU/Y5DUosxRmJhlrMRcWJAIoaaGkqAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-33.tower-245.messagelabs.com!1616058468!2593863!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29607 invoked from network); 18 Mar 2021 09:07:49 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-33.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Mar 2021 09:07:49 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12I97mdZ003003
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Mar 2021 09:07:48 GMT
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 18 Mar 2021 09:07:47 +0000
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-filesystems] [PATCH] xorriso: upgrade 1.5.3 -> 1.5.5
Date: Fri, 19 Mar 2021 05:07:37 +0800
Message-ID: <1616101657-4583-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../xorriso/{xorriso_1.5.3.bb => xorriso_1.5.5.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-filesystems/recipes-utils/xorriso/{xorriso_1.5.3.bb => xorriso_1.5.5.bb} (86%)

diff --git a/meta-filesystems/recipes-utils/xorriso/xorriso_1.5.3.bb b/meta-filesystems/recipes-utils/xorriso/xorriso_1.5.5.bb
similarity index 86%
rename from meta-filesystems/recipes-utils/xorriso/xorriso_1.5.3.bb
rename to meta-filesystems/recipes-utils/xorriso/xorriso_1.5.5.bb
index 30224c202..75b66d923 100644
--- a/meta-filesystems/recipes-utils/xorriso/xorriso_1.5.3.bb
+++ b/meta-filesystems/recipes-utils/xorriso/xorriso_1.5.5.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "http://www.gnu.org/software/${BPN}/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "d6b16763a2ca23eec718cfac1761b40f"
-SRC_URI[sha256sum] = "97a9c9831fa1b053f781f74a17b79327e7402c6163f5c7973453ba881616aeb4"
+SRC_URI[md5sum] = "a5e3dc4e0b92be6837f9ed6cbf7f9df5"
+SRC_URI[sha256sum] = "91663d61bee61ff790b3f6861fdf57c54af0e238ab14f297b55bae8ab5d17684"
 
 PACKAGECONFIG ??= "acl attr zlib bzip2 readline"
 PACKAGECONFIG[acl] = "--enable-libacl,--disable-libacl,acl,"
-- 
2.25.1

