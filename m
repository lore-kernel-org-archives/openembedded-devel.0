Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E592576BD7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 09:11:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8I9B1gk023289
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 02:11:01 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.235.1;
	Fri, 18 Sep 2015 02:11:01 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 18 Sep 2015 17:10:55 +0800
Message-ID: <cover.1442567286.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 0/3] 3 fixes for multilib
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
X-List-Received-Date: Fri, 18 Sep 2015 09:11:05 -0000
Content-Type: text/plain


The following changes since commit 1692d5c3020434404fc1ee6911a60b88287a5efb:

  netmap: add new package (2015-09-15 10:49:30 -0400)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib yzhao/multilib-fixes
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=yzhao/multilib-fixes

Yi Zhao (3):
  sblim-sfcCommon: fix ${PN}-${PV} -> ${BP} for multilib
  sblim-sfcb: fix ${PN}-${PV} -> ${BP} for multilib
  mailcap: fix PN -> BPN for multilib

 .../sblim-sfcCommon/sblim-sfcCommon_1.0.1.bb       |    2 +-
 .../sblim-sfcb/sblim-sfcb_1.4.8.bb                 |    2 +-
 meta-oe/recipes-support/mailcap/mailcap_2.1.44.bb  |    4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
1.7.9.5


