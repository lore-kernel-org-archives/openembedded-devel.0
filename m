Received: from [66.111.4.29] (helo=out5.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1HTTCJ-0006Qn-Gt
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Mar 2007 02:31:35 +0100
Received: from out1.internal (unknown [10.202.2.149])
	by out1.messagingengine.com (Postfix) with ESMTP id 137E1207DB6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2007 21:31:33 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by out1.internal (MEProxy); Mon, 19 Mar 2007 21:31:33 -0400
X-Sasl-enc: Calb98Q8AYoANRd8f0v90F8e1BEaC/t10BgBMLiuYQeJ 1174354294
Received: from [127.0.0.1] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTP id 640CE23150
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2007 21:31:34 -0400 (EDT)
Message-ID: <45FF3942.5040900@whitby.id.au>
Date: Tue, 20 Mar 2007 12:00:42 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.10 (Windows/20070221)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <74d0deb30701310740p73af77a7j25a8b4597345903a@mail.gmail.com>	<1174346093.5824.89.camel@localhost.localdomain>	<45FF29BF.1040008@whitby.id.au>
	<74BCF2CF-3650-4464-9E51-CA853E3DCDFA@gmx.net>
In-Reply-To: <74BCF2CF-3650-4464-9E51-CA853E3DCDFA@gmx.net>
Subject: Re: [PATCH] Epoch support for bitbake
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
X-List-Received-Date: Tue, 20 Mar 2007 01:31:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Holger Freyther wrote:
> Am 20.03.2007 um 01:24 schrieb Rod Whitby:
>> Richard Purdie wrote:
>>> Thanks for this, I just checked it in unchanged to bitbake trunk
>>> (1.9.x). If people test it and are happy, I'm happy for it to be
>>> backported for 1.8.2 too, at which point OE.dev can maybe start to  
>>> rely
>>> upon it.
>> Dunno whether this is important or not, but OpenMoko (which is now  
>> using svn overlaying OE .dev, not a frozen OE version) uses bitbake 1.6.x  
>> with custom svnnow patches.
> I assume that henryk will port his work to bitbake trunk/1.8 and it  
> is highly likely (actually pretty obvious) that we will accept the  
> patch. And at this point it is a potential backporting candidate for  
> 1.8.2.

So does that mean that changing OE.dev to _rely_ on epoch support should
be held off until that happens?

-- Rod


