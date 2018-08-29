Return-Path: <texier.pj2@gmail.com>
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
	[209.85.208.43])
	by mail.openembedded.org (Postfix) with ESMTP id 211E578890
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Aug 2018 06:16:59 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id h9-v6so3062787edr.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 23:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KeA69UamynOxhAEVDRtCZe7MwsRMfCLb5NFcDH25+S8=;
	b=eQOna5hLaKTr4Lk/2gvz5huxH/rFoBikqKwPkIbpVJ/o2q3ecKiVDdVyg5GdTOxkhV
	5JLYxRtS3/rFT6sOGb/h1bH2JbOtDBy52hGZ/16UElF7jfRj2uGuo2IWnjut8cBlX5jH
	q8mQAoGdyvGPnTdcvUDEaYJigw3GunH2XrYiBM538AU2e9H32SL/O8XWlvJY0vgBgnaQ
	6iAyVBq740bMCurXijLd5rS4GqYz3LAhhDVxkDuPpzygbaXtaASf8zP07XJuLtlMOrZG
	HqGCRup/Q0DHLKMkWqZ+v3oA6kx92QqBHV0FpfspSwOmVR/jpMqSq2FMbfsal/UhVf3G
	2rCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KeA69UamynOxhAEVDRtCZe7MwsRMfCLb5NFcDH25+S8=;
	b=eTWv7f6mllltiss1I7r/c906C7V33GdQYnNLwEUvOaigZ/gO3MNvAIFWxNdn08yNH3
	uCJBM0ZswOI71YoDP5kQn9T2YNDWwzcLOJ51KsRUuedeBs59ageBYs+fQ+ob1s2qo2/5
	kcykBTjXSF/dfEC3SB0ch40gTOf4zEWuLxQvHiG0XXZzWyv7xQnOixES+OHKyiATHJus
	TsMy/458of9G7kHbtYCv4k3lNwuC6pLyHCglxRGVnTngteUJLyR8Ib4ZGOz9FRi0FvEw
	LpuJbwfBiebPyrgCCfa/ohauBtOiW7N0aV0J6qhZZL8hDsvKYj3Ap4k58iyqFM1E0NKH
	8WLQ==
X-Gm-Message-State: APzg51DOHIPfp32iR/WGkKu9F0qaVwfqj+d5ia6jT5iFsfRnzU8tsi9S
	Zik9mz5F9cjywBCy5lLD9tn8VMBkkmed5QUd/Uo=
X-Google-Smtp-Source: ANB0VdZng3l6p8zOGiPp7Z+dtDSIjr5mWw5Qzqcd0fpsxVP/XaZvh5IzID8ssFJRep7Ug9zTkVlFbPOr1UK5hjgoYL4=
X-Received: by 2002:a50:fd84:: with SMTP id
	o4-v6mr5958136edt.116.1535523419814; 
	Tue, 28 Aug 2018 23:16:59 -0700 (PDT)
MIME-Version: 1.0
References: <1535482087-19250-1-git-send-email-texier.pj2@gmail.com>
	<CAMKF1sqvY9Rx7dtf3tRKzi2f9+sagj4=HQGM3eK-tkFpTnsxsg@mail.gmail.com>
In-Reply-To: <CAMKF1sqvY9Rx7dtf3tRKzi2f9+sagj4=HQGM3eK-tkFpTnsxsg@mail.gmail.com>
From: TEXIER Pierre-Jean <texier.pj2@gmail.com>
Date: Wed, 29 Aug 2018 08:16:48 +0200
Message-ID: <CALRtUqvww+FLerSH=ZKdJoWRCQO5vVdd45tncLP+c4NG7T3q-g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] spitools: 0.8.1 -> 0.8.3
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
X-List-Received-Date: Wed, 29 Aug 2018 06:16:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,
Le mer. 29 ao=C3=BBt 2018 =C3=A0 03:35, Khem Raj <raj.khem@gmail.com> a =C3=
=A9crit :

> Hi Pierre
> On Tue, Aug 28, 2018 at 11:48 AM Pierre-Jean Texier
> <texier.pj2@gmail.com> wrote:
> >
> > Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
> > ---
> >  meta-oe/recipes-support/spitools/spitools_git.bb | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta-oe/recipes-support/spitools/spitools_git.bb
> b/meta-oe/recipes-support/spitools/spitools_git.bb
> > index 3f6cdc6..4944e25 100644
> > --- a/meta-oe/recipes-support/spitools/spitools_git.bb
> > +++ b/meta-oe/recipes-support/spitools/spitools_git.bb
> > @@ -6,9 +6,9 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D8c16666ae6c159876a0ba63099614381"
> >
> >  PR =3D "r0"
>
> Drop this while you are here.
>

Ok, I will do.

Thanks
Pierre-Jean

>
> >
> > -BPV =3D "0.8.1"
> > +BPV =3D "0.8.3"
> >  PV =3D "${BPV}"
> > -SRCREV =3D "318bcae5249722873bf58b27afdd20473c7047cc"
> > +SRCREV =3D "a3f1f68a048d0d2321ee562b3744dd1162cad22f"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > @@ -16,4 +16,3 @@ SRC_URI =3D "git://
> github.com/cpb-/spi-tools.git;protocol=3Dgit"
> >
> >
> >  inherit autotools
> > -
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

