Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 83DD265D85
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Apr 2014 07:00:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3F70YNI018815
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Apr 2014 00:00:34 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 15 Apr 2014 00:00:34 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 15 Apr 2014 15:01:23 +0800
Message-ID: <cover.1397545082.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-oe][PATCH 0/3] gd: update to version 2.1.0 and two fixes
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
X-List-Received-Date: Tue, 15 Apr 2014 07:00:37 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

--
The following changes since commit 477ccd867cc71f8277f2670b7be34b3b15300052:

  klibc: restylize a bit the recipes (2014-04-06 13:36:20 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib jhuang0/t_gd_140415-1
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/t_gd_140415-1

Hongxu Jia (1):
  gd: add perl to RDEPENDS

Jackie Huang (1):
  gd: update to version 2.1.0

Robert Yang (1):
  gd: fix the subdir-objects error

 .../gd/gd-2.1.0/fix-the-subdir-objects-error.patch |   39 ++++++++++++++++++++
 .../gd/{gd_2.0.35+2.0.36rc1.bb => gd_2.1.0.bb}     |   25 ++++++++-----
 2 files changed, 55 insertions(+), 9 deletions(-)
 create mode 100644 meta-oe/recipes-support/gd/gd-2.1.0/fix-the-subdir-objects-error.patch
 rename meta-oe/recipes-support/gd/{gd_2.0.35+2.0.36rc1.bb => gd_2.1.0.bb} (40%)

-- 
1.7.9.5


