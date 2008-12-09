Received: from [195.65.72.27] (helo=bagnes.atmel.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1LA37F-0000AY-9t
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Dec 2008 14:59:09 +0100
Received: from fribh01.corp.atmel.com (FRIBH01 [10.175.30.10])
	by bagnes.atmel.com (8.13.8+Sun/8.13.8) with ESMTP id mB9DoXIU000657
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 9 Dec 2008 05:50:36 -0800 (PST)
Received: from frimb01.corp.atmel.com ([10.175.30.12]) by
	fribh01.corp.atmel.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 9 Dec 2008 14:55:10 +0100
Received: from aeglos ([172.24.49.64]) by frimb01.corp.atmel.com with
	Microsoft SMTPSVC(6.0.3790.3959); Tue, 9 Dec 2008 14:55:09 +0100
Message-ID: <28EBCEAA50D843FAA61B683FEC0FBD07@aeglos>
From: "Ulf Samuelsson" <ulf.samuelsson@atmel.com>
To: <openembedded-devel@lists.openembedded.org>
References: <C41AF57F04424526AD798F542197E674@aeglos><493D1A83.1070500@balister.org><48239d390812080508p7585f22bo529c8a5ebf2f438e@mail.gmail.com><8162086526F74198823FA0003D5FA08D@aeglos>	<48239d390812080709l2051390en9ec07e495eff560e@mail.gmail.com><4B4AD5DB834948B0A7AC3D8B722645A6@aeglos>
	<493D96C3.6070009@balister.org>
Date: Tue, 9 Dec 2008 14:43:29 +0100
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.5512
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.5579
X-OriginalArrivalTime: 09 Dec 2008 13:55:10.0007 (UTC)
	FILETIME=[C00B4470:01C95A05]
X-MIME-Autoconverted: from 8bit to quoted-printable by bagnes.atmel.com id
	mB9DoXIU000657
Subject: Re: Request for a personal git tree for AT91/AVR32
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
X-List-Received-Date: Tue, 09 Dec 2008 13:59:09 -0000
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: quoted-printable

>Ulf Samuelsson wrote:
>>> On Mon, Dec 8, 2008 at 4:44 PM, Ulf Samuelsson
>>> <ulf.samuelsson@atmel.com> wrote:
>>>> I ran into a problem that linux would not build because if you
>>>> use linux and request UIMAGE, then you fail because
>>>> u-boot-mkimage is not available.
>>> Well, u-boot native tools are built perfectly now, and uImages
>>> work. Try to build for afeb9260 machine, and see for yourself.
>>> I tried that yesterday, it works perfectly.
>>>
>>
>> If you can't download the source you can't build the tools.
>> It used the backup location which does not have a git server.
>> Obviously it could be a temporary problem with the main
>> location, but it is probably a bug trying to use the backup location.
>>
>> If a "stable" version is used, then the backup location can contain th=
e
>> same source code.
>>
>> Anyway , If it normally works, then I do not need to add it!
>>
>> If people have problem, does it hurt that u-boot-1.3.4 is supported as
>> well?
>>
>> I checked with the AT91 group and they have been spending quite
>> some time to test and verify 1.3.4 on a multitude of boards so
>> it does make sense to have this supported.
>
>I'd like to see recipes for the later stable u-boots to support HW that
>is well supported by u-boot. I've been mraning to do this but haven't
>had to do this myself. Thanks for adding 1.3.4. whrn I can type with two
>arms again ...

I usually prefer typing with fingers ;-)

>
>Philip
>
>If no gets to it, I'll look at i
>>

Thanks,

The sooner I get access, the sooner I can provide the updates.


>> Is the "personal" git tree really personal, or can you have
>> a git tree which is available to a group?
>>
>> It makes sense for me to have an "atmel" group which I
>> could share with other interested atmel employees.
>>
>> Who is making decisions on access?
>>
>> Best Regards
>> Ulf Samuelsson
>>

Best Regards
Ulf Samuelsson                ulf@atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv=E4gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57




