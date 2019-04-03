Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2ED257D2CD
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 11:36:35 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id b6so13773895iog.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2019 04:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xqBxHe0AJ2NRQH9JTUjhoKVm9F5YW0LRESqL3cf8OhA=;
	b=bsU8rSoM+C2LH+ek3v7LFslFmx8apt5NJz7TRZr75yYSbrqnhf7lwwypqB6GuNdmAA
	qeA7OJ61bxMNpDCONWCFnx+iNY5K2m3uhIxQhSBOl9t/c8Wwbx7Xd2wpA5TkTCWqLacy
	RmlgFEcrjxEHPQbkKLPx4eabGVfMD52PZ5ugWwtVYPvXFtfClSfvbvdw2uczLbkQNfq8
	LQVKsEyyat2Bo9Rcjo4GufqdgnykmGTO3qpf1CTQI93OCmA5N+tB6HzHgsJC1y2SUBII
	rDmYm579Nxg58z6WAhJOSFPQPVwOvHOhO9232SIV2tdC9s2ltquednBzBAW4yItytBU5
	lTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xqBxHe0AJ2NRQH9JTUjhoKVm9F5YW0LRESqL3cf8OhA=;
	b=e9a9KKLcMeTwXbIHYZ/p8wqXtMZMLQsJXfMRODaDDMogDvBOJnjjPMnLgeXNi8nEMl
	RqpveByQAzMYdtjxn77pwIDt3+2in000QD1dyCm3BABMdJ4U5Wlyj28Kun8Ezd4rulV7
	CJfPCxU7cW/5T+f+zfD4OF4uLV1jQastMpKBup9vf7HMoig5h72BcZl6B7Hq9gYJc+kS
	PFcTOHHvKh5N9E7d/5Gwi8X4bvvbyZJu0RuFedFLqrTNAHH3BMPAmCu8ntgywrWA6NJ1
	JDJttsUFFXyBN7lRJk/DxCNKf5RGKjaVxoW54Q7OljRVi+VUBFHGw2+1WK+g0ERCssyJ
	uFuw==
X-Gm-Message-State: APjAAAW+U98kCYLc8GI6TKeDweKIVhZbc8kkhJHgrx7vU6jML3L1rw69
	3H8xBzBK+TCK/eRlUExPxaATE7cklOCw+133hbfjRsh7WFQ=
X-Google-Smtp-Source: APXvYqyaCG7U2yckh+XXa1yy2g+AklbGdiNE1lDyalI0JRpMwjeUWAghVsPaVXrtbBvSOGhflIg8Zno7j1LJred/TJk=
X-Received: by 2002:a5d:8597:: with SMTP id f23mr47554ioj.148.1554291396049;
	Wed, 03 Apr 2019 04:36:36 -0700 (PDT)
MIME-Version: 1.0
References: <1554280123-19112-1-git-send-email-vincent.prince.fr@gmail.com>
	<1554280123-19112-2-git-send-email-vincent.prince.fr@gmail.com>
	<20190403085651.GA6467@localhost>
	<CAB2nKc9hnDrOTtKjNfk1cupK0yv8xXksEuvURJtS6ve_baOpJQ@mail.gmail.com>
	<20190403111514.GA20836@localhost>
In-Reply-To: <20190403111514.GA20836@localhost>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Wed, 3 Apr 2019 13:36:24 +0200
Message-ID: <CAB2nKc-nz+YhZ9voQOSo=46gLhLoip5_GT2arkmT6jOGiyEo8w@mail.gmail.com>
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
X-List-Received-Date: Wed, 03 Apr 2019 11:36:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Adrien,

What I'm not sure to understand is in which case we use "_git.bb" instead
of having PV in filename.
If we use a release version, shouldn't we point to
https://github.com/zeromq/cppzmq/archive/v4.3.0.tar.gz?
And if we use git version, shouldn't we specify git commit hash to remove
any ambiguity between PV and SRCREV?
Do you know any convention is specified somewhere?

Regards,
Vincent

Le mer. 3 avr. 2019 =C3=A0 13:15, Adrian Bunk <bunk@stusta.de> a =C3=A9crit=
 :

> On Wed, Apr 03, 2019 at 12:42:13PM +0200, Vincent Prince wrote:
> > Then, it would need to rename cppzmq_git.bb into cppzmq_4.3.1.git or
> can we
> > just remove +git${SRCPV} part of PV?
> >
> > In following threads it seems first option should be chosen?
> >
> https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg=
120575.html
> >...
>
> That is about putting PV in the recipe filename instead of "git",
> in this case the discussion would be cppzmq_git.bb versus cppzmq_4.3.1.bb
>
> I am not aware of anyone arguing against PV having a proper
> version (without +git) for a release.
>
> > Le mer. 3 avr. 2019 =C3=A0 10:56, Adrian Bunk <bunk@stusta.de> a =C3=A9=
crit :
> > > On Wed, Apr 03, 2019 at 10:28:42AM +0200, Vincent Prince wrote:
> >...
> > > > diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> > > b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> > > > index 9aff59c..2f99417 100644
> > > > --- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> > > > +++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> > > > @@ -4,8 +4,8 @@ LICENSE =3D "MIT"
> > > >  LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Ddb174eaf7b55a34a7c89551197f66e94"
> > > >  DEPENDS =3D "zeromq"
> > > >
> > > > -SRCREV =3D "6aa3ab686e916cb0e62df7fa7d12e0b13ae9fae6"
> > > > -PV =3D "4.2.3+git${SRCPV}"
> > > > +SRCREV =3D "213da0b04ae3b4d846c9abc46bab87f86bfb9cf4"
> > > > +PV =3D "4.3.1+git${SRCPV}"
> > > >...
> > >
> > > These are the actual releases, PV should not say +git${SRCPV}
> > > for them.
> > >
> > > Not a bug you introduced, but can be fixed now.
> > >
> > > cu
> > > Adrian
>
> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>
>

