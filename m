Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 470EA6E630
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 17:25:38 +0000 (UTC)
Received: from svr-orw-fem-04.mgc.mentorg.com ([147.34.97.41])
	by relay1.mentorg.com with esmtp 
	id 1Zbtz8-0003mg-JB from Joe_MacDonald@mentor.com ;
	Tue, 15 Sep 2015 10:25:38 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 15 Sep 2015 10:25:38 -0700
Received: by burninator (Postfix, from userid 1000)	id C4FFE5803A2; Tue, 15
	Sep 2015 13:24:29 -0400 (EDT)
Date: Tue, 15 Sep 2015 13:24:29 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20150915172429.GJ8885@mentor.com>
References: <1441863496-7668-1-git-send-email-kai.kang@windriver.com>
	<20150914193728.GA8885@mentor.com> <55F7DC58.1050001@windriver.com>
	<CAMKF1sqP6OZbL+8-HrqMjV7FWz0+RPOSad8fO_+c7AgzvaCnuQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqP6OZbL+8-HrqMjV7FWz0+RPOSad8fO_+c7AgzvaCnuQ@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] iftop: 1.0pre2 -> 1.0pre4
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
X-List-Received-Date: Tue, 15 Sep 2015 17:25:41 -0000
X-Groupsio-MsgNum: 57374
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LG0Ll82vYr46+VA1"
Content-Disposition: inline

--LG0Ll82vYr46+VA1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] iftop: 1.0pre2 -> 1.0pre4] On 15.09.15 (=
Tue 09:52) Khem Raj wrote:

> On Tue, Sep 15, 2015 at 1:52 AM, Kang Kai <Kai.Kang@windriver.com> wrote:
> > Got it.
> >
> > For for iftop, it just update licensing text.
> >
> > ----------------------------
> > revision 1.3
> > date: 2014/01/01 14:50:05;  author: pdw;  state: Exp;  lines: +7 -8
> > Update to licensing text.  Patch by Robert Scheck <robert@fedoraproject=
=2Eorg>
> > ----------------------------
> >
>=20
> what was updated in essence is important here not logs

Yeah, I had hoped that would've come through in either the earlier link
or my referencing it here.  I inspected the change myself and the
changes are limited to replacing 'library' with 'lesser' and the street
address of the FSF in the GPL text, which isn't surprising, but that's
really the information that should have been communicated in the commit
log itself.

--=20
-Joe MacDonald.
:wq

--LG0Ll82vYr46+VA1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJV+FRNAAoJEEn8ffcsOfaWHUwH/Axgd32xnLwTU7a+rvTc2lzL
vN64fndaidZLG+4PjWzWSvtxNMMRGTE/9cD+ltowxDqz2y4tO5ekg6arAFYGvAwP
Eat4LeST6uyzKDJhDz/t1P9+9ewUKS1EGYu9YoqYFGwTc8eB5NwzHYrVOhmGi8Ru
YK7Age0Jek4h4QoKwn+rzd/8fh/gZgbibgcHegpRv0smgRz6y/leZwhQ18GvWOzn
rz+JNPiEnl1n7j75u9+1+IwqDYUE+lN51femZa8E7w/3P1Xhe5O5anLrKhJNTTl6
GcS+gSgQ1jAbAfbyBALda0d06qaqkaOSpXVkcLLnOWa/fiYVGQxjg/f+bP3Gv0Y=
=4Zym
-----END PGP SIGNATURE-----

--LG0Ll82vYr46+VA1--
