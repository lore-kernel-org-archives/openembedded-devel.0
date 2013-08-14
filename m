Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 354936B6D9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Aug 2013 06:31:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7E6VFT2004376
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Aug 2013 02:31:15 -0400 (EDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 13 Aug 2013 23:31:13 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 14 Aug 2013 14:30:56 +0800
Message-ID: <f7ae4832e4c2ec7f1f801ce8c20a7c56826a2e1a.1376461413.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1376461413.git.hongxu.jia@windriver.com>
References: <cover.1376461413.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [RFC PATCH 04/13] ifuse: move to meta-filesystems
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
X-List-Received-Date: Wed, 14 Aug 2013 06:31:15 -0000
Content-Type: text/plain

Move ifuse from meta-oe to meta-filesystems

[YOCTO #4178]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-filesystems}/ifuse/ifuse_1.1.2.bb                             | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta-oe/recipes-connectivity => meta-filesystems/recipes-filesystems}/ifuse/ifuse_1.1.2.bb (100%)

diff --git a/meta-oe/recipes-connectivity/ifuse/ifuse_1.1.2.bb b/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb
similarity index 100%
rename from meta-oe/recipes-connectivity/ifuse/ifuse_1.1.2.bb
rename to meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb
-- 
1.8.1.2


