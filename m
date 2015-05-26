Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DD2E965C63
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 08:19:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4Q8Jqoo024332
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 01:19:52 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Tue, 26 May 2015 01:19:52 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 May 2015 16:19:48 +0800
Message-ID: <cover.1432628160.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 0/2] 2 fixes for meta-oe
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
X-List-Received-Date: Tue, 26 May 2015 08:19:52 -0000
Content-Type: text/plain


The following changes since commit 175406cdca39bf5b218bb4127a3e9c9bd11b653f:

  recipes-multimedia: add gstreamer-0.10 recipes (2015-05-22 20:14:07 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib yzhao/2-fixes
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=yzhao/2-fixes

Yi Zhao (2):
  smstools: fix makefile override
  acpitests: fix build failure for multilib

 .../smstools3/fix-makefile-override.patch          |   24 ++++++++++++++++++++
 .../smstools3/smstools3_3.1.15.bb                  |    3 ++-
 .../recipes-extended/acpica/acpitests_20140828.bb  |    2 +-
 3 files changed, 27 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/smstools3/smstools3/fix-makefile-override.patch

-- 
1.7.9.5


