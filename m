Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EEFCD722E5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Nov 2014 05:42:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAQ5gBg2009784
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Nov 2014 21:42:11 -0800 (PST)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 25 Nov 2014 21:42:11 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 26 Nov 2014 00:42:00 -0500
Message-ID: <cover.1416979928.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [PATCH 00/13] Add LAYERVERSION and LAYERDEPENDS for layers
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
X-List-Received-Date: Wed, 26 Nov 2014 05:42:16 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

I asked about this and seems no objection, so adding these for each layer.

--
The following changes since commit 1b6141cc55fe8877c48b5e63c7db25dd75e35094:

  fwts: update to 14.09.00 release (2014-11-24 12:03:03 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib jhuang0/r_add-layerdepends-0
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/r_add-layerdepends-0

Jackie Huang (13):
  meta-oe: Add LAYERVERSION and LAYERDEPENDS
  meta-perl: Add LAYERVERSION and LAYERDEPENDS
  meta-python: Add LAYERVERSION and LAYERDEPENDS
  meta-ruby: Add LAYERVERSION and LAYERDEPENDS
  toolchain-layer: Add LAYERVERSION and LAYERDEPENDS
  meta-efl: Add LAYERVERSION and LAYERDEPENDS
  meta-filesystems: Add LAYERVERSION and LAYERDEPENDS
  meta-gnome: Add LAYERVERSION and LAYERDEPENDS
  meta-gpe: Add LAYERVERSION and LAYERDEPENDS
  meta-initramfs: Add LAYERVERSION and LAYERDEPENDS
  meta-multimedia: Add LAYERVERSION and LAYERDEPENDS
  meta-systemd: Add LAYERVERSION and LAYERDEPENDS
  meta-xfce: Add LAYERVERSION and LAYERDEPENDS

 meta-efl/conf/layer.conf         |    6 ++++++
 meta-filesystems/conf/layer.conf |    6 ++++++
 meta-gnome/conf/layer.conf       |    6 ++++++
 meta-gpe/conf/layer.conf         |    6 ++++++
 meta-initramfs/conf/layer.conf   |    6 ++++++
 meta-multimedia/conf/layer.conf  |    5 +++++
 meta-oe/conf/layer.conf          |    6 ++++++
 meta-perl/conf/layer.conf        |    6 ++++++
 meta-python/conf/layer.conf      |    6 ++++++
 meta-ruby/conf/layer.conf        |    6 ++++++
 meta-systemd/conf/layer.conf     |    6 ++++++
 meta-xfce/conf/layer.conf        |    6 ++++++
 toolchain-layer/conf/layer.conf  |    5 +++++
 13 files changed, 76 insertions(+)

-- 
1.7.9.5


