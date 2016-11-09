Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3ABA3605B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Nov 2016 08:06:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uA986754015916
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 9 Nov 2016 00:06:07 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 9 Nov 2016 00:06:06 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 9 Nov 2016 15:58:53 +0800
Message-ID: <20161109075853.12636-4-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <20161109075853.12636-1-kai.kang@windriver.com>
References: <20161109075853.12636-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] phoronix-test-suite: 6.0.1 -> 6.6.1
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
X-List-Received-Date: Wed, 09 Nov 2016 08:06:06 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{phoronix-test-suite_6.0.1.bb => phoronix-test-suite_6.6.1.bb}   | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-benchmark/phoronix-test-suite/{phoronix-test-suite_6.0.1.bb => phoronix-test-suite_6.6.1.bb} (89%)

diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_6.0.1.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_6.6.1.bb
similarity index 89%
rename from meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_6.0.1.bb
rename to meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_6.6.1.bb
index aab64a3..1f14048 100644
--- a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_6.0.1.bb
+++ b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_6.6.1.bb
@@ -6,8 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "console/tests"
 
 SRC_URI = "http://www.phoronix-test-suite.com/releases/${BP}.tar.gz"
-SRC_URI[md5sum] = "c3b26fcc57a3a253e558f759fdc1089f"
-SRC_URI[sha256sum] = "27add54f4ecb464549de580cece84b4a4945b99df3ef7ff7034eb7f23ffb3b39"
+SRC_URI[md5sum] = "5bcac5896a4a34fc6ae4ae94991e1637"
+SRC_URI[sha256sum] = "631ceb808d8bd6cebe69c8b711d55090d6880e906a65837f18fa8200fe7d2c4d"
+
 S = "${WORKDIR}/phoronix-test-suite"
 
 inherit systemd allarch
-- 
2.10.1


