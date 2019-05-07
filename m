Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9757660107
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 May 2019 03:06:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4736SGv005709
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 May 2019 20:06:28 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Mon, 6 May 2019 20:06:28 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 7 May 2019 10:54:36 +0800
Message-ID: <1557197676-4300-2-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557197676-4300-1-git-send-email-Qi.Chen@windriver.com>
References: <1557197676-4300-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH V2 2/2] ipsec-tools: fix CVE tag in patch
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
X-List-Received-Date: Tue, 07 May 2019 03:06:27 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-support/ipsec-tools/ipsec-tools/fix-CVE-2016-10396.patch    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/fix-CVE-2016-10396.patch b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/fix-CVE-2016-10396.patch
index 19220c4..fec4804 100644
--- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/fix-CVE-2016-10396.patch
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/fix-CVE-2016-10396.patch
@@ -1,6 +1,6 @@
 Upstream-Status: Backport [https://anonscm.debian.org/cgit/pkg-ipsec-tools/pkg-ipsec-tools.git/plain/debian/patches/CVE-2016-10396.patch?id=62ac12648a4eb7c5ba5dba0f81998d1acf310d8b]
 
-CVE: CVE-2016-10396.
+CVE: CVE-2016-10396
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
-- 
2.7.4


