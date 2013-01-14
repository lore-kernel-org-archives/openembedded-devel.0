Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TunT6-0004Fb-B4
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Jan 2013 18:05:11 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 Jan 2013 08:48:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,468,1355126400"; d="scan'208";a="271818173"
Received: from unknown (HELO helios.localnet) ([10.252.123.130])
	by orsmga002.jf.intel.com with ESMTP; 14 Jan 2013 08:49:42 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Marko Lindqvist <cazfi74@gmail.com>
Date: Mon, 14 Jan 2013 16:49:41 +0000
Message-ID: <1877450.6sZ4HM91lS@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-21-generic; KDE/4.9.3; i686; ; )
In-Reply-To: <CAF6bG8ewV-MJArsCy799uW55nU7ftwJiYoga95rq5CeqEhY8EA@mail.gmail.com>
References: <1357693239-13210-1-git-send-email-schnitzeltony@googlemail.com>
	<2159085.vty0yDIBH9@helios>
	<CAF6bG8ewV-MJArsCy799uW55nU7ftwJiYoga95rq5CeqEhY8EA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe/meta-multimedia 0/2] games preparations
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
X-List-Received-Date: Mon, 14 Jan 2013 17:05:20 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 14 January 2013 16:36:05 Marko Lindqvist wrote:
> On 14 January 2013 15:34, Paul Eggleton <paul.eggleton@linux.intel.com
> wrote:
> > There is a meta-games FYI, I think this is possibly where these recipes
> > ought to have gone.
> 
>  They actually are there at the moment. But as I have considered them
> not games specific, they have been marked as something that lives
> there only temporarily until they can be properly introduced to more
> general layers. I guess Andreas has been working on that basis. My bad
> for not checking from generic layers if they would be accepted.
>  So, what's the concensus. Should they be removed from meta-games as
> they are in general layer, or should they be moved from staging area
> of meta-games to official game libraries area?

I would have thought we should consider meta-games to be the canonical place 
for gaming-related recipes.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


