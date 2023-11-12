Return-Path: <jan.claussen10@web.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD77EC4167B
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 18:51:53 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by mx.groups.io with SMTP id smtpd.web11.20906.1699815106543008713
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 10:51:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=jan.claussen10@web.de header.s=s29768273 header.b=fFZuPtw0;
 spf=pass (domain: web.de, ip: 212.227.17.11, mailfrom: jan.claussen10@web.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1699815104; x=1700419904; i=jan.claussen10@web.de;
	bh=JKcxGBIbjKG2MQakEeRfpEF02grI2abXIayYFSMuRnM=;
	h=X-UI-Sender-Class:Date:From:To:Cc:In-Reply-To:References:
	 Subject;
	b=fFZuPtw0wtxMLhFEA0iWKRhN/cR0UryDn/fJJqyqayO+gEV0DMQrX0hx9mahgWMg
	 uJakq8MwG9i1TIDVfkOoaSGx/g29fzcdAsVIUAleKXL5EoQQXGYXT5R5E6tryxb7K
	 tZojwCJviwTpv3X6HDciC4kGIrIbzUrooM0isS2sdZoMODCH8mqh2WcEpkqoJEsFw
	 o1ZJ9pgbblmkQgTmbmGP222IArnqeX13amN3yrGEsfNQQbcO+yjUy3znPsL2wOzVL
	 xAAhgDUstpZNnF3BgP8QYiISfYOWalXcXQY5RUZ0mWRQDNE6Bm2z/D5IdJnfbwjOW
	 Txfmv10gqkeE7uHZ+A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from precision5810 ([31.29.47.11]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M8C09-1qy6hH0P6x-00571W; Sun, 12
 Nov 2023 19:51:44 +0100
Date: Sun, 12 Nov 2023 19:51:43 +0100
From: =?utf-8?Q?Jan_Clau=C3=9Fen?= <jan.claussen10@web.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: "=?utf-8?Q?openembedded-devel=40lists.openembedded.org?="
 <openembedded-devel@lists.openembedded.org>
Message-ID: <FA9B6E4D-2A1D-4EF4-A672-198CC3ED0021@getmailspring.com>
In-Reply-To: <CAMKF1spiKW6E=AzH7gbhSzva_qCT_4nBiQexA2sGvr09gyfs0g@mail.gmail.com>
References: <CAMKF1spiKW6E=AzH7gbhSzva_qCT_4nBiQexA2sGvr09gyfs0g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] recipes-support: Add btop
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="65511ebf_1454af96_4ea0"
X-Provags-ID: V03:K1:zBhn6UGJ6VEf5Ve48aKRRR9xopUCA6zhtGFB9Ql6LHQqY2IxUk9
 A5EMzhxbNsuFPvKFabR5Qqy/0cREUyiibE4jlj/rAkggbUcIypHmqciivZaRqcV+c8+sONb
 fRlSpzzjyGQlP2sPG3DDeOCTpiPC5w/u4BPuv1j4bpHCPKmneznWS4EXBfdn7Sek7eYaXHq
 7/LVnvm+KCgYy7aZiNy8Q==
UI-OutboundReport: notjunk:1;M01:P0:gJoibUhO2Ow=;lHRXKwNUQQueMfHMmmtZbW9pE8H
 bbT0voO9J74Upo/hPnEtmI1HrjFIpAB12WNPK32KeOedqIK8IOFyS0MiK9FstGjexw9Pr5f76
 RpZ5Yo7d1HtwV81Z3hj99log50yf/hgQ1hMD7cqwrma6r1znK1e8OQVxOGZIGJjQb3b4w7pp7
 nBfnhZkegdf9AaB3HDTKnZWRRfWZVgsFJFgyWeAOjuDPkcxXmCCqj31GO2J5kij8uUD6mFpFz
 2RWfTuEKzDFic/i7OuNeHUDew9kyu5OfGJPoZ727VU+zo3IHF3brb7JrRWUjCv1KRDMPoIxy6
 5GEPqfIhaSg4dQzYLmwvQ4DE7SnswGGTo05Du8wOZD0S/Gnya8VFONgk0pPH3S3EQk3clQVvx
 5HOgo2qv374pNZw6949JgoY0AcCNt9iep3va4Rq1CZj1AYvf1LthrNInno9DqfXEmkzRjaDbv
 0kj4A0tTIgtobQ6Gjr97F5Eqo+N/raTvi6Urs+h33QRMciK4BUtpHO5KylGs44CfXXLsHucrk
 Sz9XiPI3Im8JLcRhwwbqfjmaJLnI6zcKHDrYgZA+ZoaLVuQmNfZSEv6wQo2jcE+LIdc8hXZ4B
 DC0OovONo9agIbAvJLSHp4R5c2zIl9EAlhY5SBGFWc6LF5GBkhGff8XtyZADP1PGBpI/G56yz
 vEXfjCqMORBCeFM3UNFLOblhxjqYUl1a1ZlvZk1Gr7yRwbP6SJg094RybrFlWeQvpI0eYZxYV
 PGOCmmlNalXITCiBy2yyfUcbBke0at264/oGqYCqktxzmHO2asGWoOjL0TfrnCyt4ogPpztKR
 3M1AYizNfMEFtoVoB8DiYdDR6pXi0kQTEE8/973JdcbzK7NdTF8l7gJFJRndU6eWnGFyT7rH7
 jyPlDJHqM803nqcWcptnkrKyR0FyqeGkrw53Lkdms0zUqibucbmPYxWSNoJyHBeJErHDo1Tfk
 ffpNHQ==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 18:51:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106601

--65511ebf_1454af96_4ea0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

No, it is an issue I have with images for the Pi Zero. I haven't build an=
ything for musl at all, although it would probably a good choice for the =
Pi Zero.

I have no issues using Raspberry Pi OS or other distros btw, so the devic=
e is not the issue
On Nov. 12 2023, at 7:49 pm, Khem Raj <raj.khem=40gmail.com> wrote:
> hmm is that just seen with musl and works ok with glibc based images =3F=

>
> TCLIBC=3Dmusl bitbake core-image-base
> eg. will produce a musl based image which is expected to work
> On Sun, Nov 12, 2023 at 10:23=E2=80=AFAM Jan Clau=C3=9Fen <jan.claussen=
10=40web.de> wrote:
> >
> > Unfortunately I can't test it unless this gets solved (or I buy a dif=
ferent Raspberry Pi)
> >
> > https://github.com/agherzan/meta-raspberrypi/issues/1229
> >
> > On Nov. 12 2023, at 6:43 pm, Khem Raj <raj.khem=40gmail.com> wrote:
> >
> > TCLIBC=3Dmusl bitbake <recipe>
> >
> > On Sun, Nov 12, 2023 at 9:24=E2=80=AFAM Jan Clau=C3=9Fen <jan.clausse=
n10=40web.de> wrote:
> > >
> > > How to test it against musl btw=3F Build a musl-based system for Ra=
spberry Pi and see if it runs=3F
> > >
> > > On Nov. 12 2023, at 6:23 pm, Jan Clau=C3=9Fen <jan.claussen10=40web=
.de> wrote:
> > >
> > > Yes, the CMake support was added two months ago and the release is =
from 2022. Cmake is also not supported by the main developer who seems to=
 favor an advanced Makefile. In any case, it is easier to fix than the Ma=
