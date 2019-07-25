Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4419E6D494
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jul 2019 08:12:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6P8C023024900
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 25 Jul 2019 01:12:10 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 25 Jul 2019 01:11:49 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Thu, 25 Jul 2019 04:11:45 -0400
Message-ID: <20190725081146.43992-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH v2 0/1] Fix xfwm4 assertion error
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
X-List-Received-Date: Thu, 25 Jul 2019 08:12:36 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

v2:
* add Upstream-Status

Kai Kang (1):
  xfwm4: fix assertion error

 ...r-Revert-to-GLX-as-default-vblank-me.patch | 92 +++++++++++++++++++
 meta-xfce/recipes-xfce/xfwm4/xfwm4_4.13.3.bb  |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta-xfce/recipes-xfce/xfwm4/files/0001-Revert-compositor-Revert-to-GLX-as-default-vblank-me.patch

-- 
2.20.0


