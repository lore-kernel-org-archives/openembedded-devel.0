Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QgeRY-0001my-Hf
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jul 2011 17:00:13 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Jul 2011 07:56:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,521,1304319600"; d="scan'208";a="26764748"
Received: from unknown (HELO helios.localnet) ([10.255.17.183])
	by orsmga001.jf.intel.com with ESMTP; 12 Jul 2011 07:56:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chris Verges <kg4ysn@gmail.com>
Date: Tue, 12 Jul 2011 15:56:12 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <0564089300001e7d@nedap.com>
	<201107121518.51033.paul.eggleton@linux.intel.com>
	<20110712143101.GA2392@cverges-dev-lnx>
In-Reply-To: <20110712143101.GA2392@cverges-dev-lnx>
MIME-Version: 1.0
Message-Id: <201107121556.12195.paul.eggleton@linux.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: bbappend
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
X-List-Received-Date: Tue, 12 Jul 2011 15:00:14 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 12 July 2011 15:31:01 you wrote:
> On Tue, Jul 12, 2011 at 03:18:50PM +0100, Paul Eggleton wrote:
> > Possibly, however as a general suggestion I would recommend moving
> > things over to being based on oe-core if at all possible. I realise
> > this is not going to be practical for everyone in the short term,
> > however OE classic will stop being maintained at some point in the
> > near future, so the sooner you move the better - plus you get to take
> > advantage of the additional features and cleanups in oe-core as well.
> 
> I'd love to.  My most recent project is just starting out, so it's a
> good time to make the switch.  Are there any good references for
> performing a migration?

We're rather lacking in oe-core specific documentation right now; however, you 
should be able to just grab oe-core and get started with it fairly easily:

 https://wiki.yoctoproject.org/wiki/OpenEmbedded-Core

If you have any questions feel free to post them on the oe-core list:

 http://lists.linuxtogo.org/mailman/listinfo/openembedded-core

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


