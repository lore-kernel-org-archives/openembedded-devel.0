Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SVIyC-0002ez-Pp
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 May 2012 10:55:33 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 May 2012 01:45:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="168008823"
Received: from unknown (HELO helios.localnet) ([10.252.120.146])
	by fmsmga002.fm.intel.com with ESMTP; 18 May 2012 01:45:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Thilo Fromm <fromm@dresearch-fe.de>
Date: Fri, 18 May 2012 09:45:26 +0100
Message-ID: <6434146.9hc03uN0UM@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.2.0-24-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <CADZ6=avSzGXb3h1BunDQqqojA7tv-gO2VRicC6nt9KzAuNOcUg@mail.gmail.com>
References: <CADZ6=avSzGXb3h1BunDQqqojA7tv-gO2VRicC6nt9KzAuNOcUg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Introducing the HidaV layer
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
X-List-Received-Date: Fri, 18 May 2012 08:55:33 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 18 May 2012 10:09:42 Thilo Fromm wrote:
> There's a new layer in town. HidaV will provide a common platform
> layer, development support, and firmware for our yet-to-come ti8148
> based systems. The layer poses a symbiosis of a "board support" and a
> "distribution" layer. HidaV integrates meta-ti, meta-openembedded,
> meta-angstrom, and openembedded-core to a well-tailored distribution.
> Although HidaV therefore heavily focuses on our own devices/boards we
> hope to provide useful bug fixes and recipes for other projects/layers
> as well.
> 
> The code is here: <https://github.com/DFE/HidaV>
> Some initial documentation: <https://github.com/DFE/HidaV/wiki>

Great stuff!

> Finally, I would like to add HidaV to the openembedded layer index[1].
> Is there some formality involved in this, or do I just create a wiki
> account and then edit it in?

No formality in particular. I think you should be able to add it, or I'm more 
than happy to add it right now - in fact I was about to, but I'm not entirely 
sure where this fits. Does it belong in "Miscellaneous" or "Board / device 
support layers"?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


