Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E4F667FD03
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 02:09:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,427,1571673600"; d="scan'208";a="81708609"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Jan 2020 10:09:47 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 8539C4CE2E60
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 10:00:39 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 13 Jan 2020 10:09:42 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 13 Jan 2020 10:09:45 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 12 Jan 2020 22:00:59 -0800
Message-ID: <1578895261-30411-5-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578895261-30411-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1578895261-30411-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 8539C4CE2E60.A51E7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] libsdl2-mixer: upgrade 2.0.2 -> 2.0.4
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
X-List-Received-Date: Mon, 13 Jan 2020 02:09:47 -0000
Content-Type: text/plain

-License-Update: Copyright year updated to 2018.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{libsdl2-mixer_2.0.2.bb => libsdl2-mixer_2.0.4.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/libsdl/{libsdl2-mixer_2.0.2.bb => libsdl2-mixer_2.0.4.bb} (77%)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.2.bb b/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb
similarity index 77%
rename from meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.2.bb
rename to meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb
index 718f3f5fd..aa246f999 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.2.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb
@@ -2,12 +2,12 @@ SUMMARY = "Simple DirectMedia Layer mixer library V2"
 SECTION = "libs"
 DEPENDS = "virtual/libsdl2 flac libmikmod libvorbis"
 LICENSE = "Zlib"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=95e0c3cf63f71b950911e698a54b7fc5"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=516daf7a177ad4c8874bb9efa1a69c1f"
 
 SRC_URI = "http://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "aaa0551393993c14a13f72b339c0ed6c"
-SRC_URI[sha256sum] = "4e615e27efca4f439df9af6aa2c6de84150d17cbfd12174b54868c12f19c83bb"
+SRC_URI[md5sum] = "a36e8410cac46b00a4d01752b32c3eb1"
+SRC_URI[sha256sum] = "b4cf5a382c061cd75081cf246c2aa2f9df8db04bdda8dcdc6b6cca55bede2419"
 
 S = "${WORKDIR}/SDL2_mixer-${PV}"
 
-- 
2.17.1




