Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1H5VUz-0004zi-H1
	for openembedded-devel@openembedded.org; Sat, 13 Jan 2007 00:07:49 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l0CN5aJC010024;
	Fri, 12 Jan 2007 23:05:36 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09801-07; Fri, 12 Jan 2007 23:05:33 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l0CN5VTb010010
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Fri, 12 Jan 2007 23:05:32 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org, familiar@handhelds.org
In-Reply-To: <1589219206.20070112213137@gmail.com>
References: <20070111203010.GB336@mage.jpl.nasa.gov>
	<45A6A0C2.2080400@dominion.kabel.utwente.nl>
	<20070111214849.GD336@mage.jpl.nasa.gov>
	<f383264b0701121058n43be78dbu15871cb892681801@mail.gmail.com>
	<1589219206.20070112213137@gmail.com>
Date: Fri, 12 Jan 2007 23:05:33 +0000
Message-Id: <1168643133.5861.35.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [Familiar] Re: [announce] new tagged version of ipkg
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Jan 2007 23:07:49 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2007-01-12 at 21:31 +0200, Paul Sokolovsky wrote:
> > * Converted from storing metadata in flat files to storing it in an sqlite db
> 
> > Of course, a bit of work might be needed to actually make that a true
> > statement. ;-)
> 
>   I really have an itch for that myself, I just wonder if less steep
> start can be made here, like to add separate simple hash-based index for
> Packages file, so it was quick to look up package by name. Of course,
> if that could help depends on ipkg code, and I didn't yet have chance
> to peek at...

I've wondered about this too. I'd like to see it but its a lot of work
and it will turn into an ipkg fork as the original ipkg was supposed to
stay true to Debian.

Regards,

Richard



