Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BC63D6F7AF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 09:48:45 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Mar 2014 02:44:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,629,1389772800"; d="scan'208";a="470091058"
Received: from sleopold-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.85])
	by orsmga001.jf.intel.com with ESMTP; 11 Mar 2014 02:48:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Mar 2014 09:48:35 +0000
Message-Id: <cover.1394531274.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [meta-webserver][PATCH 0/2] PHP/phpMyAdmin upgrades again
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
X-List-Received-Date: Tue, 11 Mar 2014 09:48:46 -0000

Of course, no sooner than we have the previous upgrades merged, a new 
release happens upstream. In the PHP case the upgrade contains several
CVE fixes so it's definitely worth applying.


The following changes since commit 54b9d0199e55027bd4b54fc5c6ee488d117a46da:

  phpmyadmin: update to 4.1.8 (2014-03-06 12:12:15 +0000)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/webserver-upgrades2
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/webserver-upgrades2

Paul Eggleton (2):
  modphp: update to 5.5.10
  phpmyadmin: update to 4.1.9

 meta-webserver/recipes-php/modphp/modphp_5.5.10.bb                 | 7 +++++++
 meta-webserver/recipes-php/modphp/modphp_5.5.9.bb                  | 7 -------
 .../phpmyadmin/{phpmyadmin_4.1.8.bb => phpmyadmin_4.1.9.bb}        | 4 ++--
 3 files changed, 9 insertions(+), 9 deletions(-)
 create mode 100644 meta-webserver/recipes-php/modphp/modphp_5.5.10.bb
 delete mode 100644 meta-webserver/recipes-php/modphp/modphp_5.5.9.bb
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_4.1.8.bb => phpmyadmin_4.1.9.bb} (87%)

-- 
1.8.5.3


