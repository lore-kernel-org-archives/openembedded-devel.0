Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5PDi-0005oA-1k
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 23:15:58 +0200
Received: by fxm19 with SMTP id 19so2488640fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 14:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=DbLiIvFSIddyEndtXPGkwi4DRhao2txY3XLQejowjgA=;
	b=odf9/spw2SnoJufSxwjggM1vg3L2cOa6OsGe7w1xWe20ZBasYpmAl1rAeO5ZYzl923
	eWeWw5dYFUqhfD3x5IKkFqSyC16Y6TOr7Ort7Uu+z2lmKYLw1NHtph10WDtZNBd5xqE1
	EDJfhuUHNXXZD2FVbcNXitS21FZ3Yf5oA2QV4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=jEIUtzjkRdecpC/oO1aRR7Khn+eAtRHlo/9UPVUg/mCvls1Np1xfRYwlzc3W/zgQpS
	C18oCK9qi+dezydJdPlWkP5yBwE2thuuJeIC0PeMa8iHZ7gaGUUHTpr62TbbqD/yTe6b
	ZOuKo/52Lh/SbROLb+KsnZg3M+5wc7fpew1Wo=
Received: by 10.223.29.4 with SMTP id o4mr1722426fac.27.1301606037104; Thu, 31
	Mar 2011 14:13:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.23.136 with HTTP; Thu, 31 Mar 2011 14:13:27 -0700 (PDT)
In-Reply-To: <20110331211144.GI3745@jama.jama.net>
References: <cover.1301560589.git.Martin.Jansa@gmail.com>
	<dff2afec47fd746f45b9f630bf14755f40a8fdc5.1301560589.git.Martin.Jansa@gmail.com>
	<AANLkTikvnKY+hdT9ck4TpG9vvTR9MHKvLxgjRGHjKY2R@mail.gmail.com>
	<20110331205342.GH3745@jama.jama.net>
	<AANLkTi=T+7_bep7Hy3MfSgQNAWXjyo49wUut+S8iN-qn@mail.gmail.com>
	<20110331211144.GI3745@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 Mar 2011 14:13:27 -0700
Message-ID: <AANLkTi=hbfe5cqqjEO0LuNc9H3tsmb3c885UgGVRBYwp@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/8] illume-keyboards-shr: add LICENSE
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
X-List-Received-Date: Thu, 31 Mar 2011 21:15:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2011 at 2:11 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Thu, Mar 31, 2011 at 02:03:23PM -0700, Khem Raj wrote:
>> On Thu, Mar 31, 2011 at 1:53 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>> > On Thu, Mar 31, 2011 at 01:40:38PM -0700, Khem Raj wrote:
>> >> On Thu, Mar 31, 2011 at 2:14 AM, Martin Jansa <martin.jansa@gmail.com=
> wrote:
>> >> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> >>
>> >> I hope you made sure that all license files in a package source are c=
hecksummed.
>> >
>> > I've added LICENSE file only in case that package sources doesn't have
>> > any licensing information (simple scripts without header etc) like in
>> > this case
>> > http://git.shr-project.org/git/?p=3Dillume-keyboards.git;a=3Dtree
>> >
>> > For all e-wm/efl/illume related recipes we have mostly in meta-shr I'v=
e
>> > used LICENSE file from enlightenment repo, because our versions usuall=
y
>> > just modifies original versions a bit so for me as not-a-lawyer-at-all
>> > it makes sense to use same LICENSE.
>>
>>
>> thats fine as long as we dont miss any new licenses. You can also chop o=
f
>> portions of source files with startline and endline in checksumming lice=
nses
>> if there is no explicit LICENSE file
>
> I know and I've used this in couple of recipes already, but there
> sometimes there really is nothing..

if there is nothing then let it be so I would think and state no license

