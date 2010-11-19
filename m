Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay@jay-tech.ru>) id 1PJO29-0005KQ-3n
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 11:17:33 +0100
Received: by qwh5 with SMTP id 5so1450314qwh.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Nov 2010 02:16:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.224.37.138 with SMTP id x10mr1680040qad.164.1290161783606;
	Fri, 19 Nov 2010 02:16:23 -0800 (PST)
Sender: jay@jay-tech.ru
Received: by 10.220.95.74 with HTTP; Fri, 19 Nov 2010 02:16:23 -0800 (PST)
X-Originating-IP: [78.106.240.238]
In-Reply-To: <AANLkTi=myrWXNaBuManJ2NL4x9ikvqJTsGBhB6gtRuo9@mail.gmail.com>
References: <AANLkTin8E_sSKJcCW7_gtx85_Uo6SvwHFTdiUA8XZ2tv@mail.gmail.com>
	<AANLkTimHjCR5N8WDd5kz4qPqZE=-XCyzz-xqYiE6VeaJ@mail.gmail.com>
	<20101119091100.GJ15069@ibawizard.net>
	<AANLkTi=myrWXNaBuManJ2NL4x9ikvqJTsGBhB6gtRuo9@mail.gmail.com>
Date: Fri, 19 Nov 2010 13:16:23 +0300
X-Google-Sender-Auth: wHSljrLFO18CfWlOp4fnAbDSnXM
Message-ID: <AANLkTi=tpj0Qrg-PrJFSvMV5qirhS6STMkdKvdEnb7K2@mail.gmail.com>
From: Yury Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: jay@jay-tech.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-11-12
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
X-List-Received-Date: Fri, 19 Nov 2010 10:17:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2010/11/19 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> 2010/11/19 Petr =C5=A0tetiar <ynezz@true.cz>:
>> Cliff Brake <cliff.brake@gmail.com> [2010-11-18 17:13:17]:
>>
>>> Last week's test run was a success with 38 combinations passing. =C2=A0=
Thanks to
>>> all running tests:
>>>
>>> http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=3Dtested_201=
0-11-12
>>>
>>> Due to the OE 2010.12 release effort, we are going to give the testing-=
next
>>> effort a break for a couple weeks and ask people doing testing to focus=
 on
>>> the release-2010.12 branch that Khem is working on.
>>
>> Hi Cliff,
>>
>> it looks like, you've included my failed builds also :-) I don't know if=
 it's
>> intention, but I think, that only successful builds should be in the com=
mit
>> message, right? Is it my mistake, to report failed builds on the Testing=
 page?
>>
>> I'm really sorry, that I can only report my build results without fixing=
 them,
>> but I don't have any spare time now...
>>
>> -- ynezz
>
> Failure should be reported as it is also an indicator of quality.
> That's why the remarks column is there.
> Preferably also indicate failure cause and tinderbox link.

I've used '<del>opie-image</del>' wiki syntax to mark failed
opie-image and package name with tinderbox link in 'current issues'
field.

--=20
Yury Bushmelev


