Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5P3x-0004zE-BC
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 23:05:53 +0200
Received: by fxm19 with SMTP id 19so2481769fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 14:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=zoqHrbX6BecE1cD/l86niHLn40ZJG0gNcPGJ/HrYVKs=;
	b=WPRONyro5bBoQkuRk/t9TXBf0z8ZDqfRTZtX+kVZ/UkBB4mEON7QRpIlcL6TcYJcEN
	3VAodSTcyBZk8XdovSttZvbM7ZSLDe31VtUUuR7PgoKl+pCEIy/01Z76EYQtZRe/rl1V
	GLGMth51xHdhsHu6DrYK86tvn58cA4TqtIN7Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=JQqpxUOE0Wfee3P7qGSpv11T2xPin2SeaC+flZLxZp2dSthZQc2gcVMHa7yx3RnZ5/
	3RWX7ySqGDfg07LR7TkBaKPnKH63012XEaN61kx5aVSyyq5Dsf4Da6czAAc8ZHUzOQ9F
	Z2eeYp6bVVFhGOzaQNCDvi9Z1ug/SHxOVBMLI=
Received: by 10.223.14.137 with SMTP id g9mr1972233faa.8.1301605433093; Thu,
	31 Mar 2011 14:03:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.23.136 with HTTP; Thu, 31 Mar 2011 14:03:23 -0700 (PDT)
In-Reply-To: <20110331205342.GH3745@jama.jama.net>
References: <cover.1301560589.git.Martin.Jansa@gmail.com>
	<dff2afec47fd746f45b9f630bf14755f40a8fdc5.1301560589.git.Martin.Jansa@gmail.com>
	<AANLkTikvnKY+hdT9ck4TpG9vvTR9MHKvLxgjRGHjKY2R@mail.gmail.com>
	<20110331205342.GH3745@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 Mar 2011 14:03:23 -0700
Message-ID: <AANLkTi=T+7_bep7Hy3MfSgQNAWXjyo49wUut+S8iN-qn@mail.gmail.com>
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
X-List-Received-Date: Thu, 31 Mar 2011 21:05:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2011 at 1:53 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Thu, Mar 31, 2011 at 01:40:38PM -0700, Khem Raj wrote:
>> On Thu, Mar 31, 2011 at 2:14 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>
>> I hope you made sure that all license files in a package source are chec=
ksummed.
>
> I've added LICENSE file only in case that package sources doesn't have
> any licensing information (simple scripts without header etc) like in
> this case
> http://git.shr-project.org/git/?p=3Dillume-keyboards.git;a=3Dtree
>
> For all e-wm/efl/illume related recipes we have mostly in meta-shr I've
> used LICENSE file from enlightenment repo, because our versions usually
> just modifies original versions a bit so for me as not-a-lawyer-at-all
> it makes sense to use same LICENSE.


thats fine as long as we dont miss any new licenses. You can also chop of
portions of source files with startline and endline in checksumming license=
s
if there is no explicit LICENSE file

>
> Cheers,
>
>> whole series is ok where I had question I replied to individual patch
>>
>> Acked-by: Khem Raj <raj.khem@gmail.com>
>>
>> > ---
>> > =C2=A0.../recipes-efl/e17/illume-keyboards-shr/LICENSE =C2=A0 | =C2=A0=
 25 ++++++++++++++++++++
>> > =C2=A0.../recipes-efl/e17/illume-keyboards-shr_git.bb =C2=A0 =C2=A0| =
=C2=A0 =C2=A07 +++--
>> > =C2=A02 files changed, 29 insertions(+), 3 deletions(-)
>> > =C2=A0create mode 100644 meta-efl/recipes-efl/e17/illume-keyboards-shr=
/LICENSE
>> >
>> > diff --git a/meta-efl/recipes-efl/e17/illume-keyboards-shr/LICENSE b/m=
eta-efl/recipes-efl/e17/illume-keyboards-shr/LICENSE
>> > new file mode 100644
>> > index 0000000..61bb2f6
>> > --- /dev/null
>> > +++ b/meta-efl/recipes-efl/e17/illume-keyboards-shr/LICENSE
>> > @@ -0,0 +1,25 @@
>> > +Copyright notice for Enlightenment:
>> > +
>> > +Copyright (C) 2000-2010 Carsten Haitzler and various contributors (se=
e AUTHORS)
>> > +
>> > +All rights reserved.
>> > +
>> > +Redistribution and use in source and binary forms, with or without
>> > +modification, are permitted provided that the following conditions ar=
e met:
>> > +
>> > + =C2=A0 1. Redistributions of source code must retain the above copyr=
ight
>> > + =C2=A0 =C2=A0 =C2=A0notice, this list of conditions and the followin=
g disclaimer.
>> > + =C2=A0 2. Redistributions in binary form must reproduce the above co=
pyright
>> > + =C2=A0 =C2=A0 =C2=A0notice, this list of conditions and the followin=
g disclaimer in the
>> > + =C2=A0 =C2=A0 =C2=A0documentation and/or other materials provided wi=
th the distribution.
>> > +
>> > +THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTI=
ES,
>> > +INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABIL=
ITY AND
>> > +FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL TH=
E
>> > +COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
>> > +INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, =
BUT NOT
>> > +LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,=
 DATA,
>> > +OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEOR=
Y OF
>> > +LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
>> > +NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SO=
FTWARE,
>> > +EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
>> > diff --git a/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb b/me=
ta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb
>> > index fe34513..e3b182d 100644
>> > --- a/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb
>> > +++ b/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb
>> > @@ -1,15 +1,16 @@
>> > =C2=A0SECTION =3D "x11/data"
>> >
>> > =C2=A0SRC_URI =3D "git://git.shr-project.org/repo/illume-keyboards.git=
;protocol=3Dhttp;branch=3Dmaster \
>> > - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Makefile-update-KEYBO=
ARDS_DIR-for-new-illume2.patch"
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Makefile-update-KEYBO=
ARDS_DIR-for-new-illume2.patch \
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://LICENSE"
>> > =C2=A0S =3D "${WORKDIR}/git"
>> >
>> > =C2=A0SRCREV =3D "4064489f359a1addf572089b582f317dff5f50e1"
>> > =C2=A0PV =3D "0.0+gitr${SRCPV}"
>> > =C2=A0PE =3D "1"
>> > =C2=A0PR =3D "r4"
>> > -LICENSE =3D "unknown"
>> > -
>> > +LICENSE =3D "MIT BSD"
>> > +LIC_FILES_CHKSUM =3D "file://${WORKDIR}/LICENSE;md5=3Df523ab5986cc79b=
52a90d2ac3d5454a2"
>> >
>> > =C2=A0PACKAGES =3D "\
>> > =C2=A0illume-keyboard-alpha \
>> > --
>> > 1.7.4.1
>> >
>> >
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>> >
>
> --
> Martin 'JaMa' Jansa =C2=A0 =C2=A0 jabber: Martin.Jansa@gmail.com
>


