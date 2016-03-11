Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6EC366FFD3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2016 06:29:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2B6TlY2027202
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 10 Mar 2016 22:29:47 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 10 Mar 2016 22:29:46 -0800
From: <kai.kang@windriver.com>
To: <martin.jansa@gmail.com>
Date: Fri, 11 Mar 2016 14:25:22 +0800
Message-ID: <1457677523-21895-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] V2: Add native package for crash
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
X-List-Received-Date: Fri, 11 Mar 2016 06:29:48 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

V2:
* clean runtime dependency for crash-native

The following changes since commit a1e135a499998add7575682bf53db5e02e753580:

  Revert "toybox: upgrade to 0.7.0" (2016-03-07 13:02:19 +0100)

are available in the git repository at:

  git@github.com:parr0tr1ver/meta-openembedded.git crash-native

for you to fetch changes up to 6b0f5b639b1796a10fdb5b0a50b49aeddf47a489:

  crash: add native package (2016-03-11 14:17:20 +0800)

----------------------------------------------------------------
Kai Kang (1):
      crash: add native package

 meta-oe/recipes-kernel/crash/crash_7.1.3.bb | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

-- 
2.6.1

