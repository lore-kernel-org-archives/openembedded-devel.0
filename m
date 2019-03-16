Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6A2F3605BA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2019 16:55:26 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id v20so13562643qtv.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2019 09:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=xi7pIHd3cuAtChisR3b3AjIu3FRRLoB7jlYSusBe4Ys=;
	b=Uys2hE388OaAnPP3UmKCf9IgrM3fUDCHoaNhxJwUXdCAdw4F7Ty4hRZUVqe51ZFaVY
	8vfgjT0PaWnCQgUYk+jPPgnnLtHHDxiLMGqQFDy3hDkABJpMQaE6mBH1sC0QhZPZ2ui7
	4c8X/Cc293QKgIhIThh2JA+9GpkOJWfABoyS6CNTTjAl1yBWVqrX491LWRjCAshUWqgA
	L9Kpkx3a38GYeXbSc3cbBmJYDQ5sOvG7RSkCwPWmEWryQ+xYWYlLm7dnhPPBQ0/MgtAm
	lx6Otyf1q1wrl/OH9Brrc1beTxzdy3SoMA+wW3ttQELuHRSX86jJeNkdRMqbW1ZG88KM
	3sWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=xi7pIHd3cuAtChisR3b3AjIu3FRRLoB7jlYSusBe4Ys=;
	b=YmE6gQ0LxGgItefDhaLCagVMOv90U6ZoMg/B/267nQEgCDZSNqp5zx66iERK9bkPJw
	fwrvEKG8ODA0j5uT9SExALd5zSMcUHJ4l5aRV9noYFr2BnBFw2EOnHYsKLaUJMr3M/gw
	0YCg4MxOK0yVQFHZuoyCODmOCulX75hrdHH88WBot2AfFItNTMktLT8nV5UIEslakwXz
	xs3ttnKct6DPvOmLGhwgNUnajxogttBoFkru/0ZQ4z79Q+hOcPUXFjiJej+6a5l7wfpt
	qa17oZlx2Wtcrp0uoNxH/fHUbm+3pRsyPD4Wcm+7MGR99kXjjx3s3AReNUGcVLMYfBTi
	YnsA==
X-Gm-Message-State: APjAAAWDdebgJlL9nyAbNxjrObXoJIDISMERTwsp0pTo6+KMbAisde43
	dTJr4XKxZCNz0kE/QpCnQgvXYVHMTbaTgtm53pc=
X-Google-Smtp-Source: APXvYqxP3o2E3BfODfIZ/5H4UxQd88C16oQ7YontqfoAKO6LC1Gm+n/0j9nxxkb1gcoqc+NcIsIwNdFAuCnr0mPobOg=
X-Received: by 2002:aed:3a09:: with SMTP id n9mr7323886qte.196.1552755327107; 
	Sat, 16 Mar 2019 09:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190316080428.36688-1-raj.khem@gmail.com>
	<CALbNGRQwWcwBjXPmtusLirywo=Tw2gV40PFDxCF6Kn8ZkS5F1A@mail.gmail.com>
	<CALbNGRRz4k-xRCBSOOF1PsoJ1p_porgc7kKcOoW4ctXCD9HFvg@mail.gmail.com>
In-Reply-To: <CALbNGRRz4k-xRCBSOOF1PsoJ1p_porgc7kKcOoW4ctXCD9HFvg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 16 Mar 2019 09:55:01 -0700
Message-ID: <CAMKF1spX7gfga6kz6mzigtLwv4nMOfhHtNRBeM_b9XU1kmeD4Q@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] xfce4-mixer: Remove recipe
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
X-List-Received-Date: Sat, 16 Mar 2019 16:55:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 16, 2019 at 2:32 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Sat, Mar 16, 2019 at 10:09 AM Andreas M=C3=BCller <schnitzeltony@gmail=
.com> wrote:
> >
> > On Sat, Mar 16, 2019 at 9:04 AM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > xfce4-mixer can be replaced with xfce4-pulseaudio-plugin
> > >
> > NAK - it works perfectly fine and xfce4-pulseaudio-plugin is not a
> > replacement because it is sitting on top of pulseaudio. Pulseaudio is
> > poison if you want to produce music (alll the jack based  stuff)
> >
> I am tired of useless discussions - seems the priorities of this
> project do not match mine anymore: I'll create a layer for gstreamer /
> xfce-mixer and all the music stuff I collected in meta-qt5-extra.
>
There is a reason why I Cc'ed you on the patches and that is to
consider your priorities on the contrary.
Adrian summed it up, but the motivation was to remove gstreamer 0.10
and this is only recipe which require it, so I was wondering if there was
a better way to deal with it, e.g. may be xfc4-mixer has  support for
gstreamer 1.x or some such. as gst 0.10.x get aged, it is often that
it
has to be fixed to keep going as we change things like compiler verisons
adding new architectures which don't support it etc.

> So have fun...
>
> Andreas

