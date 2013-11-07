Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CF6A46D44A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2013 02:07:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA727ali023785
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 6 Nov 2013 18:07:36 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 6 Nov 2013 18:07:35 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 7 Nov 2013 10:07:31 +0800
Message-ID: <cover.1383789890.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] accel-ppp: fix qa issue 'found library in wrong location' while multilib enabled on qemux86-64
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
X-List-Received-Date: Thu, 07 Nov 2013 02:07:36 -0000
Content-Type: text/plain

The following changes since commit ffb5434823195cbdc41c76a110eaa6ae04e2b010:

  dnsmasq: uprev to 2.6.3 (2013-11-06 15:12:45 -0500)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-accel-ppp
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-accel-ppp

Hongxu Jia (1):
  accel-ppp: fix qa issue 'found library in wrong location' while
    multilib enabled on qemux86-64

 meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

-- 
1.8.1.2


