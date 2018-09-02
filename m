Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 96BDA79093
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Sep 2018 23:33:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Sep 2018 16:33:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,322,1531810800"; d="scan'208";a="229660091"
Received: from zhenmeih-mobl.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.170.9])
	by orsmga004.jf.intel.com with ESMTP; 02 Sep 2018 16:32:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Sep 2018 11:32:14 +1200
Message-Id: <cover.1535931120.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH 0/1] mosquitto: upgrade to 1.5.1
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
X-List-Received-Date: Sun, 02 Sep 2018 23:33:48 -0000

The following changes since commit 6964fa543c9f4394217128b780caa1a94a1d3d21:

  nmap: install ndiff (2018-08-22 11:32:58 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/mosquitto-1-5-1
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=paule/mosquitto-1-5-1

Paul Eggleton (1):
  mosquitto: upgrade to 1.5.1

 .../mosquitto/files/mosquitto.init                |  4 ++--
 .../mosquitto/files/mosquitto.service             | 15 ---------------
 .../{mosquitto_1.4.15.bb => mosquitto_1.5.1.bb}   | 11 ++++-------
 3 files changed, 6 insertions(+), 24 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/mosquitto/files/mosquitto.service
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_1.4.15.bb => mosquitto_1.5.1.bb} (89%)

-- 
2.17.1


