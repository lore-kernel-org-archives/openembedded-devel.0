Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 972DC74573
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 07:29:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4O7Tp58018669
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 24 May 2018 00:29:51 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 24 May 2018 00:29:50 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <akuster808@gmail.com>
Date: Thu, 24 May 2018 15:39:11 +0800
Message-ID: <1527147551-32644-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] metacity: fix version number typo 3.38.0 -> 3.28.0
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
X-List-Received-Date: Thu, 24 May 2018 07:29:55 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-gnome/metacity/{metacity_3.38.0.bb => metacity_3.28.0.bb}     | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-gnome/recipes-gnome/metacity/{metacity_3.38.0.bb => metacity_3.28.0.bb} (100%)

diff --git a/meta-gnome/recipes-gnome/metacity/metacity_3.38.0.bb b/meta-gnome/recipes-gnome/metacity/metacity_3.28.0.bb
similarity index 100%
rename from meta-gnome/recipes-gnome/metacity/metacity_3.38.0.bb
rename to meta-gnome/recipes-gnome/metacity/metacity_3.28.0.bb
-- 
2.7.4


