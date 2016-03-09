Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1381B60797
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Mar 2016 07:52:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u297qxso025733
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 8 Mar 2016 23:52:59 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 8 Mar 2016 23:52:58 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 9 Mar 2016 15:48:42 +0800
Message-ID: <1457509723-25302-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Subject: [PATCH] Add native package for crash
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
X-List-Received-Date: Wed, 09 Mar 2016 07:53:00 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>


The following changes since commit a1e135a499998add7575682bf53db5e02e753580:

  Revert "toybox: upgrade to 0.7.0" (2016-03-07 13:02:19 +0100)

are available in the git repository at:

  git@github.com:parr0tr1ver/meta-openembedded.git crash-native

for you to fetch changes up to 5c95179d2897a02f390165c59b2fdb55e9c3e959:

  crash: add native package (2016-03-09 15:21:04 +0800)

----------------------------------------------------------------
Kai Kang (1):
      crash: add native package

 meta-oe/recipes-kernel/crash/crash_7.1.3.bb | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

-- 
2.6.1


