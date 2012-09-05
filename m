Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T9NPO-0004A9-Ij
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 23:45:14 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 Sep 2012 14:32:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,376,1344236400"; d="scan'208";a="218279317"
Received: from unknown (HELO helios.localnet) ([10.252.121.177])
	by fmsmga002.fm.intel.com with ESMTP; 05 Sep 2012 14:32:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 05 Sep 2012 22:32:46 +0100
Message-ID: <1718555.hFmUFu8O5x@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-30-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <20120905192818.GR3372@jama.jama.net>
References: <1346853750-503-1-git-send-email-ml@communistcode.co.uk>
	<4375690.RKMBt9Sfd5@helios> <20120905192818.GR3372@jama.jama.net>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 3/3] libcec: update libcec to latest version (1.8.2) as to include RasPi support
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
X-List-Received-Date: Wed, 05 Sep 2012 21:45:14 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 05 September 2012 21:28:18 Martin Jansa wrote:
> On Wed, Sep 05, 2012 at 03:16:10PM +0100, Paul Eggleton wrote:
> > It's not totally clear but it doesn't look like 1.8.2 has been released
> > yet judging from their website; if that's the case then PV should be set
> > to "1.8.1+git${SRCPV}".
> 
> Or rather
> "1.8.1+gitr${SRCPV}"
> like most meta-* recipes

This was discussed not that long ago IIRC - the r is superfluous for git. In 
fact if you look at most OE-Core recipes that use SRCPV they do not precede it 
with r.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


