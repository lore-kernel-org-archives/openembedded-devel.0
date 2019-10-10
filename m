Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 4F6456C1BE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2019 00:39:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Oct 2019 17:39:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,278,1566889200"; d="scan'208";a="187790990"
Received: from kwang27-mobl10.gar.corp.intel.com (HELO linux.fritz.box)
	([10.249.75.165])
	by orsmga008.jf.intel.com with ESMTP; 09 Oct 2019 17:39:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Oct 2019 13:39:00 +1300
Message-Id: <cover.1570667753.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH 0/1] mosquitto: update to 1.6.7
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
X-List-Received-Date: Thu, 10 Oct 2019 00:39:08 -0000
Content-Transfer-Encoding: 8bit

The following changes since commit fd1a0c9210b162ccb147e933984c755d32899efc:

  Add zeus compatibility to all layer.conf files (2019-10-08 15:58:14 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/mosquitto-1-6-7
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=paule/mosquitto-1-6-7

Paul Eggleton (1):
  mosquitto: update to 1.6.7

 .../mosquitto/{mosquitto_1.6.6.bb => mosquitto_1.6.7.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_1.6.6.bb => mosquitto_1.6.7.bb} (96%)

-- 
2.20.1


