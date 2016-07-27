Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2F99A606BF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 08:18:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6R8I7wL018997
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 01:18:07 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 27 Jul 2016 01:18:06 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 27 Jul 2016 04:18:03 -0400
Message-ID: <cover.1469607093.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 0/2] upgrade libssh and libssh2
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
X-List-Received-Date: Wed, 27 Jul 2016 08:18:07 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The following changes since commit 5c69367d848271cdf3a3bd1a087665f324d3fd34:

  python-flask-bootstrap: update to version 3.3.6.0 and fix RDEPENDS (2016-07-22 21:45:42 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/r_uprev-libssh_160727_0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/r_uprev-libssh_160727_0

Jackie Huang (2):
  libssh: upgrade to 0.7.3
  libssh2: upgrade to 1.7.0

 meta-oe/recipes-support/libssh/{libssh_0.7.1.bb => libssh_0.7.3.bb}   | 2 +-
 .../recipes-support/libssh2/{libssh2_1.6.0.bb => libssh2_1.7.0.bb}    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/libssh/{libssh_0.7.1.bb => libssh_0.7.3.bb} (94%)
 rename meta-oe/recipes-support/libssh2/{libssh2_1.6.0.bb => libssh2_1.7.0.bb} (84%)

-- 
2.8.1


