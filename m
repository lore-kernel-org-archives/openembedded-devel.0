Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (unknown [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C0ED865E87
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 May 2014 14:44:23 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 May 2014 07:44:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,901,1392192000"; d="scan'208";a="517119210"
Received: from ohreyal-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.77])
	by orsmga001.jf.intel.com with ESMTP; 24 May 2014 07:44:23 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 24 May 2014 15:44:14 +0100
Message-Id: <cover.1400942629.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
Subject: [meta-oe][PATCH 0/1] openobex B!=S fix
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
X-List-Received-Date: Sat, 24 May 2014 14:44:26 -0000

The following changes since commit 0e7630c31989bec8ac96261b72518f7b505bcdb7:

  libssh: update to 0.6.3 (2014-05-15 13:00:37 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/openobex
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/openobex

Paul Eggleton (1):
  openobex: fix detection of IrDA during configure with B!=S

 .../obex/openobex-1.5/separate_builddir.patch            | 16 ++++++++++++++++
 meta-oe/recipes-connectivity/obex/openobex_1.5.bb        |  3 ++-
 2 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/obex/openobex-1.5/separate_builddir.patch

-- 
1.9.0