kefile. I will go with the git version for now then until there is a new =
release.
> > >
> > > On Nov. 12 2023, at 6:20 pm, Khem Raj <raj.khem=40gmail.com> wrote:=

> > >
> > > On Sun, Nov 12, 2023 at 8:25=E2=80=AFAM Jan Clau=C3=9Fen <jan.claus=
sen10=40web.de> wrote:
> > > >
> > > > I am trying with the tarball but it is quite hard, since it doesn=
't come with a CMakeLists.txt.
> > > > There is a recipe here, but it involves a lot of patching which c=
ould potentially be painful to maintain
> > > >
> > > > https://github.com/aristocratos/btop/issues/330=23issuecomment-11=
23685779
> > > >
> > >
> > > is it because cmake support was added later =3F in that case maybe =
using
> > > git version is ok
> > >
> > > > On Nov. 11 2023, at 8:01 pm, Khem Raj <raj.khem=40gmail.com> wrot=
e:
> > > >
> > > > On Sat, Nov 11, 2023 at 10:38=E2=80=AFAM Jan Clau=C3=9Fen <jan.cl=
aussen10=40web.de> wrote:
> > > > >
> > > > > It also needs a utf-8 locale to work. Else you have to force ut=
f-8 mode with a flag. I haven't included this as dependency at this point=
.
> > > >
> > > > you want to express all that is needed to get it running amicably=
.
> > > > keeping in mind that we have glibc and musl based systems to serv=
ice
> > > > it will be good to check it on musl too.
> > > >
> > > > >
> > > > > On Nov. 11 2023, at 7:35 pm, Jan Clau=C3=9Fen <jan.claussen10=40=
web.de> wrote:
> > > > >
> > > > > Glad that it arrived now=21 This is a really great resource mon=
itor. It is building from the git repository. Do you think it is better t=
o use the release instead=3F
> > > > >
> > > > > On Nov. 11 2023, at 7:30 pm, Khem Raj <raj.khem=40gmail.com> wr=
ote:
> > > > >
> > > > > Thanks for your contribution Jan
> > > > >
> > > > > On Sat, Nov 11, 2023 at 10:26=E2=80=AFAM Jan Clau=C3=9Fen <jan.=
claussen10=40web.de> wrote:
> > > > > >
> > > > > > ---
> > > > > > meta-oe/recipes-support/btop/btop=5F1.2.13.bb =7C 23 ++++++++=
+++++++++++++
> > > > > > 1 file changed, 23 insertions(+)
> > > > > > create mode 100644 meta-oe/recipes-support/btop/btop=5F1.2.13=
.bb
> > > > > >
> > > > > > diff --git a/meta-oe/recipes-support/btop/btop=5F1.2.13.bb b/=
meta-oe/recipes-support/btop/btop=5F1.2.13.bb
> > > > > > new file mode 100644
> > > > > > index 000000000..f780a993a
> > > > > > --- /dev/null
> > > > > > +++ b/meta-oe/recipes-support/btop/btop=5F1.2.13.bb
> > > > > > =40=40 -0,0 +1,23 =40=40
> > > > > > +SUMMARY =3D =22Resource monitor that shows usage and stats f=
or processor, memory, disks, network and processes.=22
> > > > > > +HOMEPAGE =3D =22https://github.com/aristocratos/btop=22
> > > > > > +LICENSE =3D =22Apache-2.0=22
> > > > > > +LIC=5F=46ILES=5FCHKSUM =3D =22file://LICENSE;md5=3D3b83ef963=
87f14655fc854ddc3c6bd57=22
> > > > > > +SECTION =3D =22console/utils=22
> > > > > > +
> > > > > > +SRC=5FURI =3D =22git://github.com/aristocratos/btop.git;prot=
ocol=3Dhttps;branch=3Dmain=22
> > > > > > +SRCREV =3D =222a864f6f2ea60df16b3f015885eb3c18a48b9b78=22
> > > > > > +
> > > > > > +S =3D =22=24=7BWORKDIR=7D/git=22
> > > > > > +
> > > > > > +inherit cmake
> > > > > > +
> > > > > > +=46ILES:=24=7BPN=7D +=3D =22 =5C
> > > > > > + /usr/share/icons =5C
> > > > >
> > > > > Lets use =24=7Bdatadir=7D instead of hardcoded /usr/share
> > > > >
> > > > > > + /usr/share/icons/hicolor =5C
> > > > > > + /usr/share/icons/hicolor/48x48 =5C
> > > > > > + /usr/share/icons/hicolor/scalable =5C
> > > > > > + /usr/share/icons/hicolor/48x48/apps =5C
> > > > > > + /usr/share/icons/hicolor/48x48/apps/btop.png =5C
> > > > > > + /usr/share/icons/hicolor/scalable/apps =5C
> > > > > > + /usr/share/icons/hicolor/scalable/apps/btop.svg =5C
> > > > > > +=22
> > > > > > --
> > > > > > 2.42.0
> > > > > >
> > > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > > Links: You receive all messages sent to this group.
> > > > > > View/Reply Online (=23106559): https://lists.openembedded.org=
/g/openembedded-devel/message/106559
> > > > > > Mute This Topic: https://lists.openembedded.org/mt/102530478/=
1997914
> > > > > > Group Owner: openembedded-devel+owner=40lists.openembedded.or=
g
> > > > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-de=
vel/unsub =5Braj.khem=40gmail.com=5D
> > > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > >
>


