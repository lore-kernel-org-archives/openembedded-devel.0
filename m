Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-it1-f173.google.com (mail-it1-f173.google.com
	[209.85.166.173])
	by mail.openembedded.org (Postfix) with ESMTP id 734DF7D2CA
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 10:44:03 +0000 (UTC)
Received: by mail-it1-f173.google.com with SMTP id u65so10448640itc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2019 03:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=c14tuaK+p4VX1ezDZO3SRqTEUFLviSjAyWHsoLes7R4=;
	b=S+ucANuaOlR4KRu+9BSsvP/LVHCkuoK0+Z/plShtTsQu0drK5bXKM8IfjgKdDhuoNz
	ihtgDQqVERTfwBfxriU8G68r8pZwhPWSNngQ0S3PuvWY0VZFtN3fF0I76vGKmN41petm
	ydW3Viarzcs5HNA540HdoNWYLuns3KbGcAw5I6rEsj5jRs5b7tfLC59YHXzB5erO1lxC
	L1yXtZTHQ+lnuIovh1wG9pgNvcGkcbbARedtrILeHzn+h3fPKZRt6TBddOLR3cfZxJKs
	p1R2Q0UNaL3HmB5PkvQBzJeRpAx/WlQvnE7A+r6/maXpMlkAGFF6ySHRalQFdapivDXq
	+Cvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=c14tuaK+p4VX1ezDZO3SRqTEUFLviSjAyWHsoLes7R4=;
	b=ECrk5X9plo6wcenxS9ByscHo5j8XvMxKOgX7MA+gPdknr/8HA+PnEKPje6QlsltCT6
	0KBOfxr6faPWzevKXzyo0sdHllHKnk3zK1+jvUMmiu+KcLpK/UNX1Qym2yMOrQBHeOrp
	XSHqN/ltjmdsprb7FrYPCukfa5468HE8xF0i2YW+ygothAjWX876YbiktbOBgMcc2961
	dZ2qJhWpy++1MIigOnDAjPrzR2eioKZTU4/HjKLaL/OxW0Xkktocj65qfyaJZiI3Cn7R
	CcDNLW38+K+sJmt3m8xLLqTcWz8pLfyoiqm+yPwLmuAoIsgZ23/gtpnPVLj5erS/gAVB
	3vGA==
X-Gm-Message-State: APjAAAU02vxlBQm3xBtFqgui7vnazZt6PsTSxXsX1e3EZQfej5zH6eGN
	/Jbwt4wc71QzhZ83FldGTu4sPry41Esk4Jv6YqA=
X-Google-Smtp-Source: APXvYqxlgpYkyCYaFZpgfTHBfHlbdKX7I4EVzbrLEKYU27Db1lj9670Bpc7uL0pOddJJWKqhTo0KxsICkAFyd1K5Bv4=
X-Received: by 2002:a24:4682:: with SMTP id j124mr1374463itb.90.1554288244341; 
	Wed, 03 Apr 2019 03:44:04 -0700 (PDT)
MIME-Version: 1.0
References: <1554280123-19112-1-git-send-email-vincent.prince.fr@gmail.com>
	<1554280123-19112-2-git-send-email-vincent.prince.fr@gmail.com>
	<20190403085651.GA6467@localhost>
	<CAB2nKc9hnDrOTtKjNfk1cupK0yv8xXksEuvURJtS6ve_baOpJQ@mail.gmail.com>
In-Reply-To: <CAB2nKc9hnDrOTtKjNfk1cupK0yv8xXksEuvURJtS6ve_baOpJQ@mail.gmail.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Wed, 3 Apr 2019 12:43:52 +0200
Message-ID: <CAB2nKc_K2cy6EKDvz7vcGUJxBsS0pE=96XW6_+2Z_j_eX58dwA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 2/3] cppzmq: bump version 4.2.3 => 4.3.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Apr 2019 10:44:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I mean
https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg12=
1560.html

Le mer. 3 avr. 2019 =C3=A0 12:42, Vincent Prince <vincent.prince.fr@gmail.c=
om> a
=C3=A9crit :

> Then, it would need to rename cppzmq_git.bb into cppzmq_4.3.1.git or can
> we just remove +git${SRCPV} part of PV?
>
> In following threads it seems first option should be chosen?
>
> https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg=
120575.html
>
> https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg=
121561.html
>
> Le mer. 3 avr. 2019 =C3=A0 10:56, Adrian Bunk <bunk@stusta.de> a =C3=A9cr=
it :
>
>> On Wed, Apr 03, 2019 at 10:28:42AM +0200, Vincent Prince wrote:
>> > Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
>> > ---
>> >  meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb | 6 ++++--
>> >  1 file changed, 4 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
>> b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
>> > index 9aff59c..2f99417 100644
>> > --- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
>> > +++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
>> > @@ -4,8 +4,8 @@ LICENSE =3D "MIT"
>> >  LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3Ddb174eaf7b55a34a7c89551197f66e94"
>> >  DEPENDS =3D "zeromq"
>> >
>> > -SRCREV =3D "6aa3ab686e916cb0e62df7fa7d12e0b13ae9fae6"
>> > -PV =3D "4.2.3+git${SRCPV}"
>> > +SRCREV =3D "213da0b04ae3b4d846c9abc46bab87f86bfb9cf4"
>> > +PV =3D "4.3.1+git${SRCPV}"
>> >...
>>
>> These are the actual releases, PV should not say +git${SRCPV}
>> for them.
>>
>> Not a bug you introduced, but can be fixed now.
>>
>> cu
>> Adrian
>>
>> --
>>
>>        "Is there not promise of rain?" Ling Tan asked suddenly out
>>         of the darkness. There had been need of rain for many days.
>>        "Only a promise," Lao Er said.
>>                                        Pearl S. Buck - Dragon Seed
>>
>>

