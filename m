Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6296C7226D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 May 2015 07:14:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4E7ENih005994
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 May 2015 00:14:23 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 14 May 2015 00:14:23 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 May 2015 15:14:17 +0800
Message-ID: <cover.1431587286.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 0/3] Resend 3 patches for multilib with repo url
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
X-List-Received-Date: Thu, 14 May 2015 07:14:24 -0000
Content-Type: text/plain

   Resend these 3 patches which marked as spam in previous email.

The following changes since commit 53d55216c8c721d3b66ec8f968737bf081def870:

  tcpdump: upgrade to 4.7.4 (2015-05-13 09:51:27 -0400)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib yzhao/multilib-fixes
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=yzhao/multilib-fixes

Yi Zhao (3):
  p7zip: fix PN -> BPN for multilib
  mpich: fix ${PN}-${PV} -> ${BP} for multilib
  sylpheed: remove do_install_append

 meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb     |    2 +-
 meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb    |    2 +-
 meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb |   10 +---------
 3 files changed, 3 insertions(+), 11 deletions(-)

-- 
1.7.9.5


