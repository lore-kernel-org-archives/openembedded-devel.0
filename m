Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7EE5C6B6B7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 03:19:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="57700340"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Feb 2015 11:16:03 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t1G3IoQC029284
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 11:18:50 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 16 Feb 2015 11:19:38 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 16 Feb 2015 11:14:33 +0800
Message-ID: <1424056475-44818-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-networking][PATCH 0/2] some modifies
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Feb 2015 03:19:40 -0000
Content-Type: text/plain

Bian Naimeng (2):
  ipsec-tools: install a sample config file for racoon
  ipsec-tools: add systemd supported

 .../ipsec-tools/ipsec-tools/racoon.conf            |  8 +++++
 .../ipsec-tools/ipsec-tools/racoon.conf.sample     | 40 ++++++++++++++++++++++
 .../ipsec-tools/ipsec-tools/racoon.service         | 11 ++++++
 .../ipsec-tools/ipsec-tools_0.8.2.bb               | 22 +++++++++++-
 4 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/ipsec-tools/ipsec-tools/racoon.conf
 create mode 100644 meta-networking/recipes-support/ipsec-tools/ipsec-tools/racoon.conf.sample
 create mode 100644 meta-networking/recipes-support/ipsec-tools/ipsec-tools/racoon.service

-- 
1.9.1


