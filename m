Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rod@whitby.id.au>) id 1HwSZ4-000414-LW
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jun 2007 02:43:01 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by imap10.messagingengine.com (Postfix) with ESMTP id CD9084434
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jun 2007 20:40:24 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Thu, 07 Jun 2007 20:40:24 -0400
X-Sasl-enc: RKiqXLAaNVCbR5B8kmyzzeKkhz2rYDS+eNSl/Rxb94iU 1181263223
Received: from [127.0.0.1] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTP id 992D01ADDE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jun 2007 20:40:23 -0400 (EDT)
Message-ID: <4668A4F1.8010800@whitby.id.au>
Date: Fri, 08 Jun 2007 10:08:09 +0930
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.12 (Windows/20070509)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <B5ACE11E-74AF-468C-AF96-832AD1FBDBD5@selfish.org>
In-Reply-To: <B5ACE11E-74AF-468C-AF96-832AD1FBDBD5@selfish.org>
Subject: Re: [RFC] Creating an OpenEmbedded founation
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
X-List-Received-Date: Fri, 08 Jun 2007 00:43:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I'm going to give information about how the NSLU2-Linux project handles
some (but not all) of these issues ... I'm not trying to tell OE what to
do, just giving input that might be relevant to OE's decision.

Holger Freyther wrote:
> As we grow we have more needs, like I already said. This includes  
> bigger assets like servers to host our infrastructure, sending koen  
> to conferences, buying development boards one doesn't get donated.

NSLU2-Linux receives donations on a couple of paypal accounts (one for
donations from paypal balance, one for donations from paypal credit
card).  We have no other convenient way of receiving donations, but I
presume we could set up other means of receipt if necessary.  We've
raised over USD$10K in the last 2.5 years.

I handle the cash in the paypal account, and the core team makes
decisions on how to spend it.  We record the donations and the decisions
on a edit-password-protected wiki page so the community can see what's
happening with the cash:

<http://www.nslu2-linux.org/wiki/Info/DonationList>

We also provide pictures of the hardware we buy:

<http://www.nslu2-linux.org/gallery/>

The decision on how to spend the donations is up to the core team (and
eventually up to me, since I own the paypal accounts).  The community
needs to trust the core team to not abscond with the money.  We make the
spending of the money as transparent as possible on those wiki pages and
announcements to ensure that the community has a reason to trust us.

We buy server infrastructure (we have two server class machines hosted
at OSUOSL, and some more hosted in a small company in Santa Barbara,
California), and we spend money on appearances at trade exhibitions (we
have had booths at SCALE and LinuxWorld Expo).  We haven't sent anyone
to a conference yet.

We buy consumer devices and send them out to bona fide key developers
(e.g. we sent one each to kergoth and koen).  We also buy test devices
that the development team uses.

> If we would lose a device because I turn sane this would be easily  
> recoverable, but what would happen if I withdraw one or two servers,  
> keep the money that was meant to cover koen's travel to the moon.  

We paypal the money to the person doing the buying of equipment or
tickets up front :-)

> This would be disrupting the OpenEmbedded project internally and  
> externally. We have offers for servers, offers for donations so this  
> issue is nothing hypothetical but a real one. I would go so far as  
> declaring it as a pressing need.
> 
> So what shouldn't a foundation do?
> 	-Make things more complicated
> 	-Doing business as this is where companies are good at. We mean it!
> 	-Hold the Copyright of our metadata (it is MIT licensed for a reason).
> 
> So what should a foundation do?
> 	-Help OpenEmbedded to grow

Not sure how this helps, but it can't hurt.

> 	-Own the projects assets. This would include server equipment,  
> devices, hopefully domain-names, etc.

We host our main server at OSUOSL, so I guess they would arbitrate
access if there was a conflict of ownership claims.

> 	-Receive donations so we can buy a one-way ticket for koen to the  
> moon, or other places were OE exposure is quite low.

Anyone you trust can do that.

> 	-Maintain relationship with Companies

There is a group called NDNDG who comes out of the Linkstation wiki
folks who is doing this for NAS devices.  They've actually formed a
company and the developers are "employees" - this allows the company to
sign NDAs.

-- Rod Whitby
-- NSLU2-Linux Project Lead


