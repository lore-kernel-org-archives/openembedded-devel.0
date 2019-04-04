Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id CDCF27CFF8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Apr 2019 09:10:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,306,1549900800"; d="scan'208";a="58466431"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Apr 2019 17:10:40 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 7F97C4CD80CC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Apr 2019 17:10:40 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 4 Apr 2019 17:10:45 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 4 Apr 2019 17:11:18 +0800
Message-ID: <20190404091118.19419-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 7F97C4CD80CC.A9A00
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] mcelog: upgrade 161 -> 162
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
X-List-Received-Date: Thu, 04 Apr 2019 09:10:41 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from mcelog_161.bb to mcelog_162.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/mcelog/{mcelog_161.bb => mcelog_162.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-support/mcelog/{mcelog_161.bb => mcelog_162.bb} (100%)

diff --git a/meta-oe/recipes-support/mcelog/mcelog_161.bb b/meta-oe/recipes-support/mcelog/mcelog_162.bb
similarity index 100%
rename from meta-oe/recipes-support/mcelog/mcelog_161.bb
rename to meta-oe/recipes-support/mcelog/mcelog_162.bb
-- 
2.20.1




