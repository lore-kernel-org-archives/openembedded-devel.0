Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B926360797
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 02:30:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6I2UZWQ017157
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jul 2016 19:30:35 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 17 Jul 2016 19:30:34 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 18 Jul 2016 10:28:11 +0800
Message-ID: <1468808893-5752-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Subject: [PATCH 0/2] Add 2 ttf fonts
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
X-List-Received-Date: Mon, 18 Jul 2016 02:30:36 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>


Kai Kang (2):
  liberation-sans-narrow: add a ttf font
  ttf-vlgothic: add a ttf font

 .../30-0-liberation-sans-narrow.conf               | 18 ++++++++++++
 .../ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb | 32 ++++++++++++++++++++++
 .../ttf-fonts/ttf-vlgothic_20141206.bb             | 28 +++++++++++++++++++
 3 files changed, 78 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow/30-0-liberation-sans-narrow.conf
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20141206.bb

-- 
2.6.1


