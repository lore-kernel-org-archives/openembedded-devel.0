Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Tukwc-0008CI-Jb
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Jan 2013 15:23:23 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Jan 2013 06:08:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,468,1355126400"; d="scan'208";a="246371524"
Received: from unknown (HELO helios.localnet) ([10.252.123.116])
	by orsmga001.jf.intel.com with ESMTP; 14 Jan 2013 06:07:48 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Samuel Stirtzel <s.stirtzel@googlemail.com>
Date: Mon, 14 Jan 2013 14:07:47 +0000
Message-ID: <6236824.Q6WdyF9iIO@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-21-generic; KDE/4.9.3; i686; ; )
In-Reply-To: <CAGiJk9fbMO7T0FDp--XRraQy6A7y=bmY4U7xNjpA8GiEYDQ1cw@mail.gmail.com>
References: <1357693239-13210-1-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0LZVhAeEKW8vUA4=r1poz80p+w9jTOCDOJHK8tfn52PyXw@mail.gmail.com>
	<CAGiJk9fbMO7T0FDp--XRraQy6A7y=bmY4U7xNjpA8GiEYDQ1cw@mail.gmail.com>
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
X-List-Received-Date: Mon, 14 Jan 2013 14:23:23 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 14 January 2013 14:50:29 Samuel Stirtzel wrote:
> 2013/1/14 Burton, Ross <ross.burton@intel.com>:
> > On 14 January 2013 13:34, Paul Eggleton <paul.eggleton@linux.intel.com> 
wrote:
> >> There is a meta-games FYI, I think this is possibly where these recipes
> >> ought to have gone.
> > 
> > Agreed, these are gaming-specific and not generically "multimedia".
> 
> Is this a suggestion that other similar recipes already in meta-oe and
> oe-core should be moved there as well?
> To be specific SDL comes to my mind...

Whilst SDL is mostly intended for games I know of at least one product using 
it to provide a standard UI, so it may be a special case.

To answer the general question though, yes there is the intention that some of 
the recipes in the meta-oe layer should move out to more specific layers where 
appropriate; it's just that nobody has got around to doing that yet.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


