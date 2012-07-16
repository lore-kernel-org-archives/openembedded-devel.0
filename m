Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1Sqf7Y-0001qs-Ex
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jul 2012 08:49:28 +0200
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 2F19ED232B; Mon, 16 Jul 2012 08:38:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-144.dynamic.chello.pl
	[87.206.60.144])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 4B539D2329
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2012 08:37:43 +0200 (CEST)
Message-ID: <5003B6B3.4070304@linaro.org>
Date: Mon, 16 Jul 2012 08:37:39 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120620 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <50033305.5090906@linaro.org>
	<1342393099.27834.14.camel@gnutoo-desktop>
In-Reply-To: <1342393099.27834.14.camel@gnutoo-desktop>
Subject: Re: Some spare developer boards and other devices
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
X-List-Received-Date: Mon, 16 Jul 2012 06:49:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 16.07.2012 00:58, Denis 'GNUtoo' Carikli pisze:
> On Sun, 2012-07-15 at 23:15 +0200, Marcin Juszkiewicz wrote:

>> 4. Openmoko GTA01bv3
>> 
>> One of 36 devices from Phase0 - so very low serial number. But
>> also serious battery problems. Device with 128MB microSD card.
>> Should be bootable.
> The advantage over the freerunner is that there is no glamo, so the 
> microsd and framebuffer support are way better right?

Never used gta02.

> Is there a limit on the capacity of the microSD card that you can
> put inside the GTA01?

I used 128 and 1-2GB ones.

>> 5. Sharp Zaurus c760

> Some time ago I looked at the status of the zauruses, it seems that
> the mainline kernel support for them is quite complete. The
> userspace support too(opie is still alive and there is a
> meta-opie...). The only problem is that they lost their mplayer
> acceleration for videos right?

I stopped using c760 about 3-5 years ago. Since then I did not tracked
what is going on there.


