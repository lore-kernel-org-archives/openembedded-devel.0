Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 433206116C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Apr 2014 06:26:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s396QKAB027466
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 8 Apr 2014 23:26:20 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Tue, 8 Apr 2014 23:26:19 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 9 Apr 2014 14:27:07 +0800
Message-ID: <cover.1397024315.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-oe][PATCH 0/2] eject: fix multilib builds and wrong return value of usage
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
X-List-Received-Date: Wed, 09 Apr 2014 06:26:19 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

---
The following changes since commit bc969d3705c45928de8525ef3d2d9d2867311864:

  inetutils: add -dbg packages for tftpd, telnetd and rshd (2014-04-02 11:18:54 -0400)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib jhuang0/r_eject_1
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/r_eject_1

Jackie Huang (2):
  eject: fix multilib builds
  eject: Fix wrong return value

 .../eject/eject/eject-2.1.5-error-return.patch     |   10 ++++++++++
 meta-oe/recipes-support/eject/eject_2.1.5.bb       |    6 ++++--
 2 files changed, 14 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/eject/eject/eject-2.1.5-error-return.patch

-- 
1.7.9.5


