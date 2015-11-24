Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 767566018D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2015 09:27:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAO9Rdd7011194
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2015 01:27:40 -0800 (PST)
Received: from localhost (128.224.162.175) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Tue, 24 Nov 2015 01:25:28 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 24 Nov 2015 17:25:23 +0800
Message-ID: <cover.1448356894.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.162.175]
Subject: [meta-oe][PATCH 0/3] 3 fixes for qa issues
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
X-List-Received-Date: Tue, 24 Nov 2015 09:27:40 -0000
Content-Type: text/plain


The following changes since commit ea319464b673cbf9a416b582dc4766faeb998430:

  vlc: add PACKAGECONFIG for samba, upnp, dvdnav, sftp, vorbis, dc1394, dv1394, svg, svgdec (2015-11-16 21:50:11 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib yzhao/3-fixes-qa-issues
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=yzhao/3-fixes-qa-issues

Yi Zhao (3):
  pam-passwdqc: fix the hardcoded libdir
  tmux: add PACKAGECONFIG for utempter
  hplip: specify cupsbackenddir and cupsfilterdir

 meta-oe/recipes-extended/hplip/hplip_3.12.6.bb     |    2 ++
 meta-oe/recipes-extended/tmux/tmux_2.1.bb          |    4 ++++
 .../pam-passwdqc/pam-passwdqc_1.0.5.bb             |    7 ++++---
 3 files changed, 10 insertions(+), 3 deletions(-)

-- 
1.7.9.5


