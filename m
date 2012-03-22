Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SAjGF-0002ET-LG
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 15:45:07 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Mar 2012 07:36:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="123880796"
Received: from unknown (HELO helios.localnet) ([10.252.123.227])
	by orsmga002.jf.intel.com with ESMTP; 22 Mar 2012 07:36:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Mar 2012 14:36:09 +0000
Message-ID: <8340218.kgKhXA1Q5p@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <1370783.bcqOXY37du@helios>
References: <1332410499-18183-1-git-send-email-koen@dominion.thruhere.net>
	<1370783.bcqOXY37du@helios>
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [RFC][meta-oe][meta-toolchain][PATCH] meta-toolchain: populate with gcc and binutils from meta-oe
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
X-List-Received-Date: Thu, 22 Mar 2012 14:45:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 22 March 2012 14:33:59 Paul Eggleton wrote:
> On Thursday 22 March 2012 11:01:39 Koen Kooi wrote:
> > Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> > ---
> > 
> >  COPYING.MIT => meta-toolchain/COPYING.MIT          |    0
> 
> Sorry to be a pain but can we please call this something other than meta-
> toolchain? We already have meta-toolchain as a well-known recipe and there's
> enough name duplication in OE as it is.

Ah, not 30s after sending this I see this was already discussed. Sorry for the 
noise...

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


