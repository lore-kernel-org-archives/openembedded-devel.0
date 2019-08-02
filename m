Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F02986B06C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Aug 2019 19:59:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x72JxZAt017483
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 2 Aug 2019 12:59:35 -0700 (PDT)
Received: from yow-tgamblin-lx.wrs.com (128.224.56.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Fri, 2 Aug 2019 12:59:34 -0700
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 2 Aug 2019 15:59:34 -0400
Message-ID: <20190802195934.5380-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-gnome][PATCH] metacity; upgrade from 3.30.1 to 3.32.0
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
X-List-Received-Date: Fri, 02 Aug 2019 19:59:34 -0000
Content-Type: text/plain

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../metacity/{metacity_3.30.1.bb => metacity_3.32.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/metacity/{metacity_3.30.1.bb => metacity_3.32.0.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/metacity/metacity_3.30.1.bb b/meta-gnome/recipes-gnome/metacity/metacity_3.32.0.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/metacity/metacity_3.30.1.bb
rename to meta-gnome/recipes-gnome/metacity/metacity_3.32.0.bb
index 253f7ef36..ef6ea7946 100644
--- a/meta-gnome/recipes-gnome/metacity/metacity_3.30.1.bb
+++ b/meta-gnome/recipes-gnome/metacity/metacity_3.32.0.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://github.com/GNOME/metacity.git;branch=master \
 "
 
 S = "${WORKDIR}/git"
-SRCREV = "d69fba052cdd0aa8348dc1bbbbb1ecbadfbebbd8"
+SRCREV = "bf1bfbadf47eff97703df17e95b15168e2034222"
 
 EXTRA_OECONF += "--disable-xinerama"
 
-- 
2.17.1


