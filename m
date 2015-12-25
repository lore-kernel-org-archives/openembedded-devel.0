Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9221973182
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Dec 2015 07:56:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBP7uehv028314
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2015 23:56:40 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 24 Dec 2015 23:56:40 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 25 Dec 2015 15:56:32 +0800
Message-ID: <ec4b83a3bd55aafb0a90f3eb0eea1b15cf9ade42.1451029460.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1451029460.git.jackie.huang@windriver.com>
References: <cover.1451029460.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-java][PATCH 12/15] jamvm-git uprev to 2.0.0
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
X-List-Received-Date: Fri, 25 Dec 2015 07:56:39 -0000
Content-Type: text/plain

From: Amy Fong <amy.fong@windriver.com>

Signed-off-by: Amy Fong <amy.fong@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 recipes-core/jamvm/jamvm_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/jamvm/jamvm_git.bb b/recipes-core/jamvm/jamvm_git.bb
index 63364aa..6bbfa52 100644
--- a/recipes-core/jamvm/jamvm_git.bb
+++ b/recipes-core/jamvm/jamvm_git.bb
@@ -7,8 +7,8 @@ inherit distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRCREV = "ebd11bde0a97b57f0d18938c6b65468d3c932719"
-PV = "1.5.5+1.6.0-devel+git${SRCPV}"
+SRCREV = "6cef41d859fbc9ce7868a97cb2cb5dd2b10b9103"
+PV = "2.0.0-devel+git${SRCPV}"
 
 SRC_URI = "git://git.code.sf.net/p/jamvm/code;protocol=git \
            file://jamvm-jni_h-noinst.patch \
-- 
1.9.1


