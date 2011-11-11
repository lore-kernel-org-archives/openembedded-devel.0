Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1ROqwE-0008A9-Is
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Nov 2011 14:14:34 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Nov 2011 05:08:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="74084252"
Received: from unknown (HELO helios.localnet) ([10.252.121.97])
	by orsmga001.jf.intel.com with ESMTP; 11 Nov 2011 05:08:05 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Nov 2011 13:08:04 +0000
Message-ID: <2190543.WLJntyeND4@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.2 (Linux/3.0.0-12-generic-pae; KDE/4.7.2; i686; ; )
In-Reply-To: <1321016548.29435.1.camel@phil-desktop>
References: <4EBBE67F.20300@freyther.de> <4EBD1AEF.1080905@freyther.de>
	<1321016548.29435.1.camel@phil-desktop>
MIME-Version: 1.0
Subject: Re: RFC Creation of a meta-telephony repository
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
X-List-Received-Date: Fri, 11 Nov 2011 13:14:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 11 November 2011 13:02:27 Phil Blundell wrote:
> On Fri, 2011-11-11 at 13:54 +0100, Holger Freyther wrote:
> > all fine, one question not answered though. How does someone that wants
> > to add asterisk to his image find my layer? Is there a layer/repository
> > registry? do we need one?
> 
> Paul Eggleton made a fine wiki page for that very purpose:
> http://wiki.openembedded.org/wiki/LayerIndex

I hope one day this can be replaced with something backed by a database; 
preferably with the ability to search at least by recipe name (with regular 
updates from the metadata in git, of course). Until someone has time to write 
that though this will have to suffice.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


