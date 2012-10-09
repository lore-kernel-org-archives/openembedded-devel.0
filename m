Received: from zk223.dresearch-fe.de ([217.92.177.116])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@fensuse.internal.dresearch-fe.de>)
	id 1TLVhl-00016K-LU for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2012 11:02:21 +0200
Received: from fensuse.internal.dresearch-fe.de
	(fensuse.internal.dresearch-fe.de [172.29.23.6])
	by zk223.dresearch-fe.de (Postfix) with ESMTP id 20040E022C;
	Tue,  9 Oct 2012 08:49:14 +0000 (UTC)
Received: by fensuse.internal.dresearch-fe.de (Postfix, from userid 1000)
	id 435C27041D5; Tue,  9 Oct 2012 10:49:13 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Tom Rini <tom.rini@gmail.com>, Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Tue,  9 Oct 2012 10:49:06 +0200
Message-Id: <cover.1349772344.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <CAMKF1soS0oBnwSUGVcJ1csgNGFdjPLY9qxW0-sZMr52TB=wOxw@mail.gmail.com>
References: <CAMKF1soS0oBnwSUGVcJ1csgNGFdjPLY9qxW0-sZMr52TB=wOxw@mail.gmail.com>
Subject: [2011.03-maintenance 0/1] pull request 20121009
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Oct 2012 09:02:21 -0000

Hi Tom,

please pull this commit which fixes a build problem on build hosts
with newer libXrender installations.

Thx,
Steffen

The following changes since commit a35ceaacb2019750dc9f4b4fd5ea927cf2ad47fb:

  gdk-pixbuf: add missing dependencies (2012-09-14 15:07:04 -0700)

are available in the git repository at:

  git://github.com/sledz/oe pull-request-3
  https://github.com/sledz/oe/tree/pull-request-3

Steffen Sledz (1):
  pango-native: add libxrender-native to dependencies

 recipes/pango/pango.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.10.4



