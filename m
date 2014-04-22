Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4333E60C14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Apr 2014 06:48:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3M6mxRR005507
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 21 Apr 2014 23:48:59 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Mon, 21 Apr 2014 23:48:58 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Apr 2014 14:48:54 +0800
Message-ID: <cover.1398149249.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] lib32-libcanberra: fix QA Warning Files/directories were installed but not shipped
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
X-List-Received-Date: Tue, 22 Apr 2014 06:49:04 -0000
Content-Type: text/plain

The following changes since commit 0f56bc4e2818a051a511ceb48596cbfa2f51ff3d:

  dejagnu: recipe taken from openembedded (2014-04-21 13:31:48 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-libcanberra
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-libcanberra

Hongxu Jia (1):
  lib32-libcanberra: fix QA Warning Files/directories were installed but
    not shipped

 meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
1.8.1.2


