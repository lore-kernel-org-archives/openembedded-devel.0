Received: from [206.46.173.17] (helo=vms173017pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Mdyem-0003sl-9e
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 05:49:45 +0200
Received: from gandalf.denix.org ([71.255.235.240]) by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KON000DFOH95IU0@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	19 Aug 2009 22:32:03 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 21D9814AF5F; Wed,
	19 Aug 2009 23:31:57 -0400 (EDT)
Date: Wed, 19 Aug 2009 23:31:57 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090820033157.GB32010@denix.org>
References: <4A8C1EB7.4050500@atmel.com>
MIME-version: 1.0
In-reply-to: <4A8C1EB7.4050500@atmel.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: fbv neutered
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
X-List-Received-Date: Thu, 20 Aug 2009 03:49:46 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Aug 19, 2009 at 05:48:07PM +0200, Ulf Samuelsson wrote:
> I added "fbv" "frame buffer viewer" to the file system,
> and happily tried to watch my Mustang rental car.
> 
> -- fbv did not recognize the file format.
> 
> Generated a nice bmp file and tried this...
> 
> --  fbv did not recognize the file format.
> 
> I then checked the recipe:
> 
> 
> ---------------------------------
> 	CC="${CC}" ./configure --without-libungif --without-bmp \
> 		--without-libjpeg
> ---------------------------------
> 
> Beats me why someone would want to have it built this way.
> 
> Is there another application one should use?

Try fbida - worked for me just fine

-- 
Denys


