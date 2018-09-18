Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E9BD77965C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2018 09:35:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="45056802"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Sep 2018 17:35:27 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id B31D34B6ADEE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2018 17:35:21 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Tue, 18 Sep 2018 17:35:20 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 18 Sep 2018 17:35:20 +0800
Message-ID: <20180918093521.1113-2-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180918093521.1113-1-hongl.fnst@cn.fujitsu.com>
References: <20180918093521.1113-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: B31D34B6ADEE.AF283
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [meta-python][PATCH2/2] python-cryptography-vectors: 2.3->2.3.1
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
X-List-Received-Date: Tue, 18 Sep 2018 09:35:30 -0000
Content-Type: text/plain

1.Upgrade python-cryptography-vectors from 2.3 to 2.3.1

2.Upgrade python3-cryptography-vectors from 2.3 to 2.3.1

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 ...n-cryptography-vectors_2.3.bb => python-cryptography-vectors_2.3.1.bb} | 0
 ...-cryptography-vectors_2.3.bb => python3-cryptography-vectors_2.3.1.bb} | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cryptography-vectors_2.3.bb => python-cryptography-vectors_2.3.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_2.3.bb => python3-cryptography-vectors_2.3.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors_2.3.bb b/meta-python/recipes-devtools/python/python-cryptography-vectors_2.3.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cryptography-vectors_2.3.bb
rename to meta-python/recipes-devtools/python/python-cryptography-vectors_2.3.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.3.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.3.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_2.3.bb
rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_2.3.1.bb
-- 
2.7.4




