Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P107f-0004E6-Nq
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 19:07:16 +0200
Received: by iwn2 with SMTP id 2so1281945iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 10:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=c52ohwEJ0rdI2/rmm6rLfmwSpZ1D1oPD50yRhNN9YXY=;
	b=nvg1FYpvsOgPrU2ajVky8yxah8zPthg4TxGcr0pQ7G1kZ6sCxLlOQNGtWqUYN1wb3S
	Z8CulkIbKXyct+t65GPUSU0jo4LvOyvXmoq0ok+D7tXt6dULHv5MpfvL2DhwvUU2Pz4C
	Jj0q88DIxz0iM8kD2LZXfgkSxMyaGO6J01Nkc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=J8NrW6mzNc8kGLYehwpx3FtiZeMvuKAYWUzud/kUZZE1k8WZ/FZWdMaCs7qN9aR8kL
	ufgkRSYZm6ZmYbSzUHHcFIb3lx4oeWmOCLB2igJMmFp2m4Lhs2OEzZWK6hYQLHLVQHHT
	IYirBbYuQveqabc1CGYBhbxqwFZkQANBdN8gE=
MIME-Version: 1.0
Received: by 10.231.11.71 with SMTP id s7mr917372ibs.85.1285780023754; Wed, 29
	Sep 2010 10:07:03 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Wed, 29 Sep 2010 10:07:03 -0700 (PDT)
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F080310E15EAF@dlee06.ent.ti.com>
References: <1285776294-15073-1-git-send-email-chase.maupin@ti.com>
	<AANLkTinLedQV+-eejzidtYa3P9nHWBCZmBH1CoNp3A0J@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310E15EAF@dlee06.ent.ti.com>
Date: Wed, 29 Sep 2010 19:07:03 +0200
Message-ID: <AANLkTimNO=b2=kBd9-Zr0XncAcCftqDO+RMZKO3A=h=x@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] am-benchmarks: update to latest version
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
X-List-Received-Date: Wed, 29 Sep 2010 17:07:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/29 Maupin, Chase <chase.maupin@ti.com>:
>
>
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>> Frans Meulenbroeks
>> Sent: Wednesday, September 29, 2010 11:24 AM
>> To: openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] [PATCH] am-benchmarks: update to latest version
>>
>> 2010/9/29 Chase Maupin <chasemaupin03@gmail.com>:
>> > * Updated the SRCREV to the latest version of this project
>> > =A0which includes support for multiple platforms.
>> >
>> > Signed-off-by: Chase Maupin <chase.maupin@ti.com>
>> > ---
>> > =A0recipes/ti/am-benchmarks_svn.bb | =A0 12 +++++++++---
>> > =A01 files changed, 9 insertions(+), 3 deletions(-)
>> >
>>
>> Don't have the full recipe handy, but is this latter UNDEFINED needed?
>> I would expect a COMPATIBLE_MACHINE somewhere causing the latter never
>> to happen.
>> Then again it might be a good safeguard.
>
> Frans,
>
> Good point. =A0In the past there was no difference between arm9 and corte=
x-a8 so we didn't really concern ourselves with COMPATIBLE_MACHINE because =
the code was supposed to be buildable for all of the different machines. =
=A0Now we have these different directories containing sources for the diffe=
rent architectures. =A0We could use compatible machine so I could go either=
 way on this. =A0Let me know if you want me to change this.

I prefer to use e.g. COMPATIBLE_MACHINE.
That inhibits building a recipe for a machine for which it is not intended.

Frans.


