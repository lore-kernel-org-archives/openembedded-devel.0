Return-Path: <bruno.bottazzini@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6A6FC755F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 16:26:56 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 27 Apr 2016 09:26:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,542,1455004800"; d="scan'208";a="967745317"
Received: from bottazzini-thinkpad-t430.bz.intel.com ([10.218.98.161])
	by fmsmga002.fm.intel.com with ESMTP; 27 Apr 2016 09:26:56 -0700
From: Bruno Bottazzini <bruno.bottazzini@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Apr 2016 13:26:47 -0300
Message-Id: <1461774408-29906-1-git-send-email-bruno.bottazzini@intel.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <bruno.bottazzini@intel.com>
References: <bruno.bottazzini@intel.com>
Subject: [meta-oe][PATCH V2] libmicrohttpd: update to 0.9.49
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
X-List-Received-Date: Wed, 27 Apr 2016 16:26:56 -0000

Differences from V1:

Fixes --disable-spdy flag not found as pointed by Martin Jansa (Thanks)

Bruno Bottazzini (1):
  libmicrohttpd: update to 0.9.49

 .../libmicrohttpd/libmicrohttpd_0.9.34.bb          | 27 ----------------------
 .../libmicrohttpd/libmicrohttpd_0.9.49.bb          | 26 +++++++++++++++++++++
 2 files changed, 26 insertions(+), 27 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
 create mode 100644 meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.49.bb

-- 
2.7.1


