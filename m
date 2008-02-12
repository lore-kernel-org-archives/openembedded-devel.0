Received: from [62.179.121.48] (helo=viefep28-int.chello.at)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mailinglist@miromico.ch>) id 1JOu9e-0005qs-Nk
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Feb 2008 13:22:30 +0100
Received: from [192.168.1.192] (really [77.57.15.173])
	by viefep28-int.chello.at
	(InterMail vM.7.08.02.02 201-2186-121-104-20070414) with ESMTP
	id <20080212122243.CWIA19078.viefep28-int.chello.at@[192.168.1.192]>
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Feb 2008 13:22:43 +0100
Message-ID: <47B18EC6.7060607@miromico.ch>
Date: Tue, 12 Feb 2008 13:19:18 +0100
From: Alex <mailinglist@miromico.ch>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <47AB02C4.4060202@miromico.ch> <47B180DC.1040107@miromico.ch>
	<1202816615.8288.62.camel@dax.rpnet.com>
In-Reply-To: <1202816615.8288.62.camel@dax.rpnet.com>
Subject: Re: Init fails with segfault on AVR32
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
X-List-Received-Date: Tue, 12 Feb 2008 12:22:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi
>> While waiting for support from the mailinglist I tried a few more things 
>> to get my atngw100 system running.
>>
>>     
.....
>> Hope someone can help me. I'm trying for weeks to get this stuff 
>> running....
>>     
>
> I don't have any AVR hardware but narrowing it down to a library like
> that is a great step forward. Can you see any differences in the patches
> or versions used to build uclibc between buildroot and OE?
>
>   
Yes, Atmel's buildroot uses uClibc 0.9.29, OE uses 0.9.28. I was 
thinking of trying to compile Version 0.9.29 but I don't have the
propre OE background to do this. For someone who knows the OE stuff it 
should be easy, as all the necessary patches could be taken
from buildroot.

Alex
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>   



