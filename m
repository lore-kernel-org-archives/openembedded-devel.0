Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EF8C17477C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jun 2018 06:00:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5Q5xiNM013718
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jun 2018 23:00:00 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 25 Jun 2018 22:59:34 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Jun 2018 14:00:55 +0800
Message-ID: <1529992863-24711-12-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
References: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 12/20] python(3)-ndg-httpsclient: upgrade 0.4.4 -> 0.5.0
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
X-List-Received-Date: Tue, 26 Jun 2018 06:00:09 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-python/recipes-devtools/python/python-ndg-httpsclient.inc        | 4 ++--
 ...ython-ndg-httpsclient_0.4.4.bb => python-ndg-httpsclient_0.5.0.bb} | 0
 ...hon3-ndg-httpsclient_0.4.4.bb => python3-ndg-httpsclient_0.5.0.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-ndg-httpsclient_0.4.4.bb => python-ndg-httpsclient_0.5.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-ndg-httpsclient_0.4.4.bb => python3-ndg-httpsclient_0.5.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc b/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc
index d74302398..4e07e4e95 100644
--- a/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc
+++ b/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://python-requests.org"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://MANIFEST.in;md5=ce22c0cd986d2de3f7073cd6b5523ae0"
 
-SRC_URI[md5sum] = "a0d349cf9530e331697a6e5ab1f40de6"
-SRC_URI[sha256sum] = "fba4d4798dcac2965874f24afb6631b4326baa4bd02505744d34f690c354856a"
+SRC_URI[md5sum] = "1c28be0449268359e795b3b5687feeb7"
+SRC_URI[sha256sum] = "c009f5430790936b3a97eaf9f968516664d97e146ab2bda991f0caadb7cc088b"
 
 PYPI_PACKAGE = "ndg_httpsclient"
 
diff --git a/meta-python/recipes-devtools/python/python-ndg-httpsclient_0.4.4.bb b/meta-python/recipes-devtools/python/python-ndg-httpsclient_0.5.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-ndg-httpsclient_0.4.4.bb
rename to meta-python/recipes-devtools/python/python-ndg-httpsclient_0.5.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.4.4.bb b/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.5.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.4.4.bb
rename to meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.5.0.bb
-- 
2.11.0


