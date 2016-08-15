Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A6ED77710D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 05:59:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7F5xxsa005205
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Aug 2016 23:00:00 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 14 Aug 2016 22:59:58 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Aug 2016 13:45:10 +0800
Message-ID: <3e3e6c7aff5553682976122f9248643c95c8eccd.1471240191.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1471240191.git.jackie.huang@windriver.com>
References: <cover.1471240191.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/6] libtevent: upgrade to 0.9.29
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
X-List-Received-Date: Mon, 15 Aug 2016 05:59:59 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../libtevent/{libtevent_0.9.28.bb => libtevent_0.9.29.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libtevent/{libtevent_0.9.28.bb => libtevent_0.9.29.bb} (88%)

diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.9.28.bb b/meta-networking/recipes-support/libtevent/libtevent_0.9.29.bb
similarity index 88%
rename from meta-networking/recipes-support/libtevent/libtevent_0.9.28.bb
rename to meta-networking/recipes-support/libtevent/libtevent_0.9.29.bb
index 3f5d7f4..6acdeb5 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.9.28.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.9.29.bb
@@ -9,8 +9,8 @@ RDEPENDS_python-tevent = "python"
 SRC_URI = "http://samba.org/ftp/tevent/tevent-${PV}.tar.gz"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b"
 
-SRC_URI[md5sum] = "945845817918f5cfbe0202d80a7db118"
-SRC_URI[sha256sum] = "04d953379025b1560af5c4ffcce58a3ee84db7aaa09c9f1e3eff5b2945a13529"
+SRC_URI[md5sum] = "4372c1430a1ecb7ea0adddfdf21c0d55"
+SRC_URI[sha256sum] = "a4f519b0bbb718fe2175bee9011ee4d199675f28c2ef80531be38e7bbaa1c42b"
 
 inherit waf-samba
 
-- 
1.9.1


