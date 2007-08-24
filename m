Received: from [66.111.4.26] (helo=out2.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rod@whitby.id.au>) id 1IOMiy-0004Gu-3Z
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Aug 2007 02:08:28 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by out1.messagingengine.com (Postfix) with ESMTP id 5A22023361
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2007 20:07:14 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute2.internal (MEProxy); Thu, 23 Aug 2007 20:07:14 -0400
X-Sasl-enc: 1H9dMHKlQo8UPYo6kw2ESOcUs1yDL3vQvZyPXO3893Rg 1187914033
Received: from [192.168.76.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTP id 82A681C001
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2007 20:07:13 -0400 (EDT)
Message-ID: <46CE214D.90701@whitby.id.au>
Date: Fri, 24 Aug 2007 09:37:41 +0930
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.6 (Windows/20070728)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1ef816af0708221151m5c3c2b4ds9b90fdbddc56d8d1@mail.gmail.com>	<19c1b8a90708221646p6cfd0e6do6574668bbe15d775@mail.gmail.com>	<1ef816af0708230241s62454f78oa0147b10cae53ce6@mail.gmail.com>	<46CD69E3.707@whitby.id.au>
	<1ef816af0708231143v70b227daga19b961d23cc5bdc@mail.gmail.com>
In-Reply-To: <1ef816af0708231143v70b227daga19b961d23cc5bdc@mail.gmail.com>
Subject: Re: binutils-cross_2.17.50.0.5.bb failed
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
X-List-Received-Date: Fri, 24 Aug 2007 00:08:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

yakov.zaytsev@gmail.com wrote:
> I've tried to rebuild inside
> /Volumes/OE/stuff/build/tmp/work/armv5te-angstrom-linux-gnueabi/binutils-
> cross-2.17.50.0.5-r1/binutils-2.17.50.0.5
> 
> with this error
> 
> make: *** No rule to make target `rebuild-package-binutils-cross'.  Stop.

Yes, my advice on that matter was completely incorrect for your
circumstances.  I thought I was replying to a different thread on a
different mailing list.

My apologies.  Please use the command Koen gave you instead.

-- Rod


