Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0366C7190D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 07:02:25 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43385781"
Received: from localhost (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Nov 2014 14:59:11 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAE72APR016136
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 15:02:10 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 14 Nov 2014 15:02:29 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 14 Nov 2014 15:01:47 +0800
Message-ID: <1415948514-16992-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [PATCH 0/7] Add some recipes in xorg-app
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
X-List-Received-Date: Fri, 14 Nov 2014 07:02:40 -0000
Content-Type: text/plain

Add a set of useful developing tools of X utility.

Qian Lei (7):
  xlsatoms: Add new recipe
  xlsclients: Add new recipe
  xrefresh: Add new recipe
  xsetmode: Add new recipe
  xsetroot: Add new recipe
  xstdcmap: Add new recipe
  xwud: Add new recipe

 meta-oe/recipes-graphics/xorg-app/xlsatoms_1.1.1.bb   | 14 ++++++++++++++
 meta-oe/recipes-graphics/xorg-app/xlsclients_1.1.3.bb | 14 ++++++++++++++
 meta-oe/recipes-graphics/xorg-app/xrefresh_1.0.5.bb   | 13 +++++++++++++
 meta-oe/recipes-graphics/xorg-app/xsetmode_1.0.0.bb   | 15 +++++++++++++++
 meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.1.bb   | 14 ++++++++++++++
 meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.3.bb   | 15 +++++++++++++++
 meta-oe/recipes-graphics/xorg-app/xwud_1.0.4.bb       | 12 ++++++++++++
 7 files changed, 97 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-app/xlsatoms_1.1.1.bb
 create mode 100644 meta-oe/recipes-graphics/xorg-app/xlsclients_1.1.3.bb
 create mode 100644 meta-oe/recipes-graphics/xorg-app/xrefresh_1.0.5.bb
 create mode 100644 meta-oe/recipes-graphics/xorg-app/xsetmode_1.0.0.bb
 create mode 100644 meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.1.bb
 create mode 100644 meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.3.bb
 create mode 100644 meta-oe/recipes-graphics/xorg-app/xwud_1.0.4.bb

-- 
1.8.3.1


