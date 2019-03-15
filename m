Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2A9147C69F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Mar 2019 07:48:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2F7lcna002368
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 15 Mar 2019 00:48:04 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 15 Mar 2019 00:47:54 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 15 Mar 2019 03:47:49 -0400
Message-ID: <20190315074751.47445-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][Patch 0/2] Update gvfs and libgtop
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
X-List-Received-Date: Fri, 15 Mar 2019 07:48:29 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Hi Khem,

Please ignore the previous patch to inherit upstream-version-is-even that they
are included in these patches.

Kai Kang (2):
  libgtop: 2.38.0 -> 2.39.91
  gvfs: 1.39.92 -> 1.40.0

 .../gvfs/{gvfs_1.39.92.bb => gvfs_1.40.0.bb}     |  6 +++---
 .../recipes-gnome/libgtop/libgtop_2.38.0.bb      | 13 -------------
 .../recipes-gnome/libgtop/libgtop_2.40.0.bb      | 16 ++++++++++++++++
 3 files changed, 19 insertions(+), 16 deletions(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.39.92.bb => gvfs_1.40.0.bb} (91%)
 delete mode 100644 meta-gnome/recipes-gnome/libgtop/libgtop_2.38.0.bb
 create mode 100644 meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb

-- 
2.20.0


