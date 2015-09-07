Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8BCED736B6
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Sep 2015 07:00:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8770DoD029182
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 7 Sep 2015 00:00:13 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Mon, 7 Sep 2015 00:00:13 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 7 Sep 2015 14:55:00 +0800
Message-ID: <1441608901-27606-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/2] libnetfilter-conntrack: upgrade to 1.0.4
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
X-List-Received-Date: Mon, 07 Sep 2015 07:00:16 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...ibnetfilter-conntrack_1.0.2.bb => libnetfilter-conntrack_1.0.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-filter/libnetfilter/{libnetfilter-conntrack_1.0.2.bb => libnetfilter-conntrack_1.0.4.bb} (80%)

diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.2.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.4.bb
similarity index 80%
rename from meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.2.bb
rename to meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.4.bb
index df4030c..c1df1cb 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.2.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.4.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 DEPENDS = "libnfnetlink libmnl"
 
 SRC_URI = "http://www.netfilter.org/projects/libnetfilter_conntrack/files/libnetfilter_conntrack-${PV}.tar.bz2;name=tar"
-SRC_URI[tar.md5sum] = "447114b5d61bb9a9617ead3217c3d3ff"
-SRC_URI[tar.sha256sum] = "a0bd747dd58ae1513586b43c7125b41e6325f97eb95ac63d53cf5aeb33254d12"
+SRC_URI[tar.md5sum] = "18cf80c4b339a3285e78822dbd4f08d7"
+SRC_URI[tar.sha256sum] = "d9ec4a3caf49417f2b0a2d8d44249133e8c3ec78c757b7eb8c273f1cb6929c7d"
 
 S = "${WORKDIR}/libnetfilter_conntrack-${PV}"
 
-- 
1.9.1