--65511ebf_1454af96_4ea0
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>No, it is an issue I have with images for the Pi Zero. I haven't bui=
ld anything for musl at all, although it would probably a good choice for=
 the Pi Zero.</div><br><div>I have no issues using Raspberry Pi OS or oth=
er distros btw, so the device is not the issue</div><div class=3D=22gmail=
=5Fquote=5Fattribution=22>On Nov. 12 2023, at 7:49 pm, Khem Raj &lt;raj.k=
hem=40gmail.com&gt; wrote:</div><blockquote><div><div>hmm is that just se=
en with musl and works ok with glibc based images =3F</div><br><div>TCLIB=
C=3Dmusl bitbake core-image-base</div><br><div>eg. will produce a musl ba=
sed image which is expected to work</div><br><div>On Sun, Nov 12, 2023 at=
 10:23=E2=80=AFAM Jan Clau=C3=9Fen &lt;jan.claussen10=40web.de&gt; wrote:=
</div><div>&gt;</div><div>&gt; Unfortunately I can't test it unless this =
gets solved (or I buy a different Raspberry Pi)</div><div>&gt;</div><div>=
&gt; https://github.com/agherzan/meta-raspberrypi/issues/1229</div><div>&=
gt;</div><div>&gt; On Nov. 12 2023, at 6:43 pm, Khem Raj &lt;raj.khem=40g=
mail.com&gt; wrote:</div><div>&gt;</div><div>&gt; TCLIBC=3Dmusl bitbake &=
lt;recipe&gt;</div><div>&gt;</div><div>&gt; On Sun, Nov 12, 2023 at 9:24=E2=
=80=AFAM Jan Clau=C3=9Fen &lt;jan.claussen10=40web.de&gt; wrote:</div><di=
v>&gt; &gt;</div><div>&gt; &gt; How to test it against musl btw=3F Build =
a musl-based system for Raspberry Pi and see if it runs=3F</div><div>&gt;=
 &gt;</div><div>&gt; &gt; On Nov. 12 2023, at 6:23 pm, Jan Clau=C3=9Fen &=
