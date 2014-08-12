Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D4AFF6059A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 06:26:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7C6QFKt001573
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 11 Aug 2014 23:26:15 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 11 Aug 2014 23:26:15 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 12 Aug 2014 14:26:12 +0800
Message-ID: <cover.1407824502.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 0/1] syslog-ng: fix do_compi1e of qemuarm while DEBUG_BUILD
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
X-List-Received-Date: Tue, 12 Aug 2014 06:26:17 -0000
Content-Type: text/plain

The following changes since commit 4d4ab8fd320b58323033c12cf705e7b3ce10d659:

  integrate fcgi-2.4.0 and add OML license file (2014-08-10 17:23:22 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-syslog-ng
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-syslog-ng

Hongxu Jia (1):
  syslog-ng: fix do_compi1e of qemuarm while DEBUG_BUILD

 ...c-add-option-enable-thread-tls-to-manage-.patch | 50 ++++++++++++++++++++++
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |  5 +++
 2 files changed, 55 insertions(+)
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/configure.ac-add-option-enable-thread-tls-to-manage-.patch

-- 
1.9.1


