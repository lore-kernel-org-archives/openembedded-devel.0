Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web09.2634.1615858418038013431
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 18:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
Received: from [100.113.3.92] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id C6/EE-41911-FEA00506; Tue, 16 Mar 2021 01:33:35 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRWlGSWpSXmKPExsViZ8MRqvueKyD
  BoHkju8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvH53T62go+cFdeePmNvYOzk7GLk4hASmMkk
  8fHsXCYI5zijxIUnH9i6GDk52AT0JRrev2IGsUWA7KWz94DZwgI+Er8vd7KA2CwCqhLLFz4Gq
  ufg4BXwlpi8IRAkLCGgIDHl4Xuwcl4BQYmTM5+AlTMLSEgcfPGCGaJGUWL7zjMsEHalxNw3C5
  kmMPLMQtIyC0nLAkamVYyWSUWZ6RkluYmZObqGBga6hobGuoa6RkZmeolVuol6qaW6yal5JUW
  JQFm9xPJiveLK3OScFL281JJNjMBASilkfLSD8fTrD3qHGCU5mJREef2YAxKE+JLyUyozEosz
  4otKc1KLDzHKcHAoSfA+ZAfKCRalpqdWpGXmAIMaJi3BwaMkwlvFCpTmLS5IzC3OTIdInWL05
  viyaskiZo5na0HkhnlLgeT/u3eBZP+Cg6uZOW62H1rNLMSSl5+XKiXOe4ETaIQAyIiM0jy4Bb
  DovMQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmPcFyBSezLwSuDteAZ3IBHSiobQfyIkliQg
  pqQamOL23T54Hlwpmi7VviNLrTZ8v1dsszcIfu/Ky4JVHKcvfpzTYsv7Kvb5cSmRyV6Dihp4k
  LYaOcxN+xeybx1PNfbu98ZzGzkU/T3TZqixVDFzPGT7RO8Q86PgCtetzVrtbFPgqc75sFCz4Z
  FZ0ec3UMxoxBctFEy7u1VOOSi41OdEa/Cc7753iwYeXgnmMbnfZd5yetcpv6nPtCy9r83KrGU
  8/liwI5/6ZIHjl2q2lae2RNUILP/5cU1moslP23Oc6vhM56W8TXb7Y/tWvs2h472DB9D910eW
  j4VKf9BhWn7te8/zgk30tES9VP69i2nolsHmzxcolk+YZLt8yccrNCk6nMoknrAdtFubMtqxU
  YinOSDTUYi4qTgQAqvfvwEkDAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-15.tower-226.messagelabs.com!1615858414!560616!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6871 invoked from network); 16 Mar 2021 01:33:35 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-15.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Mar 2021 01:33:35 -0000
Received: from r01ukexcasm111.r01.fujitsu.local ([10.183.43.167])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12G1XYF6027881
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Mar 2021 01:33:34 GMT
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 16 Mar 2021 01:33:33 +0000
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] dialog: upgrade 1.3-20210117 -> 1.3-20210306
Date: Tue, 16 Mar 2021 09:33:26 +0800
Message-ID: <1615858406-107983-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../dialog/{dialog_1.3-20210117.bb => dialog_1.3-20210306.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/dialog/{dialog_1.3-20210117.bb => dialog_1.3-20210306.bb} (88%)

diff --git a/meta-oe/recipes-extended/dialog/dialog_1.3-20210117.bb b/meta-oe/recipes-extended/dialog/dialog_1.3-20210306.bb
similarity index 88%
rename from meta-oe/recipes-extended/dialog/dialog_1.3-20210117.bb
rename to meta-oe/recipes-extended/dialog/dialog_1.3-20210306.bb
index 4f49fb9062..5a293109e4 100644
--- a/meta-oe/recipes-extended/dialog/dialog_1.3-20210117.bb
+++ b/meta-oe/recipes-extended/dialog/dialog_1.3-20210306.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 SRC_URI = "ftp://ftp.invisible-island.net/${BPN}/${BP}.tgz \
           "
-SRC_URI[md5sum] = "c27db8bb67f71ee32ab1b54a3b3cebc3"
-SRC_URI[sha256sum] = "3c1ed08f44bcf6f159f2aa6fde765db94e8997b3eefb49d8b4c86691693c43e1"
+SRC_URI[md5sum] = "87793125f9bd3b8e84165f99da2a2134"
+SRC_URI[sha256sum] = "a73e7b607b635f63c0202bb3313106e700f91fe4a9f4d26ca7003f6eb2b9cb0f"
 
 # hardcoded here for use in dialog-static recipe
 S = "${WORKDIR}/dialog-${PV}"
-- 
2.25.1

