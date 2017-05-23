Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D92FD71AB7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 May 2017 07:01:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v4N71huo025790
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 May 2017 00:01:44 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 23 May 2017 00:01:43 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 23 May 2017 15:01:40 +0800
Message-ID: <cover.1495522368.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 0/2] add new recipe for xf86-video-mga and ssiapi
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
X-List-Received-Date: Tue, 23 May 2017 07:01:45 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

--
The following changes since commit fc03b3d9382dd5b6a8fff5f84e4c86a1acc9a73a:

  drbd-utils: fix dependency for perl under small-fs (2017-05-09 12:29:15 -0400)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/r_upstream-xf86-video-mga-ssiapi_170523_0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/r_upstream-xf86-video-mga-ssiapi_170523_0

Jackie Huang (2):
  xf86-video-mga: add new recipe
  ssiapi: add new recipe

 .../xorg-driver/xf86-video-mga/checkfile.patch     | 68 ++++++++++++++++++++++
 .../xorg-driver/xf86-video-mga_1.6.5.bb            | 21 +++++++
 meta-oe/recipes-support/ssiapi/ssiapi_1.0.1.bb     | 25 ++++++++
 3 files changed, 114 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-mga/checkfile.patch
 create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_1.6.5.bb
 create mode 100644 meta-oe/recipes-support/ssiapi/ssiapi_1.0.1.bb

-- 
2.11.0


