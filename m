Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BE43C79CE4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Mar 2019 02:09:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2I28sSZ031662
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 17 Mar 2019 19:09:05 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Sun, 17 Mar 2019 19:08:32 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Sun, 17 Mar 2019 22:08:27 -0400
Message-ID: <20190318020829.35542-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH v3 0/2] Update gvfs and libgtop
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
X-List-Received-Date: Mon, 18 Mar 2019 02:09:36 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

v3:
* remove inherit upstream-version-is-even which has been done by previous patch

v2:
* correct libgtop commit message

Kai Kang (2):
  libgtop: 2.38.0 -> 2.40.0
  gvfs: 1.39.92 -> 1.40.0

 .../recipes-gnome/gvfs/{gvfs_1.39.92.bb => gvfs_1.40.0.bb}  | 4 ++--
 .../libgtop/{libgtop_2.38.0.bb => libgtop_2.40.0.bb}        | 6 ++++--
 2 files changed, 6 insertions(+), 4 deletions(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.39.92.bb => gvfs_1.40.0.bb} (94%)
 rename meta-gnome/recipes-gnome/libgtop/{libgtop_2.38.0.bb => libgtop_2.40.0.bb} (62%)

-- 
2.20.0