lt;jan.claussen10=40web.de&gt; wrote:</div><div>&gt; &gt;</div><div>&gt; =
&gt; Yes, the CMake support was added two months ago and the release is f=
rom 2022. Cmake is also not supported by the main developer who seems to =
favor an advanced Makefile. In any case, it is easier to fix than the Mak=
efile. I will go with the git version for now then until there is a new r=
elease.</div><div>&gt; &gt;</div><div>&gt; &gt; On Nov. 12 2023, at 6:20 =
pm, Khem Raj &lt;raj.khem=40gmail.com&gt; wrote:</div><div>&gt; &gt;</div=
><div>&gt; &gt; On Sun, Nov 12, 2023 at 8:25=E2=80=AFAM Jan Clau=C3=9Fen =
&lt;jan.claussen10=40web.de&gt; wrote:</div><div>&gt; &gt; &gt;</div><div=
>&gt; &gt; &gt; I am trying with the tarball but it is quite hard, since =
it doesn't come with a CMakeLists.txt.</div><div>&gt; &gt; &gt; There is =
a recipe here, but it involves a lot of patching which could potentially =
be painful to maintain</div><div>&gt; &gt; &gt;</div><div>&gt; &gt; &gt; =
https://github.com/aristocratos/btop/issues/330=23issuecomment-1123685779=
</div><div>&gt; &gt; &gt;</div><div>&gt; &gt;</div><div>&gt; &gt; is it b=
ecause cmake support was added later =3F in that case maybe using</div><d=
iv>&gt; &gt; git version is ok</div><div>&gt; &gt;</div><div>&gt; &gt; &g=
t; On Nov. 11 2023, at 8:01 pm, Khem Raj &lt;raj.khem=40gmail.com&gt; wro=
te:</div><div>&gt; &gt; &gt;</div><div>&gt; &gt; &gt; On Sat, Nov 11, 202=
3 at 10:38=E2=80=AFAM Jan Clau=C3=9Fen &lt;jan.claussen10=40web.de&gt; wr=
ote:</div><div>&gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; It also =
needs a utf-8 locale to work. Else you have to force utf-8 mode with a fl=
ag. I haven't included this as dependency at this point.</div><div>&gt; &=
gt; &gt;</div><div>&gt; &gt; &gt; you want to express all that is needed =
to get it running amicably.</div><div>&gt; &gt; &gt; keeping in mind that=
 we have glibc and musl based systems to service</div><div>&gt; &gt; &gt;=
 it will be good to check it on musl too.</div><div>&gt; &gt; &gt;</div><=