>
>> > Cheers,
>> >
>> >> whole series is ok where I had question I replied to individual patch
>> >>
>> >> Acked-by: Khem Raj <raj.khem@gmail.com>
>> >>
>> >> > ---
>> >> > =C2=A0.../recipes-efl/e17/illume-keyboards-shr/LICENSE =C2=A0 | =C2=
=A0 25 ++++++++++++++++++++
>> >> > =C2=A0.../recipes-efl/e17/illume-keyboards-shr_git.bb =C2=A0 =C2=A0=
| =C2=A0 =C2=A07 +++--
>> >> > =C2=A02 files changed, 29 insertions(+), 3 deletions(-)
>> >> > =C2=A0create mode 100644 meta-efl/recipes-efl/e17/illume-keyboards-=
shr/LICENSE
>> >> >
>> >> > diff --git a/meta-efl/recipes-efl/e17/illume-keyboards-shr/LICENSE =
b/meta-efl/recipes-efl/e17/illume-keyboards-shr/LICENSE
>> >> > new file mode 100644
>> >> > index 0000000..61bb2f6
>> >> > --- /dev/null
>> >> > +++ b/meta-efl/recipes-efl/e17/illume-keyboards-shr/LICENSE
>> >> > @@ -0,0 +1,25 @@
>> >> > +Copyright notice for Enlightenment:
>> >> > +
>> >> > +Copyright (C) 2000-2010 Carsten Haitzler and various contributors =
(see AUTHORS)
>> >> > +
>> >> > +All rights reserved.
>> >> > +
>> >> > +Redistribution and use in source and binary forms, with or without
>> >> > +modification, are permitted provided that the following conditions=
 are met:
>> >> > +
>> >> > + =C2=A0 1. Redistributions of source code must retain the above co=
pyright
>> >> > + =C2=A0 =C2=A0 =C2=A0notice, this list of conditions and the follo=
wing disclaimer.
>> >> > + =C2=A0 2. Redistributions in binary form must reproduce the above=
 copyright
>> >> > + =C2=A0 =C2=A0 =C2=A0notice, this list of conditions and the follo=
wing disclaimer in the
>> >> > + =C2=A0 =C2=A0 =C2=A0documentation and/or other materials provided=
 with the distribution.
>> >> > +
>> >> > +THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED WARRA=
NTIES,
>> >> > +INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTA=
BILITY AND
>> >> > +FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL=
 THE
>> >> > +COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIREC=
T,
>> >> > +INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDIN=
G, BUT NOT
>> >> > +LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF U=
SE, DATA,
>> >> > +OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY TH=
EORY OF
>> >> > +LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDI=
NG
>> >> > +NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS=
 SOFTWARE,
>> >> > +EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
>> >> > diff --git a/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb b=
/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb
>> >> > index fe34513..e3b182d 100644
>> >> > --- a/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb
>> >> > +++ b/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb
>> >> > @@ -1,15 +1,16 @@
>> >> > =C2=A0SECTION =3D "x11/data"
>> >> >
>> >> > =C2=A0SRC_URI =3D "git://git.shr-project.org/repo/illume-keyboards.=
git;protocol=3Dhttp;branch=3Dmaster \
>> >> > - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Makefile-update-KE=
YBOARDS_DIR-for-new-illume2.patch"
>> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Makefile-update-KE=
YBOARDS_DIR-for-new-illume2.patch \
>> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://LICENSE"
>> >> > =C2=A0S =3D "${WORKDIR}/git"
>> >> >
>> >> > =C2=A0SRCREV =3D "4064489f359a1addf572089b582f317dff5f50e1"
>> >> > =C2=A0PV =3D "0.0+gitr${SRCPV}"
>> >> > =C2=A0PE =3D "1"
>> >> > =C2=A0PR =3D "r4"
>> >> > -LICENSE =3D "unknown"
>> >> > -
>> >> > +LICENSE =3D "MIT BSD"
>> >> > +LIC_FILES_CHKSUM =3D "file://${WORKDIR}/LICENSE;md5=3Df523ab5986cc=
79b52a90d2ac3d5454a2"
>> >> >
>> >> > =C2=A0PACKAGES =3D "\
>> >> > =C2=A0illume-keyboard-alpha \
>> >> > --
>> >> > 1.7.4.1
>> >> >
>> >> >
>> >> > _______________________________________________
>> >> > Openembedded-devel mailing list
>> >> > Openembedded-devel@lists.openembedded.org
>> >> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-de=
vel
>> >> >
>> >
>> > --
>> > Martin 'JaMa' Jansa =C2=A0 =C2=A0 jabber: Martin.Jansa@gmail.com
>> >
>
> --
> Martin 'JaMa' Jansa =C2=A0 =C2=A0 jabber: Martin.Jansa@gmail.com
>


