Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1PNiXI-0003uV-Ef
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 09:59:36 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id F3931A56C9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Dec 2010 08:58:14 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id BJ2c00IlY2Gb
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Dec 2010 08:58:14 +0000 (GMT)
Received: from [192.168.1.10] (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 1FF65A5643
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Dec 2010 08:58:13 +0000 (GMT)
Message-ID: <4CF60E25.5070506@xora.org.uk>
Date: Wed, 01 Dec 2010 08:58:13 +0000
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB;
	rv:1.9.2.12) Gecko/20101027 Lightning/1.0b2 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTinyc8Pnpd3XMnTu=psPPHAmGKi4+DjvgWhSE1jt@mail.gmail.com>	<20101130082314.GL10755@ibawizard.net>	<AANLkTikmbUDpw04xqRYE+pwY1_mBUNNOdfL+LdnahUrC@mail.gmail.com>	<20101201084510.GM10755@ibawizard.net>	<AANLkTikCDnhP-SoKC+fx-N-Tst3O7-AE_dkNz_g=gCo5@mail.gmail.com>
	<AANLkTik_w9__s=gBQ=YeseiEbVptaPgrjdbwv8c=jbLn@mail.gmail.com>
In-Reply-To: <AANLkTik_w9__s=gBQ=YeseiEbVptaPgrjdbwv8c=jbLn@mail.gmail.com>
X-Enigmail-Version: 1.1.1
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: release-2010 - last moment hot fixes
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
X-List-Received-Date: Wed, 01 Dec 2010 08:59:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 01/12/2010 08:54, Graham Gower wrote:
> On 1 December 2010 19:21, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> 2010/12/1 Petr =C5=A0tetiar <ynezz@true.cz>:
>>> Khem Raj <raj.khem@gmail.com> [2010-11-30 10:12:08]:
>>>
>>>> Do we already have some resolutions to these issues ? are there
>>>> existing patches
>>> Yes, there are few patches around, but Koen didn't told us yet[1] wha=
t
>>> fix/workaround he would preffer for Angstrom 2008/2010.
>>>
>>> 1. http://www.mail-archive.com/openembedded-devel@lists.openembedded.=
org/msg13494.html
>>>
>>> -- ynezz
>> OE is more than angstrom, and no single distro should  block progress
>> for the rest, even not if it is the primary distro.
>> My suggestion would be to upgrade uclibc + binutils. to fix things.
>> Angstrom then can (and probably already does) pin the current versions=
.
>>
>> My 2 cents, Frans.
>>
> The alternative is remove uclibc bits from the angstrom distro conf,
> removing all doubt about its current status as unsupported/nonworking.
>
>
Wait a minute here, all the reports I keep seeing are a failure to
compile in 3 non essential tools. I think as Angstrom maintainer Im
quite happy for that state to exist in a release. I know I wouldnt be
using OpenGL and h264 video on a uclibc target.

Graeme




