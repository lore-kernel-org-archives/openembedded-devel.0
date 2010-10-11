Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P5Nbp-0008DR-R7
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 21:00:31 +0200
Received: by iwn2 with SMTP id 2so31729iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 12:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=zXWhe0gOUTuKOnkXetDiM2OTInT6MU6TjDH41IGS4SY=;
	b=Ap6DnPtTDjb8WCbp9N4riu5or5a38ZmSX8l/Q/zqnl89zxdXaAdZBrowVRl6ZufAM/
	oxPCEbDsnl/tIt6ZBwE42Di3XXrlIqULFmNApy9/DILRKb5xPABhLwl260uzY/qmhjT7
	EhcK3/caFPn/bnzBbv/0o5gpg8lQrRg+XK5OI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=vNw7H6lbRmu/ovPL68yWtMzFpqombi2WgET84x+SlKIvrvQhxBE26vqOfdCH9D9ZWr
	mQ5zSR1EwFiMdMTRPxeTIcK1ZaDB8+tRay5e9NLFfKyMlJ6IMQThFY1JNr5WN8Kip6J8
	XyMnryKsi5sygA4I2X4Rewfml2IUqaVZClIqM=
MIME-Version: 1.0
Received: by 10.231.148.83 with SMTP id o19mr4970201ibv.112.1286823605252;
	Mon, 11 Oct 2010 12:00:05 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 11 Oct 2010 12:00:04 -0700 (PDT)
In-Reply-To: <i8vln6$njo$1@dough.gmane.org>
References: <1286812675-31626-1-git-send-email-chase.maupin@ti.com>
	<AANLkTinR7QSaFb1FTzETX9=k9=JZh58iZgyD=7=So1uF@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310FFA2BC@dlee06.ent.ti.com>
	<i8vln6$njo$1@dough.gmane.org>
Date: Mon, 11 Oct 2010 21:00:04 +0200
Message-ID: <AANLkTik+qU9YfpoHybY=v87sVGOE9M8RjdKgfgwfL-JF@mail.gmail.com>
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
Subject: Re: [PATCHv2] recipe licenses: update recipe LICENSE fields
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
X-List-Received-Date: Mon, 11 Oct 2010 19:00:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/11 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 11-10-10 20:14, Maupin, Chase wrote:
>>
>>> -----Original Message-----
>>> From: openembedded-devel-bounces@lists.openembedded.org
>>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>>> Frans Meulenbroeks
>>> Sent: Monday, October 11, 2010 12:41 PM
>>> To: openembedded-devel@lists.openembedded.org
>>> Subject: Re: [oe] [PATCHv2] recipe licenses: update recipe LICENSE fiel=
ds
>>>
>>> 2010/10/11 Chase Maupin <chasemaupin03@gmail.com>:
>>>> * While verifying the licensing for the packages I am building
>>>> =A0into my file system I found that for some packages the
>>>> =A0LICENSE value set in the recipe was either incorrect or
>>>> =A0generic and not detailed enough. =A0This patch is my attempt
>>>> =A0to update the LICENSE fields for these packages to match
>>>> =A0the actual versions of the licenses in the sources.
>>>>
>>>
>>> [...]
>>>
>>>> -LICENSE =3D "GPLv2"
>>>> +LICENSE =3D "GPLv2+"
>>>
>>> Doe we want this?
>>> I think most GPLv2 code carries the clause:
>>>
>>> "This program is free software; you can redistribute it and/or
>>> modify it under the terms of the GNU General Public License
>>> as published by the Free Software Foundation; either version 2
>>> of the License, or (at your option) any later version."
>>>
>>> Yet currently virtually all of these have GPL or GPLv2 as LICENSE
>>
>> Frans,
>>
>> My original version of this patch was just changing GPL to GPLv2 for exa=
mple. =A0But I was asked about whether it should be GPLv2+ which I guess is=
 more indicative of the "or later" clause. =A0Does anyone have good guidanc=
e here on how to denote things that are GPLv2 only for now (like git which =
Linux has a note in the COPYING file about it being GPLv2) and things that =
are GPLv2 or later version? =A0I'm trying for consistency here but I guess =
there doesn't seem to be a set policy for how the LICENSE field should be s=
et.
>
> The current policy is:
>
> GPLv1 -> GPL version 1
> GPLv1+ -> GPL version 1 or later
> GPLv2 -> GPL version 2
> GPLv2+ -> GPL version 2 or later
> GPLv3 -> GPL version 3
> GPLv3+ -> GPL version 3 or later
>
> This was done to make it immediately clear which GPL license it's using
> so you can decide to drop GPLv2+ and GPLv3 from your manifest if you
> want secure boot or enforce patents.
>
> regards,
>
> Koen

I'm not sure if it is a policy. Haven't seen it being pulished as such.
Having said that, I have no problems with it (although there is no
problem with enforcing patents or so for v2+ , as that still falls
under the v2 umbrella).

I guess most of our recipes that say GPLv2 are wrong and are v2+.
It might be hard to distinguish between these though, it could well be
that the license file says v2 and a comment in the code says v2+.
Glad I do not have to deal with this any more....

Frans


