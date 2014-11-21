Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id E30AE6FC68
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Nov 2014 07:56:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43776409"
Received: from localhost (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Nov 2014 15:52:54 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAL7tqH6021771
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Nov 2014 15:55:52 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 21 Nov 2014 15:56:07 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Nov 2014 15:55:56 +0800
Message-ID: <1416556558-15428-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20141119154912.GP3315@jama>
References: <20141119154912.GP3315@jama>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [PATCH v2 0/2] Add new recipe UMIP & Indent
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
X-List-Received-Date: Fri, 21 Nov 2014 07:56:11 -0000
Content-Type: text/plain

UMIP needs Indent to generate files while doing the compile.

Qian Lei (2):
  UMIP: add new recipe
  Indent: Add new recipe

 meta-oe/recipes-connectivity/umip/umip_1.0.bb    | 18 ++++++++++++++++++
 meta-oe/recipes-extended/indent/indent_2.2.10.bb | 22 ++++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/umip/umip_1.0.bb
 create mode 100644 meta-oe/recipes-extended/indent/indent_2.2.10.bb

-- 
1.8.3.1


