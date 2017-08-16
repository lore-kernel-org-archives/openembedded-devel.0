Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E14387866B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 09:51:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7G9psxW025624
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 02:51:54 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 16 Aug 2017 02:51:53 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 16 Aug 2017 17:41:06 +0800
Message-ID: <20170816094106.15026-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Subject: [PATCH] wireshark: 2.2.7 -> 2.2.8
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
X-List-Received-Date: Wed, 16 Aug 2017 09:51:54 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../wireshark/{wireshark_2.2.7.bb => wireshark_2.2.8.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.2.7.bb => wireshark_2.2.8.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.7.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.8.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_2.2.7.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.2.8.bb
index 2f6f7b0..f94324e 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.2.7.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.8.bb
@@ -10,8 +10,8 @@ SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
 
 PE = "1"
 
-SRC_URI[md5sum] = "a4d880554c7f925dafef60fa313b580d"
-SRC_URI[sha256sum] = "689ddf62221b152779d8846ab5b2063cc7fd41ec1a9f04eefab09b5d5486dbb5"
+SRC_URI[md5sum] = "bb81d0ecf3a8ed46bedfaeae6fd318a8"
+SRC_URI[sha256sum] = "ecf02c148c9ab6e809026ad5743fe9be1739a9840ef6fece6837a7ddfbdf7edc"
 
 inherit autotools pkgconfig perlnative
 
-- 
2.10.1


