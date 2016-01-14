Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 82ECE73173
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2016 08:19:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0E8JDOU032263
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2016 00:19:13 -0800
Received: from localhost (128.224.162.175) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Thu, 14 Jan 2016 00:19:12 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Jan 2016 16:19:05 +0800
Message-ID: <cover.1452759356.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.162.175]
Subject: [meta-oe][PATCH 0/4] host-user-contaminated fixes for meta-oe
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
X-List-Received-Date: Thu, 14 Jan 2016 08:19:13 -0000
Content-Type: text/plain


The following changes since commit 73af5c278f6617149a46b2d2a1549bc154fa79e5:

  mime-construct: Perform more mangling for perl path (2016-01-06 13:27:21 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib yzhao/4-fixes
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=yzhao/4-fixes

Yi Zhao (4):
  debootstrap: fix host-user-contaminated
  espeak: fix host-user-contaminated
  orrery: fix host-user-contaminated
  logwatch: fix host-user-contaminated

 .../debootstrap/debootstrap_1.0.67.bb              |    1 +
 .../recipes-extended/logwatch/logwatch_7.4.1.bb    |    1 +
 meta-oe/recipes-navigation/orrery/orrery_2.7.bb    |    1 +
 meta-oe/recipes-support/espeak/espeak_1.37.bb      |    1 +
 4 files changed, 4 insertions(+)

-- 
1.7.9.5


