Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id DF6A1608B7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2018 23:13:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 May 2018 16:13:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,464,1520924400"; d="scan'208";a="44374606"
Received: from mmuhamm2-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.65.213])
	by fmsmga008.fm.intel.com with ESMTP; 31 May 2018 16:13:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Jun 2018 11:12:41 +1200
Message-Id: <cover.1527808350.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.14.3
Subject: [meta-networking][PATCH 0/1] mosquitto: upgrade to 1.4.15
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
X-List-Received-Date: Thu, 31 May 2018 23:13:15 -0000

The following changes since commit bb57bac845f3cd1634862fa9868bc8e294ba74a9:

  libgpiod: add packageconfig for python bindings (2018-05-26 21:10:55 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/mosquitto-1-4-15
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=paule/mosquitto-1-4-15

Paul Eggleton (1):
  mosquitto: upgrade to 1.4.15

 .../mosquitto/{mosquitto_1.4.14.bb => mosquitto_1.4.15.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_1.4.14.bb => mosquitto_1.4.15.bb} (95%)

-- 
2.14.3


