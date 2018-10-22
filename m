Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id E9ED462133
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Oct 2018 21:19:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Oct 2018 14:19:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,413,1534834800"; d="scan'208";a="90408964"
Received: from pgeddapp-mobl3.gar.corp.intel.com (HELO localhost.localdomain)
	([10.249.65.239])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Oct 2018 14:19:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Oct 2018 10:19:29 +1300
Message-Id: <cover.1540243091.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.17.2
Subject: [meta-oe][PATCH 0/1] libssh: upgrade to 0.8.4
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
X-List-Received-Date: Mon, 22 Oct 2018 21:19:42 -0000

Upgrade prompted by the recently publicised security issue. (Note: I'm
not actually using this, it just didn't seem right to have a stale and
vulnerable version of this package sitting around.)


The following changes since commit cdd3e9ab99d4ffda673b564ba802b6bd2d40eabf:

  toybox: Fix paths to match OE conventions (2018-10-18 14:19:37 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/libssh
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=paule/libssh

Paul Eggleton (1):
  libssh: upgrade to 0.8.4

 .../libssh/{libssh_0.7.3.bb => libssh_0.8.4.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libssh/{libssh_0.7.3.bb => libssh_0.8.4.bb} (86%)

-- 
2.17.2


