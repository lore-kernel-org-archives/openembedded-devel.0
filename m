Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 399907D32D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 01:29:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x621Tgeq023528
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Jul 2019 18:29:42 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 1 Jul 2019 18:29:42 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Mon, 1 Jul 2019 21:29:04 -0400
Message-ID: <20190702012913.7163-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190702012913.7163-1-kai.kang@windriver.com>
References: <20190702012913.7163-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch 02/11] exo: 0.12.5 -> 0.12.6
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
X-List-Received-Date: Tue, 02 Jul 2019 01:29:42 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-xfce/recipes-xfce/exo/{exo_0.12.5.bb => exo_0.12.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/exo/{exo_0.12.5.bb => exo_0.12.6.bb} (87%)

diff --git a/meta-xfce/recipes-xfce/exo/exo_0.12.5.bb b/meta-xfce/recipes-xfce/exo/exo_0.12.6.bb
similarity index 87%
rename from meta-xfce/recipes-xfce/exo/exo_0.12.5.bb
rename to meta-xfce/recipes-xfce/exo/exo_0.12.6.bb
index 7d61e8f83..43d8eb54d 100644
--- a/meta-xfce/recipes-xfce/exo/exo_0.12.5.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_0.12.6.bb
@@ -20,8 +20,8 @@ SRC_URI_append_class-native = " \
     file://reduce-build-to-exo-csource-only.patch \
 "
 
-SRC_URI[md5sum] = "1de1d539262847d49474d20cbebc78ea"
-SRC_URI[sha256sum] = "e8f434d6436ae647dd1614e8a24aba23c83f70cb14037b5bc98652f558be43e8"
+SRC_URI[md5sum] = "e97267e5d5a41bf5b95e9bfdaa62e47a"
+SRC_URI[sha256sum] = "1417fffc593225d61ba57b050ae2ce66ef37615c9ec66944db32019761441003"
 
 PACKAGES =+ "exo-csource"
 
-- 
2.20.0


