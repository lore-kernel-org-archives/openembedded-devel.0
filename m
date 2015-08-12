Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CF62F766DF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2015 07:45:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7C7jdqv021377
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2015 00:45:42 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.235.1;
	Wed, 12 Aug 2015 00:45:39 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Aug 2015 15:45:33 +0800
Message-ID: <cover.1439365242.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 0/3] 3 fixes for meta-oe
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
X-List-Received-Date: Wed, 12 Aug 2015 07:45:42 -0000
Content-Type: text/plain


The following changes since commit 9a67b079a7deff2d6e53df031b26304a71c4e0f8:

  znc: add SRCREV_FORMAT variable (2015-08-07 11:01:01 -0400)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib yzhao/3-fixes
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=yzhao/3-fixes

Yi Zhao (3):
  sgpio: fix PN -> BPN for multilib
  vboxguestdrivers: upgrade 4.3.22 -> 4.3.30
  uim: use _remove operator to drop silent rules

 meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb   |    2 +-
 meta-oe/recipes-support/uim/uim_1.3.1.bb           |    2 +-
 ...rivers_4.3.22.bb => vboxguestdrivers_4.3.30.bb} |    4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_4.3.22.bb => vboxguestdrivers_4.3.30.bb} (93%)

-- 
1.7.9.5


