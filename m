Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym04.jp.fujitsu.com (mgwym04.jp.fujitsu.com [211.128.242.43])
	by mail.openembedded.org (Postfix) with ESMTP id 25C897850A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Nov 2017 02:15:39 +0000 (UTC)
Received: from yt-mxoi2.gw.nic.fujitsu.com (unknown [192.168.229.69]) by
	mgwym04.jp.fujitsu.com with smtp
	id 17c2_3445_d850bf07_c514_4eae_be48_76464094b965;
	Thu, 09 Nov 2017 11:15:33 +0900
Received: from g01jpfmpwyt03.exch.g01.fujitsu.local
	(g01jpfmpwyt03.exch.g01.fujitsu.local [10.128.193.57])
	by yt-mxoi2.gw.nic.fujitsu.com (Postfix) with ESMTP id AC880AC0171
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Nov 2017 11:15:31 +0900 (JST)
Received: from G01JPEXCHYT14.g01.fujitsu.local
	(G01JPEXCHYT14.g01.fujitsu.local [10.128.194.53])
	by g01jpfmpwyt03.exch.g01.fujitsu.local (Postfix) with ESMTP id
	A35C246E806 for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Nov 2017 11:15:30 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	G01JPEXCHYT14.g01.fujitsu.local (10.128.194.53) with Microsoft SMTP
	Server id 14.3.352.0; Thu, 9 Nov 2017 11:15:30 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 9 Nov 2017 11:15:27 +0900
Message-ID: <1510193727-5550-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] spi-tools: Add version info
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
X-List-Received-Date: Thu, 09 Nov 2017 02:15:40 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta-oe/recipes-support/spitools/{spitools_git.bb => spitools_0.8.1.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-support/spitools/{spitools_git.bb => spitools_0.8.1.bb} (100%)

diff --git a/meta-oe/recipes-support/spitools/spitools_git.bb b/meta-oe/recipes-support/spitools/spitools_0.8.1.bb
similarity index 100%
rename from meta-oe/recipes-support/spitools/spitools_git.bb
rename to meta-oe/recipes-support/spitools/spitools_0.8.1.bb
-- 
2.7.4



