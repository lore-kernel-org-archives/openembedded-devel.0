Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CFC9070E6F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 09:59:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7J9x0eN016620
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 Aug 2014 02:59:00 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 19 Aug 2014 02:59:00 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Aug 2014 17:58:56 +0800
Message-ID: <cover.1408442157.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 0/1] mariadb: refer ubuntu/redhat to add mysql group
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
X-List-Received-Date: Tue, 19 Aug 2014 09:59:29 -0000
Content-Type: text/plain

The following changes since commit 5f532a928c7df863a3f0d32db3918c8f7d227e2b:

  cyassl: add recipe (2014-08-15 17:07:45 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/mariadb-group
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/mariadb-group

Hongxu Jia (1):
  mariadb: refer ubuntu/redhat to add mysql group

 meta-oe/recipes-support/mysql/mariadb_5.5.38.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
1.9.1


