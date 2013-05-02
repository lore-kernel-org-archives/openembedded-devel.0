Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UXxS2-0003Ls-8K
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 May 2013 19:37:53 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 May 2013 10:19:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,597,1363158000"; d="scan'208";a="306961868"
Received: from unknown (HELO helios.localnet) ([10.255.12.165])
	by orsmga001.jf.intel.com with ESMTP; 02 May 2013 10:19:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 02 May 2013 18:19:36 +0100
Message-ID: <2994927.FiIU9RB3WG@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-19-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <CANyK_8coP2QSOX=QiiFNbG53NMtk18h6ZyPwLH9jEPqHrmPu5A@mail.gmail.com>
References: <20121213174202.GE3356@jama.jama.net> <1838142.bVj6QfWozi@helios>
	<CANyK_8coP2QSOX=QiiFNbG53NMtk18h6ZyPwLH9jEPqHrmPu5A@mail.gmail.com>
MIME-Version: 1.0
Cc: Trevor Woerner <twoerner@gmail.com>
Subject: Re: [OE-core] State of bitbake world
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
X-List-Received-Date: Thu, 02 May 2013 17:37:58 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 02 May 2013 18:08:44 Paul Barker wrote:
> Do you mean to move vlc to meta-multimedia so it's with fluidsynth? Or
> do you mean move fluidsynth to meta-oe?

Sorry, that's what I meant, yes. Not my day today apparently...
 
> I think VLC wants a bigger overhaul anyway along with updating to
> version 2.*. It has a lot of optional dependencies of which an
> arbitrary subset seem to be enabled by default in OE. I'd like to see
> the default be very minimal and have PACKAGECONFIG options to control
> the rest. I'd like to take a look at it but unsure how soon I'll find
> time to.

That sounds good, but that could easily be done later.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


