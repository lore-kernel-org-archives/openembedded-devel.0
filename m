Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TfxBj-00027M-KZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 19:25:48 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 04 Dec 2012 10:11:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,215,1355126400"; d="scan'208";a="226498222"
Received: from unknown (HELO helios.localnet) ([10.252.122.195])
	by azsmga001.ch.intel.com with ESMTP; 04 Dec 2012 10:11:23 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 04 Dec 2012 18:11:22 +0000
Message-ID: <3145293.jEgb7vZ7zI@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-18-generic; KDE/4.9.3; i686; ; )
MIME-Version: 1.0
Subject: OE-Classic patches in patchwork
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
X-List-Received-Date: Tue, 04 Dec 2012 18:25:54 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi all,

There is a significant volume of patches in the OE patchwork [1] that are 
intended to apply to OE-Classic. Apart from the 2011.3-maintenance branch, OE-
Classic is no longer maintained in favour of OE-Core + layers, so the question 
is what should we do with these patches? At the moment I'm thinking we should 
just mark them as "archived" so that they disappear from the queue; people can 
still get access to them if needed.

Thoughts?

Cheers,
Paul

[1] http://patchwork.openembedded.org/project/oe/list/

-- 

Paul Eggleton
Intel Open Source Technology Centre


