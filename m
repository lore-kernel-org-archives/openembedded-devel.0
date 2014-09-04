Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7412771412
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Sep 2014 07:44:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s847icNn011603
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Sep 2014 00:44:39 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 4 Sep 2014 00:44:38 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 4 Sep 2014 15:44:37 +0800
Message-ID: <1409816677-19417-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-networking][master-next] tcpslice: fix the license
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
X-List-Received-Date: Thu, 04 Sep 2014 07:44:44 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

After check the copyright in source file, the license is BSD-4-Clause

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb b/meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb
index e5e38b4..203d143 100644
--- a/meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "A tool for extracting parts of a tcpdump packet trace."
 HOMEPAGE = "http://www.tcpdump.org/related.html"
 SECTION = "console/network"
 
-LICENSE = "BSD"
+LICENSE = "BSD-4-Clause"
 LIC_FILES_CHKSUM = "file://tcpslice.c;endline=20;md5=99519e2e5234d1662a4ce16baa62c64e"
 
 SRC_URI = "ftp://ftp.ee.lbl.gov/${BP}.tar.gz \
-- 
1.7.10.4


