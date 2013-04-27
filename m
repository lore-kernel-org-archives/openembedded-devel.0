Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UW3M3-0007MF-OM
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Apr 2013 13:32:08 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Apr 2013 04:13:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,562,1363158000"; d="scan'208";a="294071562"
Received: from unknown (HELO helios.localnet) ([10.255.12.79])
	by azsmga001.ch.intel.com with ESMTP; 27 Apr 2013 04:13:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Philip Balister <philip@balister.org>
Date: Sat, 27 Apr 2013 12:13:46 +0100
Message-ID: <1756231.MGNYtfpC2x@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-27-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <517BA9C6.6090707@balister.org>
References: <1367008757-18667-1-git-send-email-nicolas.dechesne@linaro.org>
	<68356141.McDxtR3Bre@helios> <517BA9C6.6090707@balister.org>
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] smartmontools: import from OE classic
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
X-List-Received-Date: Sat, 27 Apr 2013 11:32:19 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 27 April 2013 06:34:46 Philip Balister wrote:
> On 04/27/2013 04:24 AM, Paul Eggleton wrote:
> > On Friday 26 April 2013 23:41:38 Koen Kooi wrote:
> >> And do you really need a .inc?
> > 
> > Are we removing inc files if they were present in OE Classic? First I've
> > heard if we are...
> 
> If we are trying to reduce the number of versions of recipes we carry,
> dropping .inc files would seem to be a good idea. I don't have strong
> feelings, but it seems like something we should consider.

I agree we should try to keep only one version of each recipe in software 
layers, however I figure it makes it easier for people to carry their own 
versions of recipes in distro layers (particularly older, which may be 
required in certain circumstances) if we do keep inc files where they already 
exist.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


