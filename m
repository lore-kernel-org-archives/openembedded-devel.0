Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-01.prod.phx3.secureserver.net
	(p3plsmtpa07-01.prod.phx3.secureserver.net [173.201.192.230])
	by mail.openembedded.org (Postfix) with ESMTP id 78BD77233E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Nov 2014 20:06:39 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa07-01.prod.phx3.secureserver.net with 
	id LL6e1p0070BVjqb01L6eXy; Wed, 26 Nov 2014 13:06:39 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Nov 2014 14:06:28 -0600
Message-Id: <cover.1417031737.git.pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
Subject: [PATCH 0/2] add conflicts for recipes incompatible with bluez5
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
X-List-Received-Date: Wed, 26 Nov 2014 20:06:50 -0000

The following changes since commit 34be57e7454ffe5f591cc0d7638bf41bb4377a61:

  meta-networking: update LAYERDEPENDS (2014-11-24 14:12:02 -0500)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib pabigot/bluez5
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=pabigot/bluez5

Peter A. Bigot (2):
  obexd: conflict with bluez5
  obex-data-server: conflict with bluez5

 meta-gnome/recipes-connectivity/obex/obexd_0.48.bb          | 2 ++
 meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb | 1 +
 2 files changed, 3 insertions(+)

-- 
1.8.5.5


