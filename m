Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8C9E160685
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 05:29:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v1G5T47E000596
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2017 21:29:05 -0800
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 15 Feb 2017 21:29:04 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Feb 2017 13:21:29 +0800
Message-ID: <cover.1487222337.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [meta-python][PATCH 0/2 v2] python-mock: add missing dependencies
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
X-List-Received-Date: Thu, 16 Feb 2017 05:29:05 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

v2 comments:
Fixed a typo

--
The following changes since commit 044e5189549de11b2a94efd29a6009a76162b8f1:

  smbnetfs gnome-disk-utility contacts kexecboot initramfs-kexecboot-klibc-image system-config-keyboard system-setup-keyboard geany geany-plugins efivar efibootmgr gimp system-config-keyboard tumbler: Blacklist (2017-02-13 20:34:21 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/d_python-mock_170216_1
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/d_python-mock_170216_1

Jackie Huang (2):
  python-funcsigs: add new recipe
  python-mock: add RDEPENDS on python-pbr and python-funcsigs

 .../recipes-devtools/python/python-funcsigs_1.0.2.bb   | 18 ++++++++++++++++++
 .../recipes-devtools/python/python-mock_2.0.0.bb       |  5 ++++-
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python-funcsigs_1.0.2.bb

-- 
2.8.3


