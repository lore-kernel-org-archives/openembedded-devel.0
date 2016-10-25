Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4F6B270016
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Oct 2016 09:19:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u9P9J1ID027714
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 25 Oct 2016 02:19:01 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 25 Oct 2016 02:19:01 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Oct 2016 05:18:58 -0400
Message-ID: <cover.1477386993.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 0/1] libxklavier: upgrade 5.4
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
X-List-Received-Date: Tue, 25 Oct 2016 09:19:03 -0000
Content-Type: text/plain

The following changes since commit 8ba31c9ba214802b1305aabbc0be0353cba0bc3e:

  gpsd, mongodb: use PACKAGECONFIG_CONFARGS instead of now empty EXTRA_OECONF (2016-10-21 18:20:45 +0200)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/libxklavier
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=hongxu/libxklavier

Hongxu Jia (1):
  libxklavier: upgrade 5.4

 .../files/fix-do_installe-failure.patch            | 36 ++++++++++++++++++++++
 .../{libxklavier_5.3.bb => libxklavier_5.4.bb}     | 15 ++++++---
 2 files changed, 47 insertions(+), 4 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/libxklavier/files/fix-do_installe-failure.patch
 rename meta-gnome/recipes-gnome/libxklavier/{libxklavier_5.3.bb => libxklavier_5.4.bb} (55%)

-- 
2.8.1


