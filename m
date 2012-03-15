Received: from www.dynamicdevices.co.uk ([89.200.136.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ajlennon@dynamicdevices.co.uk>) id 1S86tM-0007Do-6Q
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Mar 2012 10:22:40 +0100
Received: from cpc9-live20-0-0-cust612.know.cable.virginmedia.com
	([82.42.142.101] helo=[127.0.0.1])
	by www.dynamicdevices.co.uk with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <ajlennon@dynamicdevices.co.uk>) id 1S86kZ-0007V0-8m
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Mar 2012 09:13:35 +0000
Message-ID: <4F61B2C0.2010200@dynamicdevices.co.uk>
Date: Thu, 15 Mar 2012 09:13:36 +0000
From: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F610B38.5060309@dynamicdevices.co.uk>
	<CAGiJk9c+bcDHk5MCOE_bRRyi-c9tDy6cjPvFgcrpiXtHpPGOWg@mail.gmail.com>
	<CALbNGRTRjx=MdV_cmisCaXrR_GT0nVyzzs29FT-sHymCYh48=A@mail.gmail.com>
In-Reply-To: <CALbNGRTRjx=MdV_cmisCaXrR_GT0nVyzzs29FT-sHymCYh48=A@mail.gmail.com>
Subject: Re: oe-core layer including support for i.MX28
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
X-List-Received-Date: Thu, 15 Mar 2012 09:22:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit


>did the meta-fsl-arm developers merge the meta-freescale repository?

Thanks Andreas, Samuel. I shall take a look.

Best Regards,

Alex

On 15/03/2012 08:27, Andreas Müller wrote:
> On Thu, Mar 15, 2012 at 8:17 AM, Samuel Stirtzel
> <s.stirtzel@googlemail.com>  wrote:
>> 2012/3/14 Alex J Lennon<ajlennon@dynamicdevices.co.uk>:
>>> Hi,
>> Hi,
>>> I'm trying to begin the migration from oe-classic to oe-core, focussing on
>>> Freescale's
>>> i.MX28 and i.MX51. I recall there was i.MX28 kit being demo'd at FOSDEM but
>>> I can't
>>> seem to find support anywhere for the i.MX28, which I thought might be in
>>> meta-fsl-arm?
>> did the meta-fsl-arm developers merge the meta-freescale repository?
>> AFAICT there was support for i.MX28 in Andreas git repository:
>> http://gitorious.org/schnitzeltony-oe-meta/meta-freescale
>>
>>> Can anybody point me in the right direction? (I've half a mind to try adding
>>> the support
>>> into meta-fsl-arm myself but that would seem somewhat wasteful if it's
>>> already been
>>> done)
>> The meta-freescale repository might need some work, but it is a starting point.
>>
> meta-freescale merge to meta-arm-fsl is in progress - thanks Otavio:)
>
> Andreas
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



