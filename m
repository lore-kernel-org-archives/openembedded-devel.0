Return-Path: <maciej.pijanowski@3mdeb.com>
Received: from 1.mo68.mail-out.ovh.net (1.mo68.mail-out.ovh.net
	[46.105.41.146])
	by mail.openembedded.org (Postfix) with ESMTP id 8382E7DDAA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Aug 2019 08:41:36 +0000 (UTC)
Received: from player786.ha.ovh.net (unknown [10.108.57.140])
	by mo68.mail-out.ovh.net (Postfix) with ESMTP id 3843D13EFE8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Aug 2019 10:41:37 +0200 (CEST)
Received: from 3mdeb.com (89-66-81-159.dynamic.chello.pl [89.66.81.159])
	(Authenticated sender: maciej.pijanowski@3mdeb.com)
	by player786.ha.ovh.net (Postfix) with ESMTPSA id A64468DAD90E;
	Sun, 11 Aug 2019 08:41:34 +0000 (UTC)
From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Aug 2019 10:41:13 +0200
Message-Id: <20190811084113.15341-1-maciej.pijanowski@3mdeb.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Ovh-Tracer-Id: 15330534609423052360
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddruddvvddgtdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenuc
Cc: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>, piotr.krol@3mdeb.com
Subject: [meta-python][PATCH v2] python-engineio: upgrade to 3.9.3
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
X-List-Received-Date: Sun, 11 Aug 2019 08:41:37 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
---
 meta-python/recipes-devtools/python/python-engineio.inc       | 4 ++--
 .../{python-engineio_3.5.0.bb => python-engineio_3.9.3.bb}    | 0
 .../{python3-engineio_3.5.0.bb => python3-engineio_3.9.3.bb}  | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-engineio_3.5.0.bb => python-engineio_3.9.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-engineio_3.5.0.bb => python3-engineio_3.9.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-engineio.inc b/meta-python/recipes-devtools/python/python-engineio.inc
index c399d7dda56c..f24da1284b40 100644
--- a/meta-python/recipes-devtools/python/python-engineio.inc
+++ b/meta-python/recipes-devtools/python/python-engineio.inc
@@ -9,5 +9,5 @@ inherit pypi
 
 PYPI_PACKAGE = "python-engineio"
 
-SRC_URI[md5sum] = "011a61f1ee84755043cf862c8cc24f21"
-SRC_URI[sha256sum] = "b2756ce53076163eb24f59c1d1a903ac72f071ad4fb7b3ef6dab1b1b9ae9a44f"
+SRC_URI[md5sum] = "11a4f18f5b08a36d07d3c0ff85e7c047"
+SRC_URI[sha256sum] = "2a4c874aea686e79f8ea9efc30748110df581df6d577d18bb5eaa1a8f2199d12"
diff --git a/meta-python/recipes-devtools/python/python-engineio_3.5.0.bb b/meta-python/recipes-devtools/python/python-engineio_3.9.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-engineio_3.5.0.bb
rename to meta-python/recipes-devtools/python/python-engineio_3.9.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-engineio_3.5.0.bb b/meta-python/recipes-devtools/python/python3-engineio_3.9.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-engineio_3.5.0.bb
rename to meta-python/recipes-devtools/python/python3-engineio_3.9.3.bb
-- 
2.20.1


