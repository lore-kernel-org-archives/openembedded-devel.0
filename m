Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JKYXG-000557-KF
	for openembedded-devel@openembedded.org; Thu, 31 Jan 2008 13:28:54 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m0VCT2Px003257
	for <openembedded-devel@openembedded.org>; Thu, 31 Jan 2008 12:29:02 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02820-10 for <openembedded-devel@openembedded.org>;
	Thu, 31 Jan 2008 12:28:58 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m0VCSrGt003240
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Thu, 31 Jan 2008 12:28:53 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <fnsa6j$gt9$1@ger.gmane.org>
References: <fnqakr$ffa$1@ger.gmane.org>
	<20080130203832.31fd5919@widy.localdomain>	<fnqqtt$e5o$1@ger.gmane.org>
	<20080131015606.481c0eb7@widy.localdomain>	<fns5k4$ti$1@ger.gmane.org>
	<20080131130015.6770440b@widy.localdomain> <fnsa6j$gt9$1@ger.gmane.org>
Date: Thu, 31 Jan 2008 12:28:52 +0000
Message-Id: <1201782532.4996.36.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: RFC: aggressive usurpation of bugs.oe.net by Angstrom
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
X-List-Received-Date: Thu, 31 Jan 2008 12:28:55 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Paul/Rolf,

I've mostly read this thread and I have a few comments to make as an
observer:

a) it is good to see Rolf working on OE again

b) Angstrom is not the only distro OE supports and never will be. It was
started as a means to merge several very similar distributions and focus
various developer's efforts. It was also an opportunity to try and show
how a distro should work since lots of people didn't understand the
things a distro should control.

It therefore serves as a kind of role model in OE but that doesn't mean
it will always serve that role or that its preferred over everything
else. Angstrom needs to keep in mind that at least in theory if it drops
the ball, OE could choose a different "role model" ;-). Other distros
are welcome in OE and are welcome to use the bugzilla since a lot of bug
reports have implications outside a given distribution.

c) Rolf is perfectly right to ask if there is a better way to handle
this. "Can we do X better?" is always a good valid question. 

d) Saying OE should only have one distro is not a way to solve the
problem.

e) If nobody has useful for suggestions for improving things, lets wait
for Rolf to propose any better ways for handling things. We can then
discuss those improvements based on technical merit, not character
assassination.

Cheers,

Richard



