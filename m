Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym04.jp.fujitsu.com (mgwym04.jp.fujitsu.com [211.128.242.43])
	by mail.openembedded.org (Postfix) with ESMTP id C4151780BE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Sep 2017 05:05:37 +0000 (UTC)
Received: from yt-mxq.gw.nic.fujitsu.com (unknown [192.168.229.66]) by
	mgwym04.jp.fujitsu.com with smtp
	id 2fd7_6116_b78b49da_7d77_4351_b4e8_6717d9cd407a;
	Mon, 04 Sep 2017 14:05:34 +0900
Received: from g01jpfmpwyt03.exch.g01.fujitsu.local
	(g01jpfmpwyt03.exch.g01.fujitsu.local [10.128.193.57])
	by yt-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id 39447AC00B8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Sep 2017 14:05:34 +0900 (JST)
Received: from g01jpexchyt33.g01.fujitsu.local (unknown [10.128.193.4])
	by g01jpfmpwyt03.exch.g01.fujitsu.local (Postfix) with ESMTP id
	377A846E474 for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Sep 2017 14:05:33 +0900 (JST)
Received: from localhost.localdomain (10.54.205.122) by
	g01jpexchyt33.g01.fujitsu.local (10.128.193.36) with Microsoft SMTP
	Server id 14.3.352.0; Mon, 4 Sep 2017 14:05:33 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 4 Sep 2017 14:05:31 +0900
Message-ID: <1504501531-24698-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] pps-tools: Add HOMEPAGE info into recipe file.
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
X-List-Received-Date: Mon, 04 Sep 2017 05:05:38 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta-oe/recipes-support/pps-tools/pps-tools_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/pps-tools/pps-tools_git.bb b/meta-oe/recipes-support/pps-tools/pps-tools_git.bb
index 73c46ee..8bf9036 100644
--- a/meta-oe/recipes-support/pps-tools/pps-tools_git.bb
+++ b/meta-oe/recipes-support/pps-tools/pps-tools_git.bb
@@ -1,4 +1,5 @@
 SUMMARY = "User-space tools for LinuxPPS"
+HOMEPAGE = "http://linuxpps.org"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-- 
2.7.4



