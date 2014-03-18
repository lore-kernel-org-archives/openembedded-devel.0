Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E06516F8CD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Mar 2014 08:21:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2I8L9Y3006338
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Mar 2014 01:21:09 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Tue, 18 Mar 2014 01:21:08 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 18 Mar 2014 16:21:05 +0800
Message-ID: <cover.1395130693.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [meta-networking][PATCH 0/1] netcf: fix gnulib not found in sysroots while using a shared sstate cache
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
X-List-Received-Date: Tue, 18 Mar 2014 08:21:13 -0000
Content-Type: text/plain

The following changes since commit 3c5bd3a077d04c140d774d258ac9f2652dda2669:

  phpmyadmin: update to 4.1.9 (2014-03-17 10:46:59 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-netcf
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-netcf

Hongxu Jia (1):
  netcf: fix gnulib not found in sysroots while using a shared sstate
    cache

 meta-networking/recipes-support/netcf/gnulib_git.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

-- 
1.8.1.2


