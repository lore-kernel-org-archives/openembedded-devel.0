Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B3B1E786CB
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jul 2018 08:24:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="41733512"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Jul 2018 16:24:12 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id AA8AE4B43D4C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jul 2018 16:24:05 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Mon, 2 Jul 2018 16:24:11 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 3 Jul 2018 01:23:49 +0800
Message-ID: <1530552229-58559-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: AA8AE4B43D4C.A925B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] cmpi-bindings: rename
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
X-List-Received-Date: Mon, 02 Jul 2018 08:24:13 -0000
Content-Type: text/plain

Rename cmpi-bindings from cmpi-bindings_git.bb to cmpi-bindings_1.0.1.bb.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../cmpi-bindings/{cmpi-bindings_git.bb => cmpi-bindings_1.0.1.bb}        | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-extended/cmpi-bindings/{cmpi-bindings_git.bb => cmpi-bindings_1.0.1.bb} (100%)

diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_git.bb b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.1.bb
similarity index 100%
rename from meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_git.bb
rename to meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.1.bb
-- 
2.7.4




