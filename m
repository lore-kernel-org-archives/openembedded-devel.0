Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A64027BED6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Mar 2019 23:57:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x21NvX2e019464
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 1 Mar 2019 15:57:33 -0800 (PST)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.435.0;
	Fri, 1 Mar 2019 15:57:32 -0800
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Mar 2019 15:57:32 -0800
Message-ID: <20190301235732.129509-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-oe][v2][PATCH 1/1] live555: update to version 20190227
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
X-List-Received-Date: Fri, 01 Mar 2019 23:57:32 -0000
Content-Type: text/plain

Fixes CVE-2019-7314.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../live555/{live555_20170410.bb => live555_20190227.bb}             | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-multimedia/live555/{live555_20170410.bb => live555_20190227.bb} (58%)

diff --git a/meta-oe/recipes-multimedia/live555/live555_20170410.bb b/meta-oe/recipes-multimedia/live555/live555_20190227.bb
similarity index 58%
rename from meta-oe/recipes-multimedia/live555/live555_20170410.bb
rename to meta-oe/recipes-multimedia/live555/live555_20190227.bb
index 27fc429..36798fd 100644
--- a/meta-oe/recipes-multimedia/live555/live555_20170410.bb
+++ b/meta-oe/recipes-multimedia/live555/live555_20190227.bb
@@ -4,6 +4,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02 \
                    "
 
-SRC_URI[md5sum] = "b7084a72aeb09549c8b248f8cc308841"
-SRC_URI[sha256sum] = "4c37d9c828f9028403997272e49968c260385dbbaef62e28ba24faef0dda868b"
-
+SRC_URI[md5sum] = "71e096f7b3055a141fb902d7ea45ef61"
+SRC_URI[sha256sum] = "7653c44ac1c8255dd34d9151a92db8ef4af224e8b980e4af2f8937b3a30d38af"
-- 
2.7.4


