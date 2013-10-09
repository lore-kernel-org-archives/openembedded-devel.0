Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D80126CF0D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Oct 2013 07:30:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r997UcO3028691
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Oct 2013 00:30:38 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 9 Oct 2013 00:30:37 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 9 Oct 2013 15:30:33 +0800
Message-ID: <cover.1381303656.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [meta-oe][PATCH 0/2] mariadb: fix warning and update libdir for libtool
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
X-List-Received-Date: Wed, 09 Oct 2013 07:30:42 -0000
Content-Type: text/plain

The following changes since commit 2a463dddcf76d7fa437e96f6cf0210143e97a904:

  thunar-volman: Add PACKAGECONFIG for notify (2013-10-05 14:24:05 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-mariadb
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-mariadb

Hongxu Jia (2):
  mariadb: update libdir for libtool
  mariadb: fix warning while invoking 'mysql_install_db' on target

 meta-oe/recipes-support/mysql/mariadb/my.cnf     | 2 +-
 meta-oe/recipes-support/mysql/mariadb_5.1.67.inc | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
1.8.1.2


