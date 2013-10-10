Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 838906CF1C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2013 09:21:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9A9LPUS010005
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 10 Oct 2013 02:21:25 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 10 Oct 2013 02:21:25 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 10 Oct 2013 17:21:21 +0800
Message-ID: <cover.1381396778.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [meta-oe][PATCH 0/1] mariadb: Add mysql5 to RPROVIDES for backwards compatibility
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
X-List-Received-Date: Thu, 10 Oct 2013 09:21:25 -0000
Content-Type: text/plain

The following changes since commit d79d4b340358168d7ca4b8f2837c9d09c44bd1fe:

  netperf: set _FILE_OFFSET_BITS to 64 to support large files (2013-10-09 09:57:21 -0400)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-mariadb-3
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-mariadb-3

Hongxu Jia (1):
  mariadb: Add mysql5 to RPROVIDES for backwards compatibility

 meta-oe/recipes-support/mysql/mariadb_5.1.67.bb | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

-- 
1.8.1.2


