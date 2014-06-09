Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D67DF65EB4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jun 2014 16:24:35 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 09 Jun 2014 09:19:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,1003,1392192000"; d="scan'208";a="545257396"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.49])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2014 09:24:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Jun 2014 17:24:29 +0100
Message-Id: <cover.1402331046.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Cc: Eric Benard <eric@eukrea.com>
Subject: [meta-oe][dylan][PATCH 0/1] x264 SRCREV fix
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
X-List-Received-Date: Mon, 09 Jun 2014 16:24:38 -0000

The following changes since commit 70ebe86f193decd17d6295bcd4d4e5589585c0cc:

  cloud9: update repository for sass.js (2014-04-20 15:52:43 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/x264-dylan
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/x264-dylan

Paul Eggleton (1):
  x264: fix SRCREV after upstream repository change

 meta-oe/recipes-multimedia/x264/x264_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.9.3


