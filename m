Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Si3xv-0003A9-2F
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jun 2012 15:31:59 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 Jun 2012 06:21:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="159568559"
Received: from unknown (HELO helios.localnet) ([10.252.120.123])
	by azsmga001.ch.intel.com with ESMTP; 22 Jun 2012 06:20:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Jun 2012 14:20:58 +0100
Message-ID: <3397699.t0tBfMlFki@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.3 (Linux/3.2.0-25-generic-pae; KDE/4.8.3; i686; ; )
In-Reply-To: <CAKbR+sz=HCDU8uPx00rF1G4KXo87CXuk29uVO3rNxR_i5A4qkQ@mail.gmail.com>
References: <CAKbR+sx-4vD69rHekVvwbDeVT5=0-Ouk0AmS6G_3JzZg_Hqa-A@mail.gmail.com>
	<CAMKF1soiguyAXwmYo9LhHPnmQkbW7KTipDTEYXpazOFKn+dYLA@mail.gmail.com>
	<CAKbR+sz=HCDU8uPx00rF1G4KXo87CXuk29uVO3rNxR_i5A4qkQ@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: oe-made-easy and Getting Started
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
X-List-Received-Date: Fri, 22 Jun 2012 13:31:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 12 May 2012 13:58:57 Lloyd Chang wrote:
> Thanks! Done adding 'One-liner via oe-made-easy' to our OE wiki.
> 
> On Wed, May 9, 2012 at 10:03 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Wed, May 9, 2012 at 2:02 PM, Lloyd Chang <lloydchang@gmail.com> wrote:
> > > Hello fellow openembedded-devel members!
> > > 
> > > 
> > > I'm sharing because you may find this useful -- especially newcomers
> > > to our OE-Core.  In my personal efforts in condensing our Getting
> > > 
> > > Started documentation succinctly, I codified it into one line:
> > >    git clone git://github.com/lloydchang/oe-made-easy.git;
> > > 
> > > ./oe-made-easy/core-image-minimal
> > > 
> > > 
> > > User interface design wise, my intent of this one liner is to allow
> > > everyone getting started to easily bootstrap core-image-minimal onto
> > > various computers (before diving into details).  If our community
> > > consensus finds oe-made-easy useful, please let me know and I'll start
> > > updating our openembedded.org wiki pages to reference this one liner
> > > or equivalent.
> > > 
> > > 
> > > And if you personally find oe-made-easy useful, feel free to test it
> > > further, fork it and/or send me pull requests via
> > > https://github.com/lloydchang/oe-made-easy
> > > 
> > > (for now, oe-made-easy is defaulting to qemux86_64, qemux86 and qemuarm
> > 
> > targets)
> > 
> > > Your feedback is greatly appreciated!
> > 
> > you can add this to OE wiki in some form.

Sorry I didn't reply to this earlier. Clearly our docs still need improvement 
here, but I'm not sure I feel comfortable with having this script right up-
front in our getting started documentation as it is now, particularly as it's 
not part of OE-Core itself. There is a canonical method for getting started, 
it's a simple set of steps anyone should be able to follow; various frontend 
scripts around but I don't think they really belong in the OE instructions in 
this manner unless they're actually part of OE-Core.

Cheers,
Paul


-- 

Paul Eggleton
Intel Open Source Technology Centre


