Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rod@whitby.id.au>) id 1J5TGm-0007Rf-Iq
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Dec 2007 22:49:32 +0100
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by out1.messagingengine.com (Postfix) with ESMTP id 0BBB580C3B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Dec 2007 16:44:24 -0500 (EST)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute2.internal (MEProxy); Thu, 20 Dec 2007 16:44:24 -0500
X-Sasl-enc: TL9P9UHSgtq7egR5due2IcFzlC2FV4N62P7q9k2FI0l1 1198187063
Received: from [192.168.18.11] (CPE-121-209-21-249.sa.bigpond.net.au
	[121.209.21.249])
	by mail.messagingengine.com (Postfix) with ESMTP id 4845DBF88
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Dec 2007 16:44:22 -0500 (EST)
Message-ID: <476AE1F0.400@whitby.id.au>
Date: Fri, 21 Dec 2007 08:13:12 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1J5L4z-0004um-WD@linuxtogo.org>	<200712201540.11149.openembedded@haerwu.biz>
	<571189143.20071220182116@gmail.com>
In-Reply-To: <571189143.20071220182116@gmail.com>
Subject: Re: [oe-commits] org.oe.dev distro/openwrt-sdk.conf: Distro config to build packages for OpenWRT.
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
X-List-Received-Date: Thu, 20 Dec 2007 21:49:32 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit

Paul Sokolovsky wrote:
> Hello Marcin,
> Thursday, December 20, 2007, 4:40:09 PM, you wrote:
>> MACHINE=wrt54 + DISTRO=wrt54oe builds toolchain which builds packages 
>> usable under OpenWRT. At least it worked like that when I tested it over
>> year ago.
> 
>   Year, a year ago, that's the key. I'll have an RFC to deprecate wrt54oe,
> asusoe and some other stuff possibly lurking there in favor of openwrt-sdk.conf,
> once I'll prepare argument list for it (and the first one will be that its
> name corresponds to what it does).

I think I contributed at least one of those distro.conf's and it's a

+1

from me on replacing them with a generic openwrt-sdk.conf

-- Rod


