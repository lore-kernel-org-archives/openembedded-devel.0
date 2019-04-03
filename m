Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8EE027C603
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 03:16:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x333GqrZ020870
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 2 Apr 2019 20:16:53 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Tue, 2 Apr 2019 20:16:52 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 3 Apr 2019 11:07:47 +0800
Message-ID: <1554260867-28882-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] openldap: add missing CVE tag to patch
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
X-List-Received-Date: Wed, 03 Apr 2019 03:16:52 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-support/openldap/openldap/openldap-CVE-2015-3276.patch | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/openldap/openldap/openldap-CVE-2015-3276.patch b/meta-oe/recipes-support/openldap/openldap/openldap-CVE-2015-3276.patch
index 25e148e..ce8b47a 100644
--- a/meta-oe/recipes-support/openldap/openldap/openldap-CVE-2015-3276.patch
+++ b/meta-oe/recipes-support/openldap/openldap/openldap-CVE-2015-3276.patch
@@ -12,6 +12,8 @@ unknown vectors.
 
 Upstream-Status: Pending
 
+CVE: CVE-2015-3276
+
 Signed-off-by: Li Wang <li.wang@windriver.com>
 ---
  libraries/libldap/tls_m.c |   27 ++++++++++++++++-----------
-- 
2.7.4


