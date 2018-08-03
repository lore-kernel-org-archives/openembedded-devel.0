Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5277778D62
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Aug 2018 09:23:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w739NgeH025486
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 3 Aug 2018 02:23:43 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Fri, 3 Aug 2018 02:23:41 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 3 Aug 2018 17:34:02 +0800
Message-ID: <1533288843-73014-2-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533288843-73014-1-git-send-email-liezhi.yang@windriver.com>
References: <1533288843-73014-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 1/2] python3-pbr: remove it
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
X-List-Received-Date: Fri, 03 Aug 2018 09:23:42 -0000
Content-Type: text/plain

There is one in oe-core, so remove it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-python/recipes-devtools/python/python3-pbr_4.2.0.bb | 2 --
 1 file changed, 2 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pbr_4.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pbr_4.2.0.bb b/meta-python/recipes-devtools/python/python3-pbr_4.2.0.bb
deleted file mode 100644
index 97e7361..0000000
--- a/meta-python/recipes-devtools/python/python3-pbr_4.2.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-pbr.inc
-- 
2.7.4


