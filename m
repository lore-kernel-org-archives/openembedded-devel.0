Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 642BC7CF31
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Mar 2019 01:33:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x281XHWO002145
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 7 Mar 2019 17:33:27 -0800
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 7 Mar 2019 17:33:06 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 7 Mar 2019 20:32:36 -0500
Message-ID: <20190308013237.194105-5-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190308013237.194105-1-kai.kang@windriver.com>
References: <20190308013237.194105-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 4/5] metacity: 3.28.0 -> 3.30.1
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
X-List-Received-Date: Fri, 08 Mar 2019 01:33:36 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../metacity/{metacity_3.28.0.bb => metacity_3.30.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/metacity/{metacity_3.28.0.bb => metacity_3.30.1.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/metacity/metacity_3.28.0.bb b/meta-gnome/recipes-gnome/metacity/metacity_3.30.1.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/metacity/metacity_3.28.0.bb
rename to meta-gnome/recipes-gnome/metacity/metacity_3.30.1.bb
index 189f6ec55..253f7ef36 100644
--- a/meta-gnome/recipes-gnome/metacity/metacity_3.28.0.bb
+++ b/meta-gnome/recipes-gnome/metacity/metacity_3.30.1.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://github.com/GNOME/metacity.git;branch=master \
 "
 
 S = "${WORKDIR}/git"
-SRCREV = "c0d4b2fc0fcd6f2d3c37da935923f9e9ed5eb99f"
+SRCREV = "d69fba052cdd0aa8348dc1bbbbb1ecbadfbebbd8"
 
 EXTRA_OECONF += "--disable-xinerama"
 
-- 
2.20.0


