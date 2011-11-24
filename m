Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RTXob-0007Te-5z
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 12:50:05 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Nov 2011 03:43:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="79518646"
Received: from unknown (HELO helios.localnet) ([10.252.121.190])
	by orsmga001.jf.intel.com with ESMTP; 24 Nov 2011 03:43:30 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Paul Menzel <paulepanter@users.sourceforge.net>
Date: Thu, 24 Nov 2011 11:43:28 +0000
Message-ID: <1341768.l3QXe5jHAh@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-13-generic-pae; KDE/4.7.3; i686; ; )
In-Reply-To: <1322134409.3391.21.camel@mattotaupa>
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se>
	<CAP9ODKrviqf=GN12Y6OKE0ajsG7v+fFWnWDHp=K1-YFzvQi-pA@mail.gmail.com>
	<1322134409.3391.21.camel@mattotaupa>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Plans for OE classic future
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
X-List-Received-Date: Thu, 24 Nov 2011 11:50:08 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 24 November 2011 12:33:29 Paul Menzel wrote:
> You seem to use OE-core and meta-oe already so I understand your point
> of view. Martin, Koen, Andreas and you are doing the major work for
> meta-oe and not a lot of other people contribute.
> 
> In my opinion it is a bad sign to force people to switch. OE-core and
> meta-oe should be so appealing that they switch by themselves. My
> impression from reading the list and from IRC is that a lot of people
> still have objections and are not totally comfortable. Good community
> management would be to listen to these people then try to find solutions
> and implement them. People then should come by themselves.

Let's not get carried away. In the current discussion it seems the main 
objection to switching from several people is that they are in the middle or 
close to the end of their development cycle on products that depend on OE-
classic; it's totally understandable that those people can't switch at this 
time. I'm not entirely convinced those people can't use the 2011.3 maintenance 
branch for those purposes however.

As regards to things missing or improvements needed in the new OE-core based 
structure, those things will only get better when people who are able to do so 
commit to moving across. You can't expect a restructuring of the thousands of 
recipes to come fully formed from a small number of developers - please, we 
need your help. If more people get involved it's only a small amount of work 
for lots of people as opposed to a large amount of work for very few.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


