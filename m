Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1H9bp3-0000IM-M8
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Jan 2007 07:41:29 +0100
Received: from out1.internal (unknown [10.202.2.149])
	by out1.messagingengine.com (Postfix) with ESMTP id 0870A944E1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jan 2007 01:41:29 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by out1.internal (MEProxy); Wed, 24 Jan 2007 01:41:29 -0500
X-Sasl-enc: /Sr1Yb7V21HgbSc+0HEuD8oEh6Di4MCPXkloldFS32vk 1169620888
Received: from [192.168.76.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTP id 463AE292FB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jan 2007 01:41:27 -0500 (EST)
Message-ID: <45B6FF94.8050500@whitby.id.au>
Date: Wed, 24 Jan 2007 17:11:24 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.9 (Windows/20061207)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <45B40165.6000506@whitby.id.au>	<45B4EDCD.1060609@dominion.kabel.utwente.nl>	<45B50D16.8060001@whitby.id.au>	<45B518A5.8000500@dominion.kabel.utwente.nl>	<45B5528F.3050108@whitby.id.au>	<1169550792.5845.8.camel@localhost.localdomain>	<45B663F8.5030901@whitby.id.au>
	<1169584472.5845.40.camel@localhost.localdomain>
In-Reply-To: <1169584472.5845.40.camel@localhost.localdomain>
Subject: SITEINFO_ENDIAN(N)ESS (NN, not N)
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
X-List-Received-Date: Wed, 24 Jan 2007 06:41:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> On Wed, 2007-01-24 at 06:07 +1030, Rod Whitby wrote:
>> Are you referring to the existing SITEINFO_ENDIANESS (sic) variable
>> (which I only just found ...) ?
> 
> Yes.

Shouldn't it be spelled SITEINFO_ENDIANNESS? (i.e. double N)

(Both Google and Wikipedia say that it is endianness, not endianess)

Anyone object to me changing the 4 places it's currently used, before I
use it in 73 new places?

-- Rod


