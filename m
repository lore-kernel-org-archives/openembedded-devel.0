Received: from exprod5og110.obsmtp.com ([64.18.0.20])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@gefanuc.com>) id 1NVMKq-000144-Ca
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jan 2010 10:49:51 +0100
Received: from source ([12.71.149.1]) (using TLSv1) by
	exprod5ob110.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS07oOkHxKplmGHI0bdxTlznb8pDRp85o@postini.com;
	Thu, 14 Jan 2010 01:47:39 PST
Received: from unknown (HELO cinmlip01.e2k.ad.ge.com) ([3.159.213.48])
	by Cinmlip05.e2k.ad.ge.com with ESMTP; 14 Jan 2010 04:42:35 -0500
Received: from es-j7s4d2j.amer.consind.ge.com (HELO [3.138.54.92])
	([3.138.54.92])
	by cinmlip01.e2k.ad.ge.com with ESMTP; 14 Jan 2010 04:42:34 -0500
Message-ID: <4B4EE7B5.3040206@gefanuc.com>
Date: Thu, 14 Jan 2010 09:45:25 +0000
From: Martyn Welch <martyn.welch@gefanuc.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <318819580.1263399029.155991028.16785@mcgi25.rambler.ru>	<4B4EDCED.6000107@gefanuc.com>
	<4B4EE2DA.5080106@rambler.ru>
In-Reply-To: <4B4EE2DA.5080106@rambler.ru>
X-SA-Exim-Connect-IP: 64.18.0.20
X-SA-Exim-Mail-From: martyn.welch@gefanuc.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Adding a new Machine question
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
X-List-Received-Date: Thu, 14 Jan 2010 09:49:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Perepelica Alexander wrote:
> When I try boot image in qemu I see
> booting kernel ... and nothing.
>
I'm afraid I have no experience with using qemu, so I don't think I can
really make any suggestions at this point.

Martyn

>
> 14.01.2010 10:59, Martyn Welch пишет:
>> Perepelica Alexander wrote:
>>   
>>> Thank you, Martyn!
>>> I remove my changes from linux_2.6.32+2.6.33-rc3.bb and I build was
>>> successful but don't boot with image :(  - all hangs
>>>      
>> At what point does it hang?
>>
>> At a guess (as you haven't provided any specifics) I'd guess that you
>> need to look at the kernel configuration.
>>
>> Martyn
>>
>>    
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@gefanuc.com                   |   M2 3AB  VAT:GB 927559189



