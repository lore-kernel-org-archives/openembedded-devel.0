Received: from mail.fh-wedel.de ([213.39.232.198])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <di@fh-wedel.de>) id 1UDGld-0003kA-Gm
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Mar 2013 17:00:35 +0100
Received: by mail.fh-wedel.de (Postfix, from userid 959)
	id B22EC5413C; Wed,  6 Mar 2013 16:44:02 +0100 (CET)
Date: Wed, 6 Mar 2013 16:44:02 +0100
From: Martin Dietze <di@fh-wedel.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130306154402.GP7496@fh-wedel.de>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <20130302174624.GH21221@fh-wedel.de> <6717637.hIAbfv92vg@helios>
MIME-Version: 1.0
In-Reply-To: <6717637.hIAbfv92vg@helios>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: Nylon liveth (but on in OE?)
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
X-List-Received-Date: Wed, 06 Mar 2013 16:00:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, March 05, 2013, Paul Eggleton wrote:

> I don't have a personal interest in this particular distro/hardare, but if the 
> fork you have made is working then I can't see a compelling reason not to host 
> a branch for it in the OE-Classic repository; at least that keeps things more 
> or less in one place.

I have for now created a personal branch `mdietze/nylon' for my
changes. 

> However, is there any chance you'd be able to look at moving up to be based on 
> top of OE-Core which is where OE is at currently? Obviously toolchain and 
> kernel would be the first hurdles. For bringing any needed metadata up-to-date 
> though the community can provide help where needed.

The last time I managed to create a buildable and working
Nylon firmware image based on an up-to-date OE.dev was in
April 2009. After that my build broke practically every other
week as my distro's dependencies and particularities were just
too far beyond scope for practically everybody else.

Since do not have enough (spare) time I can invest in this,
forking seemed the only reasonable way. As long as nobody ports
the system based on 2.6 kernel from OpenWRT to Nylon on OE, I
don't really see any benefit from keeping the build alive by
permanently adapting things to recent changes in OE (also 2.4
kernel based distros are obsoleted in OE anyway).  

Things may look different if people actively using Nylon on
AccessCubes or Meshcubes want to join in :)

Cheers,

M'bert

-- 
----------- / http://herbert.the-little-red-haired-girl.org / -------------
=+= 
My name is spelled Luxury Yacht but it's pronounced Throatwabbler Mangrove.


