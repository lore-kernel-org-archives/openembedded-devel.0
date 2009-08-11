Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MagfG-0006de-N3
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Aug 2009 04:00:38 +0200
Received: from gandalf.denix.org ([71.255.235.240]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KO600BICVHA0WN3@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	10 Aug 2009 20:44:04 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 22FAC14AF5F; Mon,
	10 Aug 2009 21:43:58 -0400 (EDT)
Date: Mon, 10 Aug 2009 21:43:58 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090811014358.GA8250@denix.org>
References: <20090810205124.GA15812@gmail.com>
	<4A80976B.6020108@soundmetrics.com>
MIME-version: 1.0
In-reply-to: <4A80976B.6020108@soundmetrics.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: Missing OMAP35x_Graphics_SDK_setuplinux_3_00_00_08.bin	during libgles-omap3_3.00.00.08.bb
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
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
X-List-Received-Date: Tue, 11 Aug 2009 02:00:38 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Aug 10, 2009 at 02:55:55PM -0700, John Faith wrote:
> Khem Raj wrote:
>> ...
>> It seems like this file
>> /home/kraj/work/oe/openembedded/recipes/powervr-drivers/libgles-omap3/OMAP35x_Graphics_SDK_setuplinux_3_00_00_08.bin
>> is missing in my case.
>>
>> Where should it come from
>
> The Graphics SDK installer must be downloaded from Ti and manually put in 
> place before building libgles:
> http://code.google.com/p/beagleboard/wiki/HowtoUseSGXunderAngstrom

By the way, should it be done the same way as DVSDK - i.e. expect the 
installer in the downloads/ instead of the recipes/? Which way is better?

Denys


