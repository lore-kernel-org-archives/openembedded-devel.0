Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rod@whitby.id.au>) id 1J4NYS-0003Rq-M6
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Dec 2007 22:31:16 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id E90BC7F6F7;
	Mon, 17 Dec 2007 16:26:25 -0500 (EST)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Mon, 17 Dec 2007 16:26:25 -0500
X-Sasl-enc: utBtSYLEa4hHhyoFSncfAe60DSftYEQIWNT2V/R4e7pX 1197926785
Received: from [192.168.18.11] (CPE-121-209-21-249.sa.bigpond.net.au
	[121.209.21.249])
	by mail.messagingengine.com (Postfix) with ESMTP id 8DDB52A878;
	Mon, 17 Dec 2007 16:26:24 -0500 (EST)
Message-ID: <4766E941.3090607@whitby.id.au>
Date: Tue, 18 Dec 2007 07:55:21 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: Paul Sokolovsky <pmiscml@gmail.com>
References: <4765E992.2040805@protium.com>
	<4710722265.20071217130911@gmail.com>
	<47668695.5010701@protium.com> <828321445.20071217170249@gmail.com>
In-Reply-To: <828321445.20071217170249@gmail.com>
X-Enigmail-Version: 0.95.5
Cc: Andy Wilcox <andy@protium.com>, openembedded-devel@lists.openembedded.org
Subject: Re: RFC: Renaming uboot-utils
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
X-List-Received-Date: Mon, 17 Dec 2007 21:31:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Paul Sokolovsky wrote:
> Monday, December 17, 2007, 4:24:21 PM, you wrote:
>> Perhaps the MACHINE|DISTRO_FEATURES uboot should just
>> go away?  It was only needed to make the native mkimage program,
>> which really should be a kernel DEPENDS anyway.  Sound
>> reasonable?
> 
>   Let's hear Rod Whitby speak up, AFAIR, he added those features. But
> as far as I understand, no, they should be there, and are the way to
> add a particular bootloader support to *any* distro. Have a look at
> apex and redboot support at the same place. So, if you say that your
> machine has u-boot as bootloader, you'll get utils to manage it in the
> image. Ditto for other bootloaders.

Actually, I think NAiL added the uboot machine feature.  I only looked
at the uboot and redboot ones that were already there and added apex.


-- Rod


