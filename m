Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1H9RSW-0004h3-1y
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Jan 2007 20:37:32 +0100
Received: from out1.internal (unknown [10.202.2.149])
	by out1.messagingengine.com (Postfix) with ESMTP id 7DBD9946B8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jan 2007 14:37:31 -0500 (EST)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by out1.internal (MEProxy); Tue, 23 Jan 2007 14:37:31 -0500
X-Sasl-enc: tAYs0hYMIFYfXZ0YGrcO2Gx6WARShLvId5UZpFuEveAX 1169581051
Received: from [192.168.0.11] (CPE-58-160-130-105.sa.bigpond.net.au
	[58.160.130.105])
	by mail.messagingengine.com (Postfix) with ESMTP id C666710F0B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jan 2007 14:37:30 -0500 (EST)
Message-ID: <45B663F8.5030901@whitby.id.au>
Date: Wed, 24 Jan 2007 06:07:28 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.9 (Windows/20061207)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <45B40165.6000506@whitby.id.au>	<45B4EDCD.1060609@dominion.kabel.utwente.nl>	<45B50D16.8060001@whitby.id.au>	<45B518A5.8000500@dominion.kabel.utwente.nl>	<45B5528F.3050108@whitby.id.au>
	<1169550792.5845.8.camel@localhost.localdomain>
In-Reply-To: <1169550792.5845.8.camel@localhost.localdomain>
Subject: Re: Deprecating ixp4xx, nslu2 in favour of endian-specific	machine settings (Was: RFC on	MACHINE_ENDIAN)
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
X-List-Received-Date: Tue, 23 Jan 2007 19:37:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> On Tue, 2007-01-23 at 10:40 +1030, Rod Whitby wrote:
>> Last chance for objections .... commits will start in 6 hours.
> 
> For the record, no objections from me. After consideration, I think Koen
> is right and two machines make sense in this case. Koen has had the
> experience of trying this in practise which often helps! :)
> 
> Where possible I would like to see it using the siteinfo check so the
> metadata is generic.

Are you referring to the existing SITEINFO_ENDIANESS (sic) variable
(which I only just found ...) ?

Sure, if that is a guaranteed supported variable I can easily use that
one instead throughout.

-- Rod