div>&gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; On Nov. 11 2023, at=
 7:35 pm, Jan Clau=C3=9Fen &lt;jan.claussen10=40web.de&gt; wrote:</div><d=
iv>&gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; Glad that it arrived=
 now=21 This is a really great resource monitor. It is building from the =
git repository. Do you think it is better to use the release instead=3F</=
div><div>&gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; On Nov. 11 202=
3, at 7:30 pm, Khem Raj &lt;raj.khem=40gmail.com&gt; wrote:</div><div>&gt=
; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; Thanks for your contributi=
on Jan</div><div>&gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; On Sat=
, Nov 11, 2023 at 10:26=E2=80=AFAM Jan Clau=C3=9Fen &lt;jan.claussen10=40=
web.de&gt; wrote:</div><div>&gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; =
&gt; &gt; &gt; ---</div><div>&gt; &gt; &gt; &gt; &gt; meta-oe/recipes-sup=
port/btop/btop=5F1.2.13.bb =7C 23 +++++++++++++++++++++</div><div>&gt; &g=
t; &gt; &gt; &gt; 1 file changed, 23 insertions(+)</div><div>&gt; &gt; &g=
t; &gt; &gt; create mode 100644 meta-oe/recipes-support/btop/btop=5F1.2.1=
3.bb</div><div>&gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; &gt=
; diff --git a/meta-oe/recipes-support/btop/btop=5F1.2.13.bb b/meta-oe/re=
cipes-support/btop/btop=5F1.2.13.bb</div><div>&gt; &gt; &gt; &gt; &gt; ne=
w file mode 100644</div><div>&gt; &gt; &gt; &gt; &gt; index 000000000..f7=
80a993a</div><div>&gt; &gt; &gt; &gt; &gt; --- /dev/null</div><div>&gt; &=
gt; &gt; &gt; &gt; +++ b/meta-oe/recipes-support/btop/btop=5F1.2.13.bb</d=
iv><div>&gt; &gt; &gt; &gt; &gt; =40=40 -0,0 +1,23 =40=40</div><div>&gt; =
&gt; &gt; &gt; &gt; +SUMMARY =3D =22Resource monitor that shows usage and=
 stats for processor, memory, disks, network and processes.=22</div><div>=
