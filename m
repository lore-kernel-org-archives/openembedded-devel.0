Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 957816CA01
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2013 02:34:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8P2YR0n000030
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 24 Sep 2013 19:34:27 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 24 Sep 2013 19:34:25 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Sep 2013 10:34:22 +0800
Message-ID: <cover.1380076234.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [meta-webserver][PATCH 0/1] apache2: fix error messages when restart apache service
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
X-List-Received-Date: Wed, 25 Sep 2013 02:34:26 -0000
Content-Type: text/plain

The following changes since commit 7e0bdfc5ecf7c551416e2a193c9220347d8fe03f:

  lowpan-tools: add git version (2013-09-24 09:04:55 -0400)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-apache2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-apache2

Hongxu Jia (1):
  apache2: fix error messages when restart apache service

 meta-webserver/recipes-httpd/apache2/apache2_2.4.6.bb | 2 ++
 1 file changed, 2 insertions(+)

-- 
1.8.1.2


