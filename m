Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwkm03.jp.fujitsu.com (mgwkm03.jp.fujitsu.com [202.219.69.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4B33C780ED
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Sep 2017 06:00:32 +0000 (UTC)
Received: from kw-mxq.gw.nic.fujitsu.com (unknown [192.168.231.130]) by
	mgwkm03.jp.fujitsu.com with smtp
	id 432f_1c57_2e9dc77b_1e20_4041_bcf5_523a28acf81c;
	Mon, 04 Sep 2017 15:00:27 +0900
Received: from g01jpfmpwyt03.exch.g01.fujitsu.local
	(g01jpfmpwyt03.exch.g01.fujitsu.local [10.128.193.57])
	by kw-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id E4438AC00DB
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Sep 2017 15:00:26 +0900 (JST)
Received: from G01JPEXCHYT14.g01.fujitsu.local
	(G01JPEXCHYT14.g01.fujitsu.local [10.128.194.53])
	by g01jpfmpwyt03.exch.g01.fujitsu.local (Postfix) with ESMTP id
	CC10C46E6E7 for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Sep 2017 15:00:25 +0900 (JST)
Received: from localhost.localdomain (10.54.205.122) by
	G01JPEXCHYT14.g01.fujitsu.local (10.128.194.53) with Microsoft SMTP
	Server id 14.3.352.0; Mon, 4 Sep 2017 15:00:25 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 4 Sep 2017 15:00:23 +0900
Message-ID: <1504504823-24960-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] libjs-jquery: Add HOMEPAGE info into recipe file.
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
X-List-Received-Date: Mon, 04 Sep 2017 06:00:34 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta-oe/recipes-support/libjs/libjs-jquery_1.7.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libjs/libjs-jquery_1.7.2.bb b/meta-oe/recipes-support/libjs/libjs-jquery_1.7.2.bb
index ec8f360..7f425cd 100644
--- a/meta-oe/recipes-support/libjs/libjs-jquery_1.7.2.bb
+++ b/meta-oe/recipes-support/libjs/libjs-jquery_1.7.2.bb
@@ -1,4 +1,5 @@
 SUMMARY = "JavaScript library for dynamic web applications"
+HOMEPAGE = "https://jquery.com/"
 LICENSE = "MIT | BSD | GPL-2"
 LIC_FILES_CHKSUM = "file://usr/share/doc/libjs-jquery/copyright;md5=5d1ec6f95e0a91d38e2f71de93ddb00e"
 
-- 
2.7.4



