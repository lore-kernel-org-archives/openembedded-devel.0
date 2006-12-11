Received: from [66.111.4.27] (helo=out3.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1GtuAR-0004X0-Hf
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Dec 2006 00:02:39 +0100
Received: from out1.internal (unknown [10.202.2.149])
	by out1.messagingengine.com (Postfix) with ESMTP id C2A7F4DE1F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Dec 2006 18:01:06 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by out1.internal (MEProxy); Mon, 11 Dec 2006 18:01:07 -0500
X-Sasl-enc: OtU3rfgc+EMyaOqQRJLhEQFAz/gaVarhfY7FhhNOy+rT 1165878059
Received: from [192.168.76.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTP id DB4F9149F4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Dec 2006 18:00:58 -0500 (EST)
Message-ID: <457DE327.2050209@whitby.id.au>
Date: Tue, 12 Dec 2006 09:30:55 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.8 (Windows/20061025)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <c384c5ea0612081523k416385a5mf40fc87f9f8a24bc@mail.gmail.com>	<1165789441.5604.39.camel@localhost.localdomain>
	<457D151B.3050405@dominion.kabel.utwente.nl>
In-Reply-To: <457D151B.3050405@dominion.kabel.utwente.nl>
Subject: Re: {PACKAGE,TARGET_{,PACKAGE_,EXTRA_}}ARCH blues
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
X-List-Received-Date: Mon, 11 Dec 2006 23:02:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

>>> Someone familiar with what the ixp builds should be doing should really
>>> look at this. I've cc'd rwhitby who should know the right person to deal
>>> with this.
>>>
>>> This machine might not want PACKAGE_ARCHS containing ${MACHINE} so it
>>> might want to override that...
> 
> I think conf/machine/ixp4xx.conf shouldn't be used, but conf/machine/ixp4xxbe.conf or
> ixp4xxle.conf should be used instead. Each of those machines should set PACKAGE_EXTRA_ARCH
> independantly.

Agreed.

-- Rod


