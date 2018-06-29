Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 818E574CB8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 14:48:34 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id v16-v6so2388694vkd.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 07:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=jZtUxeqIaIFLifqCHzRNaFQwqEgWJnxGLPzAjePOUdI=;
	b=gNa6ahDuKeUMtu+8apjB7wQ5sESrNEfsRh6fKdZ8LnfmoPRFU5S5RNmSMiCC8JzTCI
	u/VOesTltUDY7jOsWjf4xe4ymyeDyczxTrTNWh0NidPJN95WkrXt4r8c30XDlnMb+GNN
	dicTm2P7ZlXvnn57byOdYl7x8sB2iOlfPgyxd9C0RwetWuj/KUHMTNVQ9m4TB6qhItYf
	awQZblcrTS024AmK2CzdK6O2C6qS6DdSGND9OZJ381Mt9QCrkFrrMKvWO+AyFVKQNa75
	sdk/YtSulm3C5o1nPACwHlEj1j4kdv2NFcdFGj4mNm/kUYD3zz4GXz/YvKRzPT7k3RPD
	gGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=jZtUxeqIaIFLifqCHzRNaFQwqEgWJnxGLPzAjePOUdI=;
	b=dex3btasgBxlyztDQ/tyarWTfIIl2Y0YBDf5zGtpc/O2kaCHGT5ANc3bheK2Zcs9iW
	ClazS4ic7SSk1fkmhj0d6d0cxEhN2SlLODxMOHh2c6ufHHLv6VKiUBLPni2nscafJ1kk
	bS6iJIvrcWgfRKVBtdUJ6QmW5jDA4wf8FrsqS0HoNAG86gUOyybKCRXggSnjJXD5Ozmk
	oirZkHKFYcrwmllsV6KTzXngW2yEr14NW3UIhP95/QY7fTke/W5cUhHb51eu2mbYlo/s
	rIMrBCs7ykbVhEOawHv4sYXvW8JoJWCyWia2v7RJUssWwwKGEnzl3v+aJCiC+2rKnn6v
	/UjA==
X-Gm-Message-State: APt69E01f+4punoiv5y+2aPz7OPswU68lAxjSUuDfj7REunLaO2QG+hL
	/etieFEdrhzVdjn2VNKUwvKAlUQ4vVjKRU0YKuo=
X-Google-Smtp-Source: AAOMgpe3d/wSlbp2yNSmNQeWrY7aO/m8DD47l7VdYN4b5PeDROMPb2U+bWnswC/l1I09gW4McNf/37nvfg/zdxlv8KY=
X-Received: by 2002:a1f:e605:: with SMTP id d5-v6mr9030247vkh.4.1530283713920; 
	Fri, 29 Jun 2018 07:48:33 -0700 (PDT)
MIME-Version: 1.0
References: <20180629101758.28179-1-alexandru.vasiu@ni.com>
	<CAMKF1sq6Q1p0fpzVzA0U3b-t6N3ieSDme6B5-ZaK0tLBazz8PQ@mail.gmail.com>
	<MWHPR04MB097618A7658FEC9BA2B59757984E0@MWHPR04MB0976.namprd04.prod.outlook.com>
In-Reply-To: <MWHPR04MB097618A7658FEC9BA2B59757984E0@MWHPR04MB0976.namprd04.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Jun 2018 07:47:48 -0700
Message-ID: <CAMKF1spePt0Zm3eqagOmjoyzMHqTrokwGGdGRXMX80deEbHEnQ@mail.gmail.com>
To: Alexandru Vasiu <alexandru.vasiu@ni.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][meta-python][PATCH] python-pyiface: Upgrade to 0.0.6
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
X-List-Received-Date: Fri, 29 Jun 2018 14:48:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

