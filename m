Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1USimW-0006WC-EZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Apr 2013 08:57:25 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 Apr 2013 23:39:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,499,1363158000"; d="scan'208";a="324173604"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.215])
	by fmsmga002.fm.intel.com with ESMTP; 17 Apr 2013 23:39:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Apr 2013 07:39:36 +0100
Message-Id: <cover.1366267106.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe, meta-webserver][PATCH 0/2] Move some recipes to meta-webserver
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
X-List-Received-Date: Thu, 18 Apr 2013 06:57:36 -0000

The following changes since commit bea2397361da080df1256046b927b454e2e5fc9a:

  libical: remove (2013-04-16 18:16:30 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/meta-webserver-moves
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/meta-webserver-moves

Paul Eggleton (2):
  cherokee: move to meta-webserver and tweak
  nostromo: move to meta-webserver and tweak

 .../recipes-httpd}/cherokee/cherokee/cherokee.init              |    0
 .../recipes-httpd}/cherokee/cherokee_1.2.98.bb                  |    4 ++--
 ...0001-GNUmakefile-add-possibility-to-override-variables.patch |    0
 .../recipes-httpd}/nostromo/files/nhttpd.conf                   |    0
 .../recipes-httpd}/nostromo/files/nostromo                      |    0
 .../recipes-httpd}/nostromo/files/volatiles                     |    0
 .../recipes-httpd}/nostromo/nostromo_1.9.5.bb                   |    7 ++++---
 7 files changed, 6 insertions(+), 5 deletions(-)
 rename {meta-oe/recipes-connectivity => meta-webserver/recipes-httpd}/cherokee/cherokee/cherokee.init (100%)
 rename {meta-oe/recipes-connectivity => meta-webserver/recipes-httpd}/cherokee/cherokee_1.2.98.bb (93%)
 rename {meta-oe/recipes-extended => meta-webserver/recipes-httpd}/nostromo/files/0001-GNUmakefile-add-possibility-to-override-variables.patch (100%)
 rename {meta-oe/recipes-extended => meta-webserver/recipes-httpd}/nostromo/files/nhttpd.conf (100%)
 rename {meta-oe/recipes-extended => meta-webserver/recipes-httpd}/nostromo/files/nostromo (100%)
 rename {meta-oe/recipes-extended => meta-webserver/recipes-httpd}/nostromo/files/volatiles (100%)
 rename {meta-oe/recipes-extended => meta-webserver/recipes-httpd}/nostromo/nostromo_1.9.5.bb (97%)

-- 
1.7.10.4



