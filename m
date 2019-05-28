Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-it1-f178.google.com (mail-it1-f178.google.com
	[209.85.166.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7FF547D6A2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 06:19:47 +0000 (UTC)
Received: by mail-it1-f178.google.com with SMTP id m140so2195718itg.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 23:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nhC2m6vSgxrXIZVdFlRqr7PNBNbJYXGuVRp+s3MyjgI=;
	b=Z1SxfCFbL1Ggn9euKcGDHmc5Tn9ccKt7QN5RkMK8/URo0fY4/LjMDi6lznWH+kRKXe
	VMJxDR0PsUTEPo3UF/CfD4K83XjrI0hD2CISRGwbxUhwlyxw08W10e7AI2xnPPOMtKWX
	K25x15usTDUCpjQiT2tCxp7X79mPnSYwuKn5mcWB96I29HKF7p/dg6p2spO5y8J6HLTD
	sEzb/T651/7ZotZBwFtbftnP/IuwyG340wZOPk76Uoya7DI/k/mHALh+BEgTN6DY6KEA
	FnlFXNMNHd3qmeDjqdEfR6xpn6TpQoTsf/wBIH5V2hyKt8iOSkdYSZqv1hqkEIk23N6X
	3rkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nhC2m6vSgxrXIZVdFlRqr7PNBNbJYXGuVRp+s3MyjgI=;
	b=dmo6M97Disru2bPwn/6xJ095nouGHrzgxAcqVwfNwDDxqjyLOlalmfObSozjlF8yiA
	CWSY7i1ESHB4lXNU5rLWSy9CEyvipu6njhyL1itYxFYjRlD2171X8E2G0IGGWM1+huUF
	hcGov/vymVwe7VhkgNTxpc0INlp9etletXVi6xGk1eRWHWAbZejA0HcblVRPgDSf2IMM
	dWUG/3b1aj7Z8loDw5DFnvvTc3NxTWn4B4OmL53OLfgskOhIAQckXs4CuMFpjX2JHwmJ
	sQ2iTg/R5D6BbTw8I69yq9S5H5qydRbTIDeLUykw85IuhRLdX3W9n0PdFCFw/I3Fvikq
	DQ/Q==
X-Gm-Message-State: APjAAAVdH6o/6Wyift4paZbCGY3XoNwLT9Cl//VZNHf41AZ3MS/sq8RC
	+Xq+1OpkJvRJDT70naY+xxd0V4ytsQb6qZ6zheQ=
X-Google-Smtp-Source: APXvYqy05XCRnYkJKlnjEZz2xde0sQA4TJ4b0WwHmqsnMD5zbbFm2X5Mbhwh43XRVz9Q0Yfl6GEMmq/ilXKv2lVwgeg=
X-Received: by 2002:a02:a806:: with SMTP id f6mr5591416jaj.74.1559024388320;
	Mon, 27 May 2019 23:19:48 -0700 (PDT)
MIME-Version: 1.0
References: <1554298095-26709-3-git-send-email-vincent.prince.fr@gmail.com>
	<20190528032730.lzggdqsjix56r6fo@apollo>
In-Reply-To: <20190528032730.lzggdqsjix56r6fo@apollo>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Tue, 28 May 2019 08:19:36 +0200
Message-ID: <CAB2nKc8S-2WawRE+TqgnAqJESJv_UXci7WmrNA10rVMhhMt3cw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [meta-oe,v2,2/3] cppzmq: bump version 4.2.3 => 4.3.1
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
X-List-Received-Date: Tue, 28 May 2019 06:19:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

It was a mistake in v1 and v2, latest release is 4.3.0 which was corrected
in v3.
Is it ok for you?

Rergards,
Vincent


Le mar. 28 mai 2019 =C3=A0 05:27, Khem Raj <raj.khem@gmail.com> a =C3=A9cri=
t :

> On Wed, Apr 03, 2019 at 03:28:14PM +0200, Vincent Prince wrote:
> > Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
> > ---
> > Changes in v2:
> >  - Remove git SRCPV from PV
> >
> >  meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> > index 9aff59c..95b5215 100644
> > --- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> > +++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> > @@ -4,8 +4,8 @@ LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddb174eaf7b55a34a7c89551197f=
66e94"
> >  DEPENDS =3D "zeromq"
> >
> > -SRCREV =3D "6aa3ab686e916cb0e62df7fa7d12e0b13ae9fae6"
> > -PV =3D "4.2.3+git${SRCPV}"
> > +SRCREV =3D "213da0b04ae3b4d846c9abc46bab87f86bfb9cf4"
> > +PV =3D "4.3.1"
>
> Can you rebase this on top of latest master and resend, I merged an
> older patch which bumped it to 4.3.0
>
> >
> >  SRC_URI =3D "git://github.com/zeromq/cppzmq.git"
> >
> > @@ -13,6 +13,8 @@ S =3D "${WORKDIR}/git"
> >
> >  inherit cmake
> >
> > +EXTRA_OECMAKE =3D "-DCPPZMQ_BUILD_TESTS=3DOFF"
> > +
> >  PACKAGES =3D "${PN}-dev"
> >
> >  RDEPENDS_${PN}-dev =3D "zeromq-dev"
>

