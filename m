Return-Path: <fan.xin@jp.fujitsu.com>
X-Greylist: delayed 674 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 04 Sep 2017 05:12:42 UTC
Received: from mgwkm03.jp.fujitsu.com (mgwkm03.jp.fujitsu.com [202.219.69.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1C78A78152
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Sep 2017 05:12:42 +0000 (UTC)
Received: from kw-mxauth.gw.nic.fujitsu.com (unknown [192.168.231.132]) by
	mgwkm03.jp.fujitsu.com with smtp
	id 434f_ffa2_20cbc005_44e2_4b29_903c_379c0963db9f;
	Mon, 04 Sep 2017 14:01:21 +0900
Received: from g01jpfmpwyt02.exch.g01.fujitsu.local
	(g01jpfmpwyt02.exch.g01.fujitsu.local [10.128.193.56])
	by kw-mxauth.gw.nic.fujitsu.com (Postfix) with ESMTP id 2DC2FAC00E9
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Sep 2017 14:01:17 +0900 (JST)
Received: from G01JPEXCHYT17.g01.fujitsu.local
	(G01JPEXCHYT17.g01.fujitsu.local [10.128.194.56])
	by g01jpfmpwyt02.exch.g01.fujitsu.local (Postfix) with ESMTP id
	152D9584293 for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Sep 2017 14:01:16 +0900 (JST)
Received: from localhost.localdomain (10.54.205.122) by
	G01JPEXCHYT17.g01.fujitsu.local (10.128.194.56) with Microsoft SMTP
	Server id 14.3.352.0; Mon, 4 Sep 2017 14:01:14 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 4 Sep 2017 14:01:14 +0900
Message-ID: <1504501274-24627-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] cyrus-sasl: Add HOMEPAGE info into recipe file.
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
X-List-Received-Date: Mon, 04 Sep 2017 05:12:43 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
index 61b7ad4..eaa453d 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Generic client/server library for SASL authentication"
 SECTION = "libs"
+HOMEPAGE = "http://asg.web.cmu.edu/sasl/"
 DEPENDS = "openssl virtual/db"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3f55e0974e3d6db00ca6f57f2d206396"
-- 
2.7.4



