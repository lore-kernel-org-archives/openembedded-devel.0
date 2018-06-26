Return-Path: <Haitao.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 331A9745F8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jun 2018 08:43:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w5Q8hERk028940
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jun 2018 01:43:14 -0700 (PDT)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Tue, 26 Jun 2018 01:43:13 -0700
From: Liu Haitao <haitao.liu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Jun 2018 16:28:36 +0800
Message-ID: <1530001716-62911-1-git-send-email-haitao.liu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Subject: [meta-perl][PATCH] logcheck: Update the repo link
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
X-List-Received-Date: Tue, 26 Jun 2018 08:43:14 -0000
Content-Type: text/plain

The https://anonscm.debian.org and https://alioth.debian.org service have been
discontinued. They are replaced by salsa.debian.org.

Signed-off-by: Liu Haitao <haitao.liu@windriver.com>
---
 meta-perl/recipes-extended/logcheck/logcheck_1.3.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-extended/logcheck/logcheck_1.3.18.bb b/meta-perl/recipes-extended/logcheck/logcheck_1.3.18.bb
index b8766a7c7..6182c17f9 100644
--- a/meta-perl/recipes-extended/logcheck/logcheck_1.3.18.bb
+++ b/meta-perl/recipes-extended/logcheck/logcheck_1.3.18.bb
@@ -11,7 +11,7 @@ HOMEPAGE = "http://logcheck.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c93c0550bd3173f4504b2cbd8991e50b"
 
-SRC_URI = "git://git.debian.org/git/logcheck/logcheck.git \
+SRC_URI = "git://salsa.debian.org/debian/logcheck.git;protocol=https \
            file://99_logcheck \
 "
 SRCREV = "0a5865d80fa34c55387a1917a3e6f885bcff7f1d"
-- 
2.17.1


