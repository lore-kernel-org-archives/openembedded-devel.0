Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1C41960616
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 08:49:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBU8nKBh020122
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 00:49:20 -0800
Received: from localhost (128.224.162.175) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Wed, 30 Dec 2015 00:49:18 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 30 Dec 2015 16:49:14 +0800
Message-ID: <cover.1451465023.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.162.175]
Subject: [meta-oe][PATCH 0/2] 2 fixes for meta-oe
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
X-List-Received-Date: Wed, 30 Dec 2015 08:49:20 -0000
Content-Type: text/plain


The following changes since commit edaa0d80b3d9060a163460989a6eb93a9d763479:

  mpd: add dependency on libupnp (2015-12-18 12:52:52 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib yzhao/meta-oe-fixes
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=yzhao/2-fixes

Yi Zhao (2):
  polkit-gnome: remove unrecognized configure options
  libvncserver: fix PN -> BPN for multilib

 .../recipes-extended/polkit/polkit-gnome_0.105.bb  |    4 ----
 .../libvncserver/libvncserver_0.9.10.bb            |    2 +-
 2 files changed, 1 insertion(+), 5 deletions(-)

-- 
1.7.9.5


