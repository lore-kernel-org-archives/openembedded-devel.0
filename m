Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id A8F777FBFA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 09:28:46 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id u17so5703060ilq.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Dec 2019 01:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=zp1BNRnGEADOPjknh19jC8akvw07pwNFJYEhGDgURx4=;
	b=Ch/I2lYIAGOJkj1sNNfcj2+YXAMFUvzEFeaxOEn0+lToAvgDVi5Yhn9tkD7pnnI1E+
	+00dFRWBSVCZrUHmOsuX+zsLyRjxMTJWWbFuDy0U3E1FJNLA3OlZfJwTrG+mxWn/6ls3
	sCMFaen1zifWPyTx7ST8tEW7lRShXtpNqXWyfVLtaHwybg5CEe6fwWfkOVpn2ufdmKtn
	T2IVASAOp+iAO9S4Kvh0UEt3O0gWbHJpW/ufNqZgaHQPlSaF/2U7FA7GIhYw4TCopHYJ
	HY145Xl6u/s8xTAesw9cltc8rj9vVOWftMWtGFQOvMNI2cMadp7wQtz5+rbOh3exDNn5
	BmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=zp1BNRnGEADOPjknh19jC8akvw07pwNFJYEhGDgURx4=;
	b=H1d/Tk5ZXCYvugGzI1XN6xuMAT/Ev6+h5Lf+wGHxRZd8B2q3sr2FOE9RP/EVxsofGf
	Lx80P4pr+Bm9VeffQfqad2xoyLy+86TXSOQxJZ4nkEkuGzAxIojqfS880Exa23P/i72B
	EhC8amoX9jvOmsY6zpjLqiaxn5ygp5cih5HiffYV+gboSPuS6CctcemI2Knlq40zCEM2
	DqgcCasPjG5/MSjKSIHdnaL20G1GJHC23/OVwZdpQYRpEJNUo6HSc5y2nggd4/6fhgvS
	UMcFCTwa0uOfkdH1gr0j49MUaePCP4mg71fMGV2q/+sqhdK1TggXUgK83HsnfbKieVCC
	3zyw==
X-Gm-Message-State: APjAAAVzl/lNxwjIAS7LYvbCwWXv78OKvUnnu7A3y4f1HQ9Lp9Fa5Ft1
	xKZ1aLro6Y9GniTW/zXWYVHPsBACneq4ieou0bQ=
X-Google-Smtp-Source: APXvYqyG1TsLbo5cko9iiJQSjCiivCp5R4K1JBtrSq/wZWy96WnbMe86Qmf8hmRqOFYHpzzqF5J2MCoWZTftmRG+eXA=
X-Received: by 2002:a92:405a:: with SMTP id n87mr13417951ila.299.1575624527560;
	Fri, 06 Dec 2019 01:28:47 -0800 (PST)
MIME-Version: 1.0
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
	<20191206000912.19841-22-schnitzeltony@gmail.com>
	<CAMKF1sroq9=eexVrX0QHH2-287rXQkg48pAVqCNjiyL5MA3GWw@mail.gmail.com>
In-Reply-To: <CAMKF1sroq9=eexVrX0QHH2-287rXQkg48pAVqCNjiyL5MA3GWw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 6 Dec 2019 10:28:36 +0100
Message-ID: <CALbNGRRy1-DBAGPS1K7UiidugsP7Kwctn8P-NGiosTYMosZ1dw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 21/21] Add: packagegroup-gnome-apps / packagegroup-gnome-desktop
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
X-List-Received-Date: Fri, 06 Dec 2019 09:28:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 6, 2019 at 9:01 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Dec 5, 2019 at 4:12 PM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> >  .../packagegroups/packagegroup-gnome-apps.bb  | 20 ++++++++++++++
> >  .../packagegroup-gnome-desktop.bb             | 26 +++++++++++++++++++
> >  2 files changed, 46 insertions(+)
> >  create mode 100644 meta-gnome/recipes-support/packagegroups/packagegro=
up-gnome-apps.bb
> >  create mode 100644 meta-gnome/recipes-support/packagegroups/packagegro=
up-gnome-desktop.bb
> >
> > diff --git a/meta-gnome/recipes-support/packagegroups/packagegroup-gnom=
e-apps.bb b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-app=
s.bb
> > new file mode 100644
> > index 000000000..d7f1df8f2
> > --- /dev/null
> > +++ b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.=
bb
> > @@ -0,0 +1,20 @@
> > +SUMMARY =3D "GNOME applications"
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade69=
8e0bcf8506ecda2f7b4f302"
> > +
> > +inherit packagegroup features_check
> > +
> > +REQUIRED_DISTRO_FEATURES =3D "x11"
> > +
> > +RDEPENDS_${PN} =3D " \
> > +    evolution-data-server \
> > +    evince \
> > +    file-roller \
> > +    gedit \
> > +    gnome-font-viewer \
> > +    gnome-system-monitor \
> > +    gnome-terminal \
> > +    libwnck3 \
> > +    nautilus \
> > +    wv \
>
> wv provider recipe is missing,
Oops - it is in meta-office - will move it here because that's what I
have tested the series with

Andreas

