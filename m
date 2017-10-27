Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym01.jp.fujitsu.com (mgwym01.jp.fujitsu.com [211.128.242.40])
	by mail.openembedded.org (Postfix) with ESMTP id B67AB78213
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 08:12:33 +0000 (UTC)
Received: from yt-mxoi2.gw.nic.fujitsu.com (unknown [192.168.229.69]) by
	mgwym01.jp.fujitsu.com with smtp
	id 1708_46cd_15341342_dded_4757_a5ba_1b8d8a61d9c2;
	Fri, 27 Oct 2017 17:12:28 +0900
Received: from g01jpfmpwyt01.exch.g01.fujitsu.local
	(g01jpfmpwyt01.exch.g01.fujitsu.local [10.128.193.38])
	by yt-mxoi2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6BA4BAC0120
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 17:12:27 +0900 (JST)
Received: from g01jpexchyt38.g01.fujitsu.local (unknown [10.128.193.4])
	by g01jpfmpwyt01.exch.g01.fujitsu.local (Postfix) with ESMTP id
	66CFB6D6486 for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 17:12:26 +0900 (JST)
Received: from localhost.localdomain (10.54.205.122) by
	g01jpexchyt38.g01.fujitsu.local (10.128.193.68) with Microsoft SMTP
	Server id 14.3.352.0; Fri, 27 Oct 2017 17:12:26 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 27 Oct 2017 17:12:11 +0900
Message-ID: <1509091931-30490-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] openjdk: correct the typo mistake
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
X-List-Received-Date: Fri, 27 Oct 2017 08:12:35 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 recipes-core/openjdk/openjdk-8-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index def779d..4c45e36 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -1,5 +1,5 @@
 DESCRIPTION = "Java runtime based upon the OpenJDK Project"
-HOMEPAGE = "http://http://openjdk.java.net/"
+HOMEPAGE = "http://openjdk.java.net/"
 LICENSE  = "GPL-2.0-with-classpath-exception"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7b4baeedfe2d40cb03536573bc2c89b1"
-- 
2.7.4



