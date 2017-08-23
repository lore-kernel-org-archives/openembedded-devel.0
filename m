Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4641C782FE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Aug 2017 03:01:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7N31Qpj011899
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 Aug 2017 20:01:26 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 22 Aug 2017 20:01:25 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Aug 2017 23:01:21 -0400
Message-ID: <cover.1503457180.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/3] upgrade 3 recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Aug 2017 03:01:32 -0000
Content-Type: text/plain

The following changes since commit ac2a6d2b5d69937577effcb8bb2149651bac0176:

  json-spirit: Add -latomic to LDFLAGS (2017-08-13 13:21:04 +0200)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/upgrade-20180823
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/upgrade-20180823

Hongxu Jia (3):
  netcf: upgrade to latest 0.2.8
  gnulib: upgrade to 2017-08-20.18
  collectd: 5.7.1 -> 5.7.2

 .../recipes-support/netcf/{netcf_git.bb => netcf_0.2.8.bb}    | 11 ++++++-----
 .../collectd/{collectd_5.7.1.bb => collectd_5.7.2.bb}         |  4 ++--
 .../gnulib/{gnulib_git.bb => gnulib_2017-08-20.18.bb}         |  5 ++---
 3 files changed, 10 insertions(+), 10 deletions(-)
 rename meta-networking/recipes-support/netcf/{netcf_git.bb => netcf_0.2.8.bb} (88%)
 rename meta-oe/recipes-extended/collectd/{collectd_5.7.1.bb => collectd_5.7.2.bb} (96%)
 rename meta-oe/recipes-support/gnulib/{gnulib_git.bb => gnulib_2017-08-20.18.bb} (86%)

-- 
2.8.1


