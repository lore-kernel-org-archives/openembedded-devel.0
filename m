Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BEE5D7F942
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2019 23:54:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Sep 2019 16:54:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,514,1559545200"; d="scan'208";a="216383740"
Received: from klim280-mobl1.gar.corp.intel.com (HELO linux.fritz.box)
	([10.255.155.138])
	by fmsmga002.fm.intel.com with ESMTP; 16 Sep 2019 16:54:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Sep 2019 11:54:34 +1200
Message-Id: <cover.1568678019.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH 0/1] mosquitto: update to 1.6.5
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
X-List-Received-Date: Mon, 16 Sep 2019 23:54:47 -0000
Content-Transfer-Encoding: 8bit

The following changes since commit 19528ba2a6014ebe32b7a3d3099b037330228b88:

  evtest: update to 1.34 (2019-09-14 07:16:38 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/mosquitto-1-6-5
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=paule/mosquitto-1-6-5

Paul Eggleton (1):
  mosquitto: update to 1.6.5

 .../{mosquitto_1.5.8.bb => mosquitto_1.6.5.bb}      | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_1.5.8.bb => mosquitto_1.6.5.bb} (86%)

-- 
2.20.1


