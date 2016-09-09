Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B61AF6FFFE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Sep 2016 01:21:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u891LQ5N018588
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 8 Sep 2016 18:21:27 -0700 (PDT)
Received: from localhost (128.224.162.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Thu, 8 Sep 2016 18:21:26 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 9 Sep 2016 09:21:23 +0800
Message-ID: <1473384083-23345-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.178]
Subject: [meta-networking][PATCH] dhcpcd: update to 6.11.3
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
X-List-Received-Date: Fri, 09 Sep 2016 01:21:30 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../dhcpcd/{dhcpcd_6.10.1.bb => dhcpcd_6.11.3.bb}                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/dhcpcd/{dhcpcd_6.10.1.bb => dhcpcd_6.11.3.bb} (84%)

diff --git a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.10.1.bb b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.11.3.bb
similarity index 84%
rename from meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.10.1.bb
rename to meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.11.3.bb
index cd80428..197dfb1 100644
--- a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.10.1.bb
+++ b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_6.11.3.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://dhcpcd.c;endline=26;md5=77c40d671aff804ca91ea99556da8
 
 SRC_URI = "http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "a7b83c57f47b62f48373905d3b4f7978"
-SRC_URI[sha256sum] = "284abf8c3be0580bbac5eaca95359346ab0d78d4072317b6ce87cc68f2e8ae7b"
+SRC_URI[md5sum] = "d4f2f3ed4964197dee7767219c33a9df"
+SRC_URI[sha256sum] = "5abd12c4df2947d608f60a35227f9bf8ae8ab9de06ce975cdab1144d8f229b06"
 
 inherit autotools-brokensep
 
-- 
2.7.4


