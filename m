Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1CCB86BE0C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2019 01:57:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.58,367,1544457600"; d="scan'208";a="54295847"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Feb 2019 09:57:57 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 1CC374BAD9BD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2019 09:57:56 +0800 (CST)
Received: from localhost.localdomain (10.167.225.47) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Thu, 14 Feb 2019 09:58:06 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Feb 2019 09:58:58 +0800
Message-ID: <20190214015858.30115-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.47]
X-yoursite-MailScanner-ID: 1CC374BAD9BD.AF82A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [meta-python][PATCH] python-pycparser: upgrade to 2.19
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
X-List-Received-Date: Thu, 14 Feb 2019 01:57:57 -0000
Content-Type: text/plain

1.Upgrade python-pycparser from 2.18 to 2.19

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../python/{python-pycparser_2.18.bb => python-pycparser_2.19.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pycparser_2.18.bb => python-pycparser_2.19.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pycparser_2.18.bb b/meta-python/recipes-devtools/python/python-pycparser_2.19.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pycparser_2.18.bb
rename to meta-python/recipes-devtools/python/python-pycparser_2.19.bb
-- 
2.17.2




