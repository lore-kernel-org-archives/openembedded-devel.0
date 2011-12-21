Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RdNr2-00043W-No
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Dec 2011 16:13:16 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2011 07:06:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="90007884"
Received: from unknown (HELO helios.localnet) ([10.252.122.36])
	by orsmga002.jf.intel.com with ESMTP; 21 Dec 2011 07:06:10 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Dec 2011 15:06:07 +0000
Message-ID: <1619521.vnmDeKUhkM@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.4 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
MIME-Version: 1.0
Subject: OE-Core transition documentation
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
X-List-Received-Date: Wed, 21 Dec 2011 15:13:17 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi all,

It seems we still haven't made an announcement on the website about the OE-
Core transition. I did write a wiki page about it [1] but never got around to 
linking it from the main page. What I'd like to do is the following:

1) Add a short news entry mentioning the transition and pointing people to the 
OE-Core page.

2) Extend the OE-Core page to help people understand how to make the 
transition a bit better:
 * Describe how the mailing lists function
 * Add info on how to add a layer to your setup
 * More info on what should go where and what to do if something's missing
I'm starting to wonder if this page ought to be turned into an FAQ type 
document.

3) Try to figure out how to reorganise the main page so having a link from 
there to the layer index [2] makes sense

Comments? Suggestions? Please let me know if you have questions about OE-Core 
that aren't fully answered by the material already on the OE-Core / layer 
index pages.

Cheers,
Paul

[1] http://www.openembedded.org/wiki/OpenEmbedded-Core
[2] http://www.openembedded.org/wiki/LayerIndex

-- 

Paul Eggleton
Intel Open Source Technology Centre