&gt; &gt; &gt; &gt; &gt; +HOMEPAGE =3D =22https://github.com/aristocratos=
/btop=22</div><div>&gt; &gt; &gt; &gt; &gt; +LICENSE =3D =22Apache-2.0=22=
</div><div>&gt; &gt; &gt; &gt; &gt; +LIC=5F=46ILES=5FCHKSUM =3D =22file:/=
/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57=22</div><div>&gt; &gt; &g=
t; &gt; &gt; +SECTION =3D =22console/utils=22</div><div>&gt; &gt; &gt; &g=
t; &gt; +</div><div>&gt; &gt; &gt; &gt; &gt; +SRC=5FURI =3D =22git://gith=
ub.com/aristocratos/btop.git;protocol=3Dhttps;branch=3Dmain=22</div><div>=
&gt; &gt; &gt; &gt; &gt; +SRCREV =3D =222a864f6f2ea60df16b3f015885eb3c18a=
48b9b78=22</div><div>&gt; &gt; &gt; &gt; &gt; +</div><div>&gt; &gt; &gt; =
&gt; &gt; +S =3D =22=24=7BWORKDIR=7D/git=22</div><div>&gt; &gt; &gt; &gt;=
 &gt; +</div><div>&gt; &gt; &gt; &gt; &gt; +inherit cmake</div><div>&gt; =
&gt; &gt; &gt; &gt; +</div><div>&gt; &gt; &gt; &gt; &gt; +=46ILES:=24=7BP=
N=7D +=3D =22 =5C</div><div>&gt; &gt; &gt; &gt; &gt; + /usr/share/icons =5C=
</div><div>&gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &gt; Lets use =24=
=7Bdatadir=7D instead of hardcoded /usr/share</div><div>&gt; &gt; &gt; &g=
t;</div><div>&gt; &gt; &gt; &gt; &gt; + /usr/share/icons/hicolor =5C</div=
><div>&gt; &gt; &gt; &gt; &gt; + /usr/share/icons/hicolor/48x48 =5C</div>=
<div>&gt; &gt; &gt; &gt; &gt; + /usr/share/icons/hicolor/scalable =5C</di=
v><div>&gt; &gt; &gt; &gt; &gt; + /usr/share/icons/hicolor/48x48/apps =5C=
</div><div>&gt; &gt; &gt; &gt; &gt; + /usr/share/icons/hicolor/48x48/apps=
/btop.png =5C</div><div>&gt; &gt; &gt; &gt; &gt; + /usr/share/icons/hicol=
or/scalable/apps =5C</div><div>&gt; &gt; &gt; &gt; &gt; + /usr/share/icon=
s/hicolor/scalable/apps/btop.svg =5C</div><div>&gt; &gt; &gt; &gt; &gt; +=
=22</div><div>&gt; &gt; &gt; &gt; &gt; --</div><div>&gt; &gt; &gt; &gt; &=
gt; 2.42.0</div><div>&gt; &gt; &gt; &gt; &gt;</div><div>&gt; &gt; &gt; &g=
t; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</div><div>&gt; &gt;=
 &gt; &gt; &gt; Links: You receive all messages sent to this group.</div>=
<div>&gt; &gt; &gt; &gt; &gt; View/Reply Online (=23106559): https://list=
s.openembedded.org/g/openembedded-devel/message/106559</div><div>&gt; &gt=
; &gt; &gt; &gt; Mute This Topic: https://lists.openembedded.org/mt/10253=
0478/1997914</div><div>&gt; &gt; &gt; &gt; &gt; Group Owner: openembedded=
-devel+owner=40lists.openembedded.org</div><div>&gt; &gt; &gt; &gt; &gt; =
Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =5B=
raj.khem=40gmail.com=5D</div><div>&gt; &gt; &gt; &gt; &gt; -=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</div><div>&gt; &gt; &gt; &gt; &gt;</div></d=
iv></blockquote>
--65511ebf_1454af96_4ea0--


