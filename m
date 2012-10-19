Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TPAHE-0001zb-U9
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Oct 2012 12:58:05 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 19 Oct 2012 03:44:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,612,1344236400"; d="scan'208";a="206502243"
Received: from unknown (HELO helios.localnet) ([10.252.122.112])
	by azsmga001.ch.intel.com with ESMTP; 19 Oct 2012 03:44:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Joe MacDonald <joe@deserted.net>
Date: Fri, 19 Oct 2012 11:44:40 +0100
Message-ID: <168838562.YJes5mSNF6@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <CANBf+V0uVAWNCt_E+MD42MxFjsu5XOkuaaOyx7Fy3xbBcMXFWg@mail.gmail.com>
References: <1347905904-814-1-git-send-email-fcooper@ti.com>
	<k39bug$tlg$1@ger.gmane.org>
	<CANBf+V0uVAWNCt_E+MD42MxFjsu5XOkuaaOyx7Fy3xbBcMXFWg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] thttpd: Port thttpd from oe-classic.
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
X-List-Received-Date: Fri, 19 Oct 2012 10:58:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 18 September 2012 11:39:24 Joe MacDonald wrote:
> On Tue, Sep 18, 2012 at 4:38 AM, Koen Kooi <koen@dominion.thruhere.net> 
wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> > 
> > Op 17-09-12 20:18, Franklin S. Cooper Jr schreef:
> >> * Port thttpd recipe from oe-classic to meta-oe.
> > 
> > It should go into meta-networking
> 
> Agreed.  Once it's been LSB'd, please put the recipe in
> meta-networking/recipes-daemons/

meta-networking or meta-webserver?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


