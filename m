Return-Path: <1337ch1770r@googlemail.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 9E2A56D181
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2013 10:57:09 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id q58so3862263wes.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Nov 2013 03:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=gzxW4P63/VBONzmK6UzJmqvWv20mGVV+Oc6QkZZYmKA=;
	b=VXKeEBJOz5+PXN5DPliBgORESBTU2My/ASAArI8t4+MAQlELy5lZ7QJOXsVF/fgk5I
	KPG7fUP8du7u2rjSnk2Sx6RbWDXPylwhO8jEpTKysdM/jV4ouLjYkUMn93VMrbgFY43Z
	G9HBUKWox7q2xJmLb0ANlSqZ/T+0iIt8xGXxfCtwvNMVV0XOYqJFl3rhnUu8ZMgvQbSY
	5yh75P9Um+1H7sFfwSfTWJjBCl3aMfbxF93Qr0lLDdAR4+kqz/fT/b7dWL9qY/NFrZmL
	1UIqz12pkGypogtEFL9kVpWR3K0hmK6+PePb+1RUlklKSeWIa0WbLj870jecft+H9PrA
	nVUA==
MIME-Version: 1.0
X-Received: by 10.180.72.135 with SMTP id d7mr187678wiv.65.1383303430805; Fri,
	01 Nov 2013 03:57:10 -0700 (PDT)
Received: by 10.194.46.227 with HTTP; Fri, 1 Nov 2013 03:57:10 -0700 (PDT)
In-Reply-To: <001c01ced6af$3b5db1a0$b21914e0$@com>
References: <1383205247-8487-1-git-send-email-b40527@freescale.com>
	<CAMKF1sqTBq-J_trvVcmVcCT7uuJEaXuECaczSEbjDRNQDWRz3A@mail.gmail.com>
	<001c01ced6af$3b5db1a0$b21914e0$@com>
Date: Fri, 1 Nov 2013 11:57:10 +0100
Message-ID: <CACCbTUm3PyKAR7h2aQTsMYBxPKsi-UAbdW5tgtJO52VUWcEpCA@mail.gmail.com>
From: "w201cruiser ." <1337ch1770r@googlemail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH v2] tcpreplay:add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Nov 2013 10:57:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Boah Leute k=C3=B6nnt ihr mal aufh=C3=B6ren mein Postfach zuzum=C3=BCllen?!


2013/11/1 Zongchun YU <b40527@freescale.com>

> >get rid of that, and why are the configure patches not ok for upstreamin=
g
> ?
>
> Hello Khem.
>
> Thanks for your comments, I am a newcomer for upstreaming. Do you mean
> that first I should send the two patches
> to upstream?
>
> Best Regards
> Zongchun
> -----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
> =E5=8F=91=E4=BB=B6=E4=BA=BA: Khem Raj [mailto:raj.khem@gmail.com]
> =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2013=E5=B9=B411=E6=9C=881=E6=97=A5 =
0:36
> =E6=94=B6=E4=BB=B6=E4=BA=BA: openembeded-devel
> =E6=8A=84=E9=80=81: Zongchun Yu; b44149@freescale.com
> =E4=B8=BB=E9=A2=98: Re: [oe] [meta-oe][PATCH v2] tcpreplay:add recipe
>
> On Thu, Oct 31, 2013 at 12:40 AM,  <b40527@freescale.com> wrote:
> > +PR =3D "r0"
>
> get rid of that, and why are the configure patches not ok for upstreaming=
 ?
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

