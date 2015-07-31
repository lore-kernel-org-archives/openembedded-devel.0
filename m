Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6722B76565
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 03:46:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99105233"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jul 2015 11:50:01 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6V3iaDt018132
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 11:44:36 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 31 Jul 2015 11:46:28 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 31 Jul 2015 11:46:14 +0800
Message-ID: <1438314380-3834-2-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1438314380-3834-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1438314380-3834-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-oe][PATCH 2/8] xgamma: upgrade 1.0.5 -> 1.0.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Jul 2015 03:46:29 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../recipes-graphics/xorg-app/{xgamma_1.0.5.bb => xgamma_1.0.6.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xgamma_1.0.5.bb => xgamma_1.0.6.bb} (71%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xgamma_1.0.5.bb b/meta-oe/recipes-graphics/xorg-app/xgamma_1.0.6.bb
similarity index 71%
rename from meta-oe/recipes-graphics/xorg-app/xgamma_1.0.5.bb
rename to meta-oe/recipes-graphics/xorg-app/xgamma_1.0.6.bb
index 6fb9259..4949616 100644
--- a/meta-oe/recipes-graphics/xorg-app/xgamma_1.0.5.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xgamma_1.0.6.bb
@@ -11,5 +11,5 @@ DEPENDS += "libxxf86vm"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "c06067f572bc4a5298f324f27340da95"
-SRC_URI[sha256sum] = "e322a2fea80d559c09d6bc285ebe1a9e454dbeae2a07116cb7d2207db9d2c310"
+SRC_URI[md5sum] = "90b4305157c2b966d5180e2ee61262be"
+SRC_URI[sha256sum] = "0ef1c35b5c18b1b22317f455c8df13c0a471a8efad63c89c98ae3ce8c2b222d3"
-- 
1.8.4.2


