Received: from [209.85.218.219] (helo=mail-bw0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MDLZa-0003ai-6A
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jun 2009 18:50:18 +0200
Received: by bwz19 with SMTP id 19so2581532bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Jun 2009 09:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=1BztqArjtbr9WDRMhljiwSzQLsw9f9jI8JRGzSEbp5M=;
	b=kVjVJpL6jqYSwch0IfRtmlooT734lnhj3TjJe+7VVgeZzhPlZINFz0CPKZVofR+Oix
	1uyrCAZrdWw7NzuMnXn2niDvCZzMZ7btolB2BKWqbN1Bc57LNQjVqUnpQB43zHEguey6
	gb3UUdXmgLpgjeuQK9ZDoURibs9HwSyvuU+xk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=QVeVI2j0x45wtbpvAvBiVaxKS298N6aFGO1SyAb+P5mnuDRAS3TVbEMHBiURc4BCST
	wo6BJPFVL2tga9T35PJXPPFA0XbmM+w2YwrCWNZIvWz6pleeqhiTHZ4TwI2VngDwQxC7
	1cJXvpdBh9g7FP7vyPijk58khakUVvpzEQuZI=
MIME-Version: 1.0
Received: by 10.223.110.11 with SMTP id l11mr3208857fap.50.1244392852380; Sun, 
	07 Jun 2009 09:40:52 -0700 (PDT)
In-Reply-To: <fce2a370906031027y1e28cc6cre5aad0a1465c806b@mail.gmail.com>
References: <20090603151754.GI26065@smtp.west.cox.net>
	<1244043442-3868-1-git-send-email-ihar.hrachyshka@gmail.com>
	<20090603161035.GL26065@smtp.west.cox.net>
	<fce2a370906031027y1e28cc6cre5aad0a1465c806b@mail.gmail.com>
Date: Sun, 7 Jun 2009 19:40:52 +0300
Message-ID: <fce2a370906070940i3f5d7faud81d010af727b66a@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 00/12] different qt4 related patches
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
X-List-Received-Date: Sun, 07 Jun 2009 16:50:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2009 at 8:27 PM, Ihar
Hrachyshka<ihar.hrachyshka@gmail.com> wrote:
> On Wed, Jun 3, 2009 at 7:10 PM, Tom Rini <trini@embeddedalley.com> wrote:
>> On Wed, Jun 03, 2009 at 06:37:10PM +0300, Ihar Hrachyshka wrote:
>>
>>> This patchset:
>>> - adds meta-toolchain-qte.bb to install toolchain with Qt/Embedded and
>>> =C2=A0 all the needed tools ready to use for qt4-embedded development;
>>> - adds directfb support for qt4-embedded;
>>> - includes missing files to qt4 packages;
>>> - fixes code style, generalize qt4 recipes and classes, reworked direct=
ory
>>> =C2=A0 layout;
>>> - occasionally ports pkg-config to INC_PR.
>>
>> What machine / distro combinations have you tested all of this with, and
>> what recipes (other than meta-toolchain-qte) have you explicitly built
>> after? =C2=A0ie have you built / run some QtE images or similar too? =C2=
=A0Thanks.
>
> I built and tested qt4-embedded (with directfb and linuxfb), meta-toolcha=
in-qte.
> I also built (but not tested) qt4-x11-free.
> My machine is beagleboard.

What's the status of the patchset? Is there any problems pending before com=
mit?

>
>>
>> --
>> Tom Rini
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>


