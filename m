Received: from smtprelay-b21.telenor.se ([195.54.99.212])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf_samuelsson@telia.com>) id 1RGIKc-0002fs-UE
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Oct 2011 00:40:23 +0200
Received: from iph5.telenor.se (iph5.telenor.se [195.54.127.136])
	by smtprelay-b21.telenor.se (Postfix) with ESMTP id DA500EA10C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2011 00:34:32 +0200 (CEST)
X-SENDER-IP: [83.227.57.13]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AvcjALX+nU5T4zkNPGdsb2JhbAAMOJl/jwkBAQEBN4IgAQEBAQIBAQEBNTYbCxgJGgsPAhYBGxQTBgIBAYd8CLYjiBsEkWOCGpFY
X-IronPort-AV: E=Sophos;i="4.69,367,1315173600"; d="scan'208";a="55538891"
Received: from c-0d39e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.249]) ([83.227.57.13])
	by iph5.telenor.se with ESMTP; 19 Oct 2011 00:34:32 +0200
Message-ID: <4E9DFEF8.40705@telia.com>
Date: Wed, 19 Oct 2011 00:34:32 +0200
From: Ulf Samuelsson <ulf_samuelsson@telia.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E9C93AB.7090705@telia.com> <4E9CA882.7080107@gmail.com>
	<4E9D16AD.7040403@telia.com>
	<1318949254.22985.146.camel@phil-desktop>
In-Reply-To: <1318949254.22985.146.camel@phil-desktop>
Subject: Re: Performance measurement: Building openembedded-core with and without overclocking on C-i7 2600K
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
X-List-Received-Date: Tue, 18 Oct 2011 22:40:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

2011-10-18 16:47, Phil Blundell skrev:
> On Tue, 2011-10-18 at 08:03 +0200, Ulf Samuelsson wrote:
>> My comparision between 2 similar machines indicate that
>> 32 bit 11.04 with Psyco-Dist is 20% faster than 64 bit with 11.04
>>
>> The machine running 64 bit 11.04 was tested with 32 bit 11.04
>> using an external disk (connected through e-SATA) and results
>> were very close to the numbers for the other 32 bit machine
>>
>> I didn't save those numbers but I think that is good enough
>> to draw the conclusion that adding JIT for 64 bit (PyPy?) will reduce build
>> time significantly.
> You seem to have changed two things at once there (or perhaps just made
> a bit too much of a leap in your conclusion).  Did you test 32-bit
> without the JIT?

The word indicate is not soo strong as you indicate ;-)
Just saying that if it looks like a duck, walks like a duck
it is probably a duck.

It takes too long to reinstall for that to be an alternative for me.
More data from other people could be an alternative.


>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
Best Regards
Ulf Samuelsson



