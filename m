Return-Path: <williamdelacre@gmail.com>
Received: from mail-vk0-f49.google.com (mail-vk0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6722278D6F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 16:25:37 +0000 (UTC)
Received: by mail-vk0-f49.google.com with SMTP id t4-v6so2716308vke.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 09:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=a8AJcBXx/9lI4Tk7avjB6WzkOfZYYIczGcd/PxVeJ8A=;
	b=UM1rA6dLVjgrywfQYL3VRTpYRiA/3SivAmCCcObEzGIPX8cGkaGpTSDLd8m5TFyPvF
	0OC675nVi5VFfuLbFVCHk9aJOQmuNm7Iy3IQNYTt+9QaZUsdWpoMc5J+OmsPEgmw8kfL
	g+EB6J9Kylp0W173NtGr15E8a/EFzKkJbyNLwQv+98Oh06GpRt+0pPogvd8H1i83GSU1
	bdqeVfTWOoi89w9lQ5nUl3ScRra8y1UsqG+4odh5rDFU7bDljmNzutFFgHY9aIh55E7b
	n7a8HGa1QDDx+7rr8VDE5yWsmTbweM7G0LY3yp4e/ghyAe1Ebmowys4hQ7lIt8mW76Av
	88mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=a8AJcBXx/9lI4Tk7avjB6WzkOfZYYIczGcd/PxVeJ8A=;
	b=XIORER73T31WLT+Ca3RItEgPOH3BeISMzDtDN7Y+QYijLDkppGEW8ohyAZbfkV9m4h
	D4vOgI5plgBVNR5iJVWp9OgLfKcnyLMkcRFuibHXYX33mnEvhzGf38kkMkF5wLr0y+fk
	Ickn0Qq5EIFijQP4EvM2Yzotu7qJbRGuMLZvMpeSIibC8GYNBzR0VNgXiq1bibdIftNA
	f8tdd1cIOMQO6LbS4TqP37nypdV/7907q5A0vBUcqylP58y8iwv1vY8ouQg1S9P/f1bs
	5ChDtq9oTAnboS2aHM16OrjvuHwNJXqCd4qR22AY/nAB7j2ziEUrhgBupLaPCZBoko9+
	4Few==
X-Gm-Message-State: AOUpUlGp9f81+SCyokKP69lOot0X/cppOpFimsMOqqjGoDht3fBUa51h
	nbFBxSk3OjdngGMT5l7HkYjcjRRHuEneBL2g86o=
X-Google-Smtp-Source: AAOMgpcpMhL1SfOt9hFLlIVxOGicygW31jdCz5OtRJ4dTl4+59FsaVekBR9qwFP3dshZg1SYAHKfim+zO7rXSJw0KEE=
X-Received: by 2002:a1f:3b43:: with SMTP id
	i64-v6mr4247514vka.152.1532708738272; 
	Fri, 27 Jul 2018 09:25:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAOnRZELTeZbVDTo_eT_r6e6EG6et0vs7O_mT_fpqJ_RpoVhk2Q@mail.gmail.com>
	<CAPuovE+nMp9xaj_gusMTGM9_ChFuuHDzc9NKBRYZMX493DbU=Q@mail.gmail.com>
	<CAOnRZEJ7iVfFxr4e=6VcjCCpi4uERXhv-e8FZgMuAQv6XD2GXQ@mail.gmail.com>
	<1748388.J95ykxND2L@yow-masselst-lx1>
In-Reply-To: <1748388.J95ykxND2L@yow-masselst-lx1>
From: William Delacre <williamdelacre@gmail.com>
Date: Fri, 27 Jul 2018 18:25:27 +0200
Message-ID: <CAOnRZEKK9xiSzTFH0+RQJxPzu2=qaEuNhYHKv4jFY0MPh-eWtw@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: (No subject)
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
X-List-Received-Date: Fri, 27 Jul 2018 16:25:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Okay, it makes sense!

My question may seem stupid but then why don=E2=80=99t we always use =E2=80=
=98-native=E2=80=99 for
the dependencies ?

Is it because sometimes we know that the behavior of =E2=80=98foo=E2=80=99 =
and =E2=80=98foo-native=E2=80=99
would be the same, independently of the architecture ?

William

Le ven. 27 juil. 2018 =C3=A0 18:16, Mark Asselstine <
mark.asselstine@windriver.com> a =C3=A9crit :

> On Friday, July 27, 2018 12:04:37 PM EDT William Delacre wrote:
> > Thanks a lot for the answer, it worked perfectly !
> >
> > There is just one point I don=E2=80=99t really understand : why do we n=
eed to
> add a
> > dependency to =E2=80=98python-incremental-NATIVE=E2=80=99 ?
> >
> > What would happen if I just add to the python-twisted recipe :
> >
> > DEPENDS +=3D =E2=80=9C${PYTHON_PN}-incremental=E2=80=9C
>
> This would assume that python is completely arch independent, which it is
> not.
> Assume for example python-incremental had some C extensions, using DEPEND=
S
> would build them for the target arch yet possibly attempt to run them on
> your
> build host. -native takes care of this.
>
> Some may say this is a bit of a hack since the difference in ARCH *might*
> equate to a difference in behavior. But I have dealt with many python
> recipes
> and have yet to run into any scenario where this potential issue exists.
>
> At least that is what I can recall at the moment. Unfortunately I have
> forgotten some of the subtleties that might be in play.
>
> Mark
>
> >
> > William
> >
> > Le ven. 27 juil. 2018 =C3=A0 17:03, Mark Asselstine <
> >
> > mark.asselstine@windriver.com> a =C3=A9crit :
> > > On Thu, Jul 26, 2018 at 3:40 PM, Mark Asselstine
> > >
> > > <mark.asselstine@windriver.com> wrote:
> > > > On Mon, Jul 23, 2018 at 8:28 AM, William Delacre
> > > >
> > > > <williamdelacre@gmail.com> wrote:
> > > >> Hi ! :-)
> > > >>
> > > >> I=E2=80=99m facing issues when trying to run =E2=80=98bitbake pyth=
on-twisted=E2=80=99
> > >
> > > (do_compile
> > >
> > > >> error)
> > > >>
> > > >> Log says :
> > > >> =E2=80=9CDownload error on https://pypi.python.org/simple/incremen=
tal/:
> [Errno
> > >
> > > -3]
> > >
> > > >> Temporary failure in name resolution
> > >
> > > With the additional info you sent me along with a second look at the
> > > error I can fairly confidently say I know what the issue is.
> > >
> > > Python, like some other languages (ruby, go...) will attempt to
> > > download dependencies/requirements if they are not present. This is
> > > done "outside" of the bitbake system and thus will ignore
> > > BB_NO_NETWORK and is generally a bad thing. It isn't quite host
> > > contamination but it is very similar. What we do with our python
> > > recipes in bitbake is review a python package's source setup.py,
> > > requirements.txt...files in order to determine what other python
> > > packages are needed, add them as RDEPENDS or similar in order to avoi=
d
> > > the python attempting to complete a download such as this.
> > >
> > > In this case python-twisted 'requires' python-incremental but the
> > > Rocko version of the python-twisted recipe lacks the needed assignmen=
t
> > > to ensure this is available in the recipe sysroot and thus the
> > > attempted download.
> > >
> > > Cherry pick commit b08b570c8624303acbb6bb064a7bda466a679df4
> > > [python-twisted: avoid downloading build dependencies] to Rocko and
> > > you will be good to go. You should also follow up this thread with a
> > > request to have this commit put onto Rocko to avoid others hitting th=
e
> > > same issue.
> > >
> > > Mark
> > >
> > > >> ............
> > > >>
> > > >> distutils.errors.DistutilsError : Could not find suitable
> distribution
> > >
> > > for
> > >
> > > >> Requirement.parse(=E2=80=98incremental>=3D16.10.1=E2=80=99)=E2=80=
=9D
> > > >>
> > > >> First of all I=E2=80=99m not connected to internet, so I=E2=80=99v=
e pre-downloaded
> all
> > >
> > > the
> > >
> > > >> required packages (twisted-17.9.0.tar.bz2 &
> incremental-17.5.0.tar.gz
> > >
> > > are
> > >
> > > >> present in my build/downloads folder)
> > > >>
> > > >> It=E2=80=99s the first time I have some =E2=80=9Cdownloading issue=
s=E2=80=9D and I=E2=80=99m stuck
> on
> > > >> it
> > > >> for a few hours now..
> > > >>
> > > >> Any tips for me ?
> > > >
> > > > Check all aspects of what you have manually downloaded and populate=
d
> > > > in your downloads. My guess is that a checksum or some other detail
> > > > isn't matching and it is rejecting what you have and thus attemptin=
g
> > > > to re-download the file.
> > > >
> > > > Mark
> > > >
> > > >> Thanks in advance !
> > > >> --
> > > >> _______________________________________________
> > > >> Openembedded-devel mailing list
> > > >> Openembedded-devel@lists.openembedded.org
> > > >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>
>
>

