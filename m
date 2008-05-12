Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rod@whitby.id.au>) id 1JvgJL-0008U0-4X
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 May 2008 00:16:00 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 81E1C109056
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2008 18:14:40 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Mon, 12 May 2008 18:14:40 -0400
X-Sasl-enc: YQ4p8OwTxvCtBDJBJQm0W3sg/wGdQzUHLEu6gsYrejs8 1210630479
Received: from [192.168.15.11] (CPE-121-209-16-132.sa.bigpond.net.au
	[121.209.16.132])
	by mail.messagingengine.com (Postfix) with ESMTPSA id ACAA0321D6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2008 18:14:39 -0400 (EDT)
Message-ID: <4828C13C.1070509@whitby.id.au>
Date: Tue, 13 May 2008 07:44:20 +0930
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.14 (Windows/20080421)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <g049dg$2ks$1@ger.gmane.org>	<c384c5ea0805100820t64c75e41qde797bfb3245b7ed@mail.gmail.com>	<g04ftr$krb$1@ger.gmane.org>	<c384c5ea0805111546g62514fd0r484f57471997c958@mail.gmail.com>	<1210576761.4981.1.camel@dax.rpnet.com>	<c384c5ea0805120625m4176d6eay57e08304d6e76923@mail.gmail.com>
	<g09i5q$vuv$1@ger.gmane.org>
In-Reply-To: <g09i5q$vuv$1@ger.gmane.org>
Subject: Re: RFC: reverse the name change for org.oe.stable
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Mon, 12 May 2008 22:16:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> Leon Woestenberg wrote:
> 
>> That reminds me, we should lock-down (and include) the corresponding
>> bitbake version in the stable tree as well.
> 
> I proposed that a while ago, but it got NAKed, time to propose it again? 
> I see no reason why we shouldn't have a known working bitbake copy 
> inside the stable tree

+1 from me - when nslu2-linux creates a binary release source tarball we 
always include bitbake in the tarball.

-- Rod


