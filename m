Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2005F771B8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Oct 2018 02:13:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w982D8Sf010336
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 7 Oct 2018 19:13:18 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Sun, 7 Oct 2018 19:12:57 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Sun, 7 Oct 2018 19:12:56 -0700
Message-ID: <20181008021256.23106-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] umip: fix recipe location typo
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
X-List-Received-Date: Mon, 08 Oct 2018 02:13:44 -0000
Content-Type: text/plain

Since `36983fe umip: move to meta-networking' applied,
it was moved to invalid location.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-networking/recipes-connectivity/{ => umip}/umip_1.0.bb | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-networking/recipes-connectivity/{ => umip}/umip_1.0.bb (100%)

diff --git a/meta-networking/recipes-connectivity/umip_1.0.bb b/meta-networking/recipes-connectivity/umip/umip_1.0.bb
similarity index 100%
rename from meta-networking/recipes-connectivity/umip_1.0.bb
rename to meta-networking/recipes-connectivity/umip/umip_1.0.bb
-- 
2.10.2


