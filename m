Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 011157C989
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2019 08:56:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1K8uZJD026958
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2019 00:56:46 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.435.0; Wed, 20 Feb 2019 00:56:25 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Feb 2019 16:56:17 +0800
Message-ID: <1550652980-292761-3-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1550652980-292761-1-git-send-email-changqing.li@windriver.com>
References: <1550652980-292761-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] syslog-ng: upgrade 3.26.1 -> 3.19.1
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
X-List-Received-Date: Wed, 20 Feb 2019 08:56:55 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../syslog-ng/{syslog-ng_3.16.1.bb => syslog-ng_3.19.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/syslog-ng/{syslog-ng_3.16.1.bb => syslog-ng_3.19.1.bb} (81%)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.16.1.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.19.1.bb
similarity index 81%
rename from meta-oe/recipes-support/syslog-ng/syslog-ng_3.16.1.bb
rename to meta-oe/recipes-support/syslog-ng/syslog-ng_3.19.1.bb
index b5f42cf..4eecf6b 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.16.1.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.19.1.bb
@@ -12,5 +12,5 @@ SRC_URI = "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.ta
            file://0001-syslog-ng-fix-segment-fault-during-service-start.patch \
            "
 
-SRC_URI[md5sum] = "72d44ad02c2e9ba0748b3ecd3f15a7ff"
-SRC_URI[sha256sum] = "c7ee6f1d5e98d86f191964e580111bfa71081ecbb3275cea035bbba177b73a29"
+SRC_URI[md5sum] = "aa79bc13d9fd925aa5fb9516e87aacd3"
+SRC_URI[sha256sum] = "5cf931a9d7bead0e6d9a2c65eee8f6005a005878f59aa280f3c4294257ed5178"
-- 
2.7.4


