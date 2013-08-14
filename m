Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B2C416B6E0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Aug 2013 06:31:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7E6VNfT000161
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2013 23:31:23 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 13 Aug 2013 23:31:22 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 14 Aug 2013 14:31:00 +0800
Message-ID: <2fae30d70aa07fb60addec522b8652adb9ad5526.1376461413.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1376461413.git.hongxu.jia@windriver.com>
References: <cover.1376461413.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [RFC PATCH 08/13] cramfs: move to meta-filesystems
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
X-List-Received-Date: Wed, 14 Aug 2013 06:31:22 -0000
Content-Type: text/plain

Move cramfs from meta-oe to meta-filesystems

[YOCTO #4178]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-filesystems}/cramfs/cramfs_1.1.bb                             | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta-oe/recipes-support => meta-filesystems/recipes-filesystems}/cramfs/cramfs_1.1.bb (100%)

diff --git a/meta-oe/recipes-support/cramfs/cramfs_1.1.bb b/meta-filesystems/recipes-filesystems/cramfs/cramfs_1.1.bb
similarity index 100%
rename from meta-oe/recipes-support/cramfs/cramfs_1.1.bb
rename to meta-filesystems/recipes-filesystems/cramfs/cramfs_1.1.bb
-- 
1.8.1.2


