Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IZwb5-0004bc-Eb
	for openembedded-devel@openembedded.org; Tue, 25 Sep 2007 00:40:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8OMZpbE021533
	for <openembedded-devel@openembedded.org>;
	Mon, 24 Sep 2007 23:35:51 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21377-05 for <openembedded-devel@openembedded.org>;
	Mon, 24 Sep 2007 23:35:47 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8OMZhsK021527
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Mon, 24 Sep 2007 23:35:43 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <46F8280E.9050908@trolltech.com>
References: <46F587F7.4060501@balister.org> <46F80688.2020702@trolltech.com>
	<1190667152.19359.38.camel@localhost.localdomain>
	<46F8280E.9050908@trolltech.com>
Date: Mon, 24 Sep 2007 23:35:42 +0100
Message-Id: <1190673342.19359.107.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: How should OE be used?
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
X-List-Received-Date: Mon, 24 Sep 2007 22:40:11 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-09-25 at 07:11 +1000, Lorn Potter wrote:
> > Playing devil's advocate, take Poky, for example. A person can
> > download/check it out, edit one simple configuration file
> > (comment/uncomment lines), source a file and go :).
>
> This is ok for an individual with a known device, but for a company that 
> needs to produce their own distribution, for a new device, Poky is not a 
> choice.

I didn't make comment about Poky's suitability for anything. 

All I said is that its possible to produce a one stop configuration
process for OE which is as easy as your buildroot example. This proves
that its not some fundamental problem with OE, someone just needs to
implement it.

As for "for a company that needs to produce their own distribution, for
a new device, Poky is not a choice", thats just nonsense and our
experiences suggests otherwise ;-).

> _These_ are the people/companies that the OE/Foundation should also 
> be targeting to grow.

I think all agreed that OE wants to see more of these people/companies
using OE.

Cheers,

Richard




