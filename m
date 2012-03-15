Received: from www.dynamicdevices.co.uk ([89.200.136.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ajlennon@dynamicdevices.co.uk>) id 1S8Eaa-0001AM-Qv
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Mar 2012 18:35:48 +0100
Received: from cpc9-live20-0-0-cust612.know.cable.virginmedia.com
	([82.42.142.101] helo=[127.0.0.1])
	by www.dynamicdevices.co.uk with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <ajlennon@dynamicdevices.co.uk>) id 1S8ERn-0007p9-NM
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Mar 2012 17:26:43 +0000
Message-ID: <4F622652.30001@dynamicdevices.co.uk>
Date: Thu, 15 Mar 2012 17:26:42 +0000
From: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F610B38.5060309@dynamicdevices.co.uk>
	<CAP9ODKo_RMjJ1BsP9QQHJY8xwmRzBie3L0DuB1e7jr=N_kuekQ@mail.gmail.com>
	<4F6219FC.7010506@dynamicdevices.co.uk>
	<CAP9ODKrpf0tSGb5e8whj05JUtzjZTkbJMcD2C4TH3YUgJ1pQDg@mail.gmail.com>
	<4F622053.50202@dynamicdevices.co.uk>
	<20120315181021.56883348@eb-e6520>
	<4F6223D4.3020100@dynamicdevices.co.uk>
	<CAP9ODKqUQAkn9B_rTiG2usVvD+4=U9arufuK3fNfy5ieB2y82Q@mail.gmail.com>
In-Reply-To: <CAP9ODKqUQAkn9B_rTiG2usVvD+4=U9arufuK3fNfy5ieB2y82Q@mail.gmail.com>
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
X-List-Received-Date: Thu, 15 Mar 2012 17:35:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


>That said, I do believe you ought to check if your changes cannot be made generic

Will try to keep in mind.

>Please complain at them ... this is the only way to revert it.

I'll keep on at them :) Anything not to have to go back to LTIB... ;)

Alex

On 15/03/2012 17:21, Otavio Salvador wrote:
> On Thu, Mar 15, 2012 at 14:16, Alex J Lennon
> <ajlennon@dynamicdevices.co.uk>  wrote:
>>> I think the first solution is better and that custom boards should be added
>>> to custom layers
>> Hmmm ok, thanks That being the case it may be better for me to migrate my
>> recipes from
>> the oe-classic codebase into a new layer created from scratch. It'll be
>> quicker and easier for
>> me that way but perhaps less generic.
> I think many things can be merged back but it is better to have custom
> boards in specific layers that inherit meta-fsl-arm. That said, I do
> believe you ought to check if your changes cannot be made generic
> (ofthenly it can be done) and this could allow it to be merged here.
>
>> (Although my understanding was that Freescale have no intention of providing
>> Linux support related
>>   to OpenEmbedded at this time? Or at least that's what they are telling me
>> :)
> Please complain at them ... this is the only way to revert it. Some
> individuals are working with OpenEmbedded/Yocto and it might end
> changing the Freescale's position if we can enough community support
> and complains at them :-)
>



