Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5BB187ED4A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2019 09:22:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7D9LHqe027611
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Aug 2019 02:21:56 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 13 Aug 2019 02:21:46 -0700
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>, <raj.khem@gmail.com>
Date: Tue, 13 Aug 2019 05:21:03 -0400
Message-ID: <20190813092118.113213-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190813092118.113213-1-kai.kang@windriver.com>
References: <20190813092118.113213-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch 01/16] libxfce4util: 4.13.4 -> 4.14.0
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
X-List-Received-Date: Tue, 13 Aug 2019 09:22:16 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{libxfce4util_4.13.4.bb => libxfce4util_4.14.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/libxfce4util/{libxfce4util_4.13.4.bb => libxfce4util_4.14.0.bb} (64%)

diff --git a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.13.4.bb b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.14.0.bb
similarity index 64%
rename from meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.13.4.bb
rename to meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.14.0.bb
index 8a68a6578..1bb5007fd 100644
--- a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.13.4.bb
+++ b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.14.0.bb
@@ -6,5 +6,5 @@ DEPENDS = "intltool-native xfce4-dev-tools-native glib-2.0"
 
 inherit xfce gtk-doc gobject-introspection
 
-SRC_URI[md5sum] = "ebb1d229a7a7f86a969a72b8d97c8531"
-SRC_URI[sha256sum] = "57dd4ba226432afdf98cea4700a4679bb1b57ce80713167f99fde50ad87d0863"
+SRC_URI[md5sum] = "46f44e36acc3abf1a5ba814c22a773cb"
+SRC_URI[sha256sum] = "32ad79b7992ec3fd863e8ff2f03eebda8740363ef9d7d910a35963ac1c1a6324"
-- 
2.20.0


