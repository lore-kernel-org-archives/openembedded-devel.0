Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7FF9160138
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 07:11:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4C7BFXS020334
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 May 2015 00:11:15 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Tue, 12 May 2015 00:11:14 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 12 May 2015 15:11:09 +0800
Message-ID: <1431414672-1832-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 0/3] Resend 3 patches for multilib
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
X-List-Received-Date: Tue, 12 May 2015 07:11:15 -0000
Content-Type: text/plain

   Resend these 3 patches which marked as spam in previous email.

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


