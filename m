Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U9Yll-0000oZ-5j
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Feb 2013 11:25:24 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 24 Feb 2013 02:09:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,727,1355126400"; d="scan'208";a="260754923"
Received: from unknown (HELO helios.localnet) ([10.252.120.80])
	by azsmga001.ch.intel.com with ESMTP; 24 Feb 2013 02:09:02 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Sankar H Malarmani <sankar.m@hardcube.in>
Date: Sun, 24 Feb 2013 10:09 +0000
Message-ID: <6055622.aPIpdLV0X6@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10 (Linux/3.5.0-24-generic; KDE/4.10.0; i686; ; )
In-Reply-To: <20130224080543.GC3154@sakrah.homelinux.org>
References: <CAJTo0LaESjBTOXzxQzQm5KxkQqOi8HnKgJxxjr99mNWTbbeVog@mail.gmail.com>
	<CAKSKmM0KRgsyewoQEcvArS+MDQDpAbUbUw4iMvX-AEMfPJ7-yA@mail.gmail.com>
	<20130224080543.GC3154@sakrah.homelinux.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: gtk errors in openembedded classis build
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
X-List-Received-Date: Sun, 24 Feb 2013 10:25:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 24 February 2013 00:05:44 Khem Raj wrote:
> On (19/02/13 11:44), Sankar H Malarmani wrote:
> > Hi,
> > 
> > I need to run my wxwidget application on the colibri module with the linux
> > image built using openembedded. For that I need wxwidgets library in the
> > colibri module.
> > Is it possible ?? If so, how can I do it ??
> 
> You need to port the recipe over from OE-classic, should be relatively
> simple. The classic recipes are here
> http://git.openembedded.org/openembedded/tree/recipes/wxwidgets

FYI also there is some information on what you'll need to do for porting:

http://www.openembedded.org/wiki/Migrating_metadata_to_OE-Core

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


