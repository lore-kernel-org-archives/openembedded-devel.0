Received: from mail-qw0-f43.google.com ([209.85.216.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sylvain.pare@gmail.com>) id 1R0ssH-0008FV-G4
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Sep 2011 12:27:25 +0200
Received: by qwm42 with SMTP id 42so5779137qwm.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Sep 2011 03:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=lnFEIfgCbo5sj2Yes+HxTKl+1ePODnG6NdOikTibehc=;
	b=l6ubXuppqE02qlKgL8V8RbMol6cghKnKrjXTQ+RdOwqNhgBFBL40h4hPyIjLfS3FEv
	oQ1RiMSJh+clUYPGKG7Rq/B1cNYeZ8pWk00B8EnWcvKUhQrP00Oe/Vre+PA02IbZkbsZ
	QILcwoqh/Q1S8X2oUJlCA/UH9duD0Zy/cPgRI=
Received: by 10.229.21.20 with SMTP id h20mr2196092qcb.265.1315304544126; Tue,
	06 Sep 2011 03:22:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.88.144 with HTTP; Tue, 6 Sep 2011 03:22:04 -0700 (PDT)
In-Reply-To: <1315304074.4717.6.camel@mattotaupa>
References: <CACrTVgL3To0AH5H35aBYSuhVif8EK69eAaf2DeB+-7z-y8hDVA@mail.gmail.com>
	<1315304074.4717.6.camel@mattotaupa>
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Tue, 6 Sep 2011 12:22:04 +0200
Message-ID: <CACrTVgJnDNks+eJhBP4Pj8o6PLqaZi2sVR62Nw67jKz=Sqj4iA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] binutils_2.21: recipes updates to new version 2.21.1
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
X-List-Received-Date: Tue, 06 Sep 2011 10:27:25 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Dear Paul,

thank you. I was just seing these *@# line breaks..
So yes I will use git-send.

So about my patch I re-send a new one right?

Sylvain

2011/9/6 Paul Menzel <paulepanter@users.sourceforge.net>

> Dear Sylvain,
>
>
> thank you for your patch.
>
> Am Dienstag, den 06.09.2011, 11:58 +0200 schrieb Sylvain Par=E9:
>
> 1. Please use
>
>        binutils*: Update to version 2.21.1
>
> as the commit summary. It is clear that a recipe is updated because of
> the prefix with the recipe name.
>
> > Signed-off-by: Sylvain 'GarthPS' Par=E9 <sylvain.pare@gmail.com>
>
> 2. Unfortunately Google Mail mangled your patch again by adding line
> breaks. Please use `git send-email =85` or a =93better=94 mail program/MU=
A to
> fix this.
>
> > ---
> >  recipes/binutils/binutils-cross-sdk_2.21.1.bb |    2 ++
> >  recipes/binutils/binutils-cross-sdk_2.21.bb   |    2 --
> >  recipes/binutils/binutils-cross_2.21.1.bb     |    2 ++
> >  recipes/binutils/binutils-cross_2.21.bb       |    2 --
> >  recipes/binutils/binutils_2.21.1.bb           |   21
> +++++++++++++++++++++
> >  recipes/binutils/binutils_2.21.bb             |   21
> ---------------------
> >  6 files changed, 25 insertions(+), 25 deletions(-)
> >  create mode 100644 recipes/binutils/binutils-cross-sdk_2.21.1.bb
> >  delete mode 100644 recipes/binutils/binutils-cross-sdk_2.21.bb
> >  create mode 100644 recipes/binutils/binutils-cross_2.21.1.bb
> >  delete mode 100644 recipes/binutils/binutils-cross_2.21.bb
> >  create mode 100644 recipes/binutils/binutils_2.21.1.bb
> >  delete mode 100644 recipes/binutils/binutils_2.21.bb
>
> [=85]
>
> 3. Please use `git format-patch -M -M -C -C -C =85` (I do not know if you
> need to duplicate the option) to create patches when you move something.
> The shown differences will be smaller and this is easier to review.
>
>
> Thanks,
>
> Paul
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>

