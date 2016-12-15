Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9EEEE77264
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 06:32:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="13941435"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Dec 2016 14:32:37 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id CAED8467048A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 14:32:33 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.226.109) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Thu, 15 Dec 2016 14:32:34 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 15 Dec 2016 14:31:26 +0800
Message-ID: <1481783488-31329-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.109]
X-yoursite-MailScanner-ID: CAED8467048A.A86B5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking] [PATCH 0/2] libldb 1.1.27 -> 1.1.29
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
X-List-Received-Date: Thu, 15 Dec 2016 06:32:55 -0000
Content-Type: text/plain

1)	Upgrade libldb from 1.1.27 to 1.1.29
2)	Upgrade libldb's depends libtdb from 1.3.10 to 1.3.12


Zheng Ruoqin (2):
  [oe] [meta-oe][PATCH] libtdb 1.3.10 -> 1.3.12
  [oe] [meta-networking][PATCH] libldb 1.1.27 -> 1.1.29

 .../recipes-support/libldb/{libldb_1.1.27.bb => libldb_1.1.29.bb}     | 4 ++--
 .../recipes-support/libtdb/{libtdb_1.3.10.bb => libtdb_1.3.12.bb}     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-support/libldb/{libldb_1.1.27.bb => libldb_1.1.29.bb} (94%)
 rename meta-networking/recipes-support/libtdb/{libtdb_1.3.10.bb => libtdb_1.3.12.bb} (91%)

-- 
2.7.4




