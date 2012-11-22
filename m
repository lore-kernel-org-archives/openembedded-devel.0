Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TbaGJ-0007ZI-5t
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2012 18:08:27 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 Nov 2012 08:54:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,301,1352102400"; d="scan'208";a="221146316"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.201])
	by azsmga001.ch.intel.com with ESMTP; 22 Nov 2012 08:54:18 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org,
	Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 22 Nov 2012 16:54:06 +0000
Message-Id: <c6fe627660a6085f9377337f486e11bad92082e4.1353603007.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1353603007.git.paul.eggleton@linux.intel.com>
References: <cover.1353603007.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1353603007.git.paul.eggleton@linux.intel.com>
References: <cover.1353603007.git.paul.eggleton@linux.intel.com>
Subject: [meta-systemd][PATCH 2/3] meta-systemd: meta-networking: ntp: Update bbappend to 4.2.6p5
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
X-List-Received-Date: Thu, 22 Nov 2012 17:08:28 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../{ntp_4.2.6p3.bbappend => ntp_4.2.6p5.bbappend} |    0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/meta-networking/recipes-support/ntp/{ntp_4.2.6p3.bbappend => ntp_4.2.6p5.bbappend} (100%)

diff --git a/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p3.bbappend b/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bbappend
similarity index 100%
rename from meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p3.bbappend
rename to meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bbappend
-- 
1.7.9.5



