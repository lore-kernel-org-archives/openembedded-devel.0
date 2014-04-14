Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ABEF360702
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Apr 2014 07:16:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3E7Ge1O014178
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Apr 2014 00:16:41 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Mon, 14 Apr 2014 00:16:40 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 Apr 2014 15:16:37 +0800
Message-ID: <cover.1397459226.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/2] mariadb: use /bin/false as the login shell and add perl to RDEPENDS
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
X-List-Received-Date: Mon, 14 Apr 2014 07:16:42 -0000
Content-Type: text/plain

The following changes since commit 477ccd867cc71f8277f2670b7be34b3b15300052:

  klibc: restylize a bit the recipes (2014-04-06 13:36:20 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/mariadb
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/mariadb

Chong Lu (2):
  mariadb: use /bin/false as the login shell
  mariadb: add perl to RDEPENDS

 meta-oe/recipes-support/mysql/mariadb_5.1.67.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
1.8.1.2