Please add a line or two about why license checksum has changed and
resend the patch
On Fri, Jun 29, 2018 at 7:15 AM Alexandru Vasiu <alexandru.vasiu@ni.com> wr=
ote:
>
> I fixed getIfaces which returns all network interfaces from system. [1]
>
>
> Alex
>
>
> [1] - https://github.com/bat-serjo/PyIface/pull/11
>
>
>
>
> ________________________________
> From: Khem Raj <raj.khem@gmail.com>
> Sent: Friday, June 29, 2018 4:45 PM
> To: Alexandru Vasiu
> Cc: openembeded-devel
> Subject: Re: [oe] [meta-oe][meta-python][PATCH] python-pyiface: Upgrade t=
o 0.0.6
>
> On Fri, Jun 29, 2018 at 3:26 AM Alexandru Vasiu <alexandru.vasiu@ni.com> =
wrote:
> >
> > Signed-off-by: Alexandru Vasiu <alexandru.vasiu@ni.com>
> > ---
> >  meta-python/recipes-devtools/python/python-pyiface.inc      | 6 +++---
> >  .../{python-pyiface_0.0.5.bb =3D> python-pyiface_0.0.6.bb}    | 0
> >  .../{python3-pyiface_0.0.5.bb =3D> python3-pyiface_0.0.6.bb}  | 0
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> >  rename meta-python/recipes-devtools/python/{python-pyiface_0.0.5.bb =
=3D> python-pyiface_0.0.6.bb} (100%)
> >  rename meta-python/recipes-devtools/python/{python3-pyiface_0.0.5.bb =
=3D> python3-pyiface_0.0.6.bb} (100%)
> >
> > diff --git a/meta-python/recipes-devtools/python/python-pyiface.inc b/m=
eta-python/recipes-devtools/python/python-pyiface.inc
> > index 620b244c6..8e464a83f 100644
> > --- a/meta-python/recipes-devtools/python/python-pyiface.inc
> > +++ b/meta-python/recipes-devtools/python/python-pyiface.inc
> > @@ -3,9 +3,9 @@ SECTION =3D "devel/python"
> >  HOMEPAGE =3D "https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__p=
ypi.python.org_pypi_pyiface_&d=3DDwIBaQ&c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZ=
ZuIPelcSjixA&r=3DV3-K-8AFkhBUtg_ELgwyZIouJ7keS5Dl3C5-KCLlJq8&m=3D5tZAgNTd4p=
-RmB66oCdSleVt6GidTOAE_lcaJiI5KLI&s=3DvAz7s9Lx6KxR7duweLBdBkFuJ4wXLJnWdXwP7=
8oEIX4&e=3D"
> >  LICENSE =3D "GPLv3+"
> >
> > -LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D4fe869ee987a340198fb0d5=
4c55c47f1"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dfe06497acaf4f45999925d3=
48c2605f9"
> >
> what changed here ?
>
> > -SRC_URI[md5sum] =3D "06c3c71fe51df740dae6a88a13afb5e0"
> > -SRC_URI[sha256sum] =3D "4bb79100cbcf7344a1ccaddc578cd6455da47d8eac6eb1=
bf903ec32e043af924"
> > +SRC_URI[md5sum] =3D "2379d8d4506e6c4d83cf3d4824abce8b"
> > +SRC_URI[sha256sum] =3D "774ea47bb1387e493f6d5d0937b68fa28202c948eccddb=
d6e4cf2d708dcd86f2"
> >
> >  inherit pypi
> > diff --git a/meta-python/recipes-devtools/python/python-pyiface_0.0.5.b=
b b/meta-python/recipes-devtools/python/python-pyiface_0.0.6.bb
> > similarity index 100%
> > rename from meta-python/recipes-devtools/python/python-pyiface_0.0.5.bb
> > rename to meta-python/recipes-devtools/python/python-pyiface_0.0.6.bb
> > diff --git a/meta-python/recipes-devtools/python/python3-pyiface_0.0.5.=
bb b/meta-python/recipes-devtools/python/python3-pyiface_0.0.6.bb
> > similarity index 100%
> > rename from meta-python/recipes-devtools/python/python3-pyiface_0.0.5.b=
b
> > rename to meta-python/recipes-devtools/python/python3-pyiface_0.0.6.bb
> > --
> > 2.18.0
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedde=
d.org_mailman_listinfo_openembedded-2Ddevel&d=3DDwIBaQ&c=3DI_0YwoKy7z5LMTVd=
yO6YCiE2uzI1jjZZuIPelcSjixA&r=3DV3-K-8AFkhBUtg_ELgwyZIouJ7keS5Dl3C5-KCLlJq8=
&m=3D5tZAgNTd4p-RmB66oCdSleVt6GidTOAE_lcaJiI5KLI&s=3DcJjM59nw1Gsf8kbrzR07Sz=
nshRlnyt9NTHExIi4LP1I&e=3D

