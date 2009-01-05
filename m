Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1LJogv-00073Z-Eh
	for openembedded-devel@openembedded.org; Mon, 05 Jan 2009 13:36:21 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n05CUQeb020318
	for <openembedded-devel@openembedded.org>; Mon, 5 Jan 2009 12:30:26 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19795-08 for <openembedded-devel@openembedded.org>;
	Mon,  5 Jan 2009 12:30:22 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n05CUH8U020312
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Mon, 5 Jan 2009 12:30:17 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200901042339.31569.mickey@vanille-media.de>
References: <200901041647.42516.mickey@vanille-media.de>
	<4961343F.1000707@balister.org>
	<200901042339.31569.mickey@vanille-media.de>
Date: Mon, 05 Jan 2009 12:30:45 +0000
Message-Id: <1231158645.5327.31.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: OE dev meeting
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
X-List-Received-Date: Mon, 05 Jan 2009 12:36:21 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Sun, 2009-01-04 at 23:39 +0100, Michael 'Mickey' Lauer wrote:
> Am Sunday 04 January 2009 23:12:15 schrieb Philip Balister:
> > How long would this meeting last? Before would be better for me. I need
> > to work this out ASAP so I can buy a plane ticket.
> 
> One day would be fine. There's a number of issues that need some consensus 
> before we can move forward. Things that come to mind include:

Agreed, one day would be fine. The question is who could be there?

Koen - most likely not
Mickey - quite likely?
Crofton - quite likely?
RP - if we're going to meet I will aim to be there
Marcin - ?
Zecke - ?
XorA - ?
pb_ - ?

> * The future of BitBake -- where to continue to develop it, in which style, 
> and which features to concentrate on.

My view on this is:

 * Switch SCM to git
 * Keep as a separate project
 * Develop and accept features as people have need for them
 * 1.8 continues as "stable"
 * Trunk is the next gen branch with client/server split with UI 
   capability.
 * Trunk replaces 1.8 when people feel its ready/usable.

> * Splitting the recipe tree.
> 
> * Evaluating our feedback of the first months w/ git.
> 
> * Streamlining Poky merges.
> 
> * OE and the distro situation
> 
> * Documentation, Website, and Hosting.
> 
> IIRC Richard had some additional points. RP?

Most of it fits into the above categories. I also wanted to talk to
people and find out what people are now all doing, which directions
people are moving in (and its implications for OE) and also perhaps try
and convey the direction Poky is going. I've lost touch with what some
people are doing a bit and the reverse is also problem true and probably
others are in a similar position?

Perhaps the alternative is to try and have a meeting on IRC where at
least as many of the above people are available online without other
commitments? We could probably get through things fairly quickly?

Cheers,

Richard



-- 
Richard Purdie
Intel Open Source Technology Centre



