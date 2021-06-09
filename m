Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web12.549.1623269496110813861
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jun 2021 13:11:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=GFiqoMva;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.208.49, mailfrom: brgl@bgdev.pl)
Received: by mail-ed1-f49.google.com with SMTP id cb9so30008926edb.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jun 2021 13:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i4OwQZRCR1oYdHbUrQ9SbGDzVM3i3HGz+2aYNDVfkEY=;
        b=GFiqoMvaLVZuUwjwTyyA0tGj92c0LlUwBn3JltGxjvvLjrNvuNPKIxPn9MkUQfYCeo
         wHKWOvcV0sZcEyGLlEOt64+nb5JeDu8zqpDo4J5b2BqMUCdhBomFXE6tWw/TLCtOg5QR
         z0HfBcIgJmycAJuwP4/VcAKEyCvQqZqUDGENZeWVEKT6lFXQIPC2U3oSBbDcZP99BFBZ
         I5AjD0MpMWiaxHh/XQnDJTMEBlGsKi/Q6wb19ojdQbqJdV2uav3JHpW0iyV2F0SXG6Ro
         ecVZrFudWlJ0ds429IRKtgd+HVdtIs26KyuazDObGxMEInIAOSh6DOlA+xmov0XQVpvg
         424Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i4OwQZRCR1oYdHbUrQ9SbGDzVM3i3HGz+2aYNDVfkEY=;
        b=ZxmhKj7rr3dRlY+YObYFmqajuSOHcYaVy3tQVKsZLnHN6k8+TNBUdMHvfeaiCfBE/t
         TFf4GnDZigFPoPNNayKYAVnE3BL03iC5qwoN1jVhAfg7z+d2rQ8crN6Jx1sij2WSUgPc
         hN072XbcKgGdH1wF9QLpIq53JNeGq9gHkBTMBdkqrHPyKXvTMOGCkOUi5p6KMgE1JQNd
         EYaEnqVILAIzTyRTNVvU6cTyJ6+JDFMv6HBbK3IVItaoi81Yq8lZN6n7fI1jtKBPrcYs
         3xxjPHtN3YjoZ1mo6yHppWvfcQFrKiejdHjMI8wfEKDr0vjInrdfk8PmaTndeUYK3+7u
         0v4A==
X-Gm-Message-State: AOAM533yowTi0BZaqbwQm7FGGBEJDx093Lw/qRIVl72e1qkHtSb5cAQZ
	5GDxIFFGMNfiMvHDadwmvipoE8rhjorjSPpBfLzv0w==
X-Google-Smtp-Source: ABdhPJxUHt7To+pvJvszOWKusdOFV5SwKE0M7NqF7Mt3480szJrXdjp/ryp10mlH29To2DTLtKFVx9/vB0rAA2LPOI4=
X-Received: by 2002:a05:6402:26c2:: with SMTP id x2mr1167903edd.124.1623269494296;
 Wed, 09 Jun 2021 13:11:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210609193144.25592-1-brgl@bgdev.pl> <CAMKF1spCeKarT1kcVtbyorKjwjzV6Ydx5t8TLiJH6zUbwmPbmQ@mail.gmail.com>
In-Reply-To: <CAMKF1spCeKarT1kcVtbyorKjwjzV6Ydx5t8TLiJH6zUbwmPbmQ@mail.gmail.com>
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
Date: Wed, 9 Jun 2021 22:11:23 +0200
Message-ID: <CAMRc=Mfy8NDdmM32pYUSJUTDTm41VQ64scO-DSOEcNBE3qnCfg@mail.gmail.com>
Subject: Re: [PATCH] libgpiod: update my email address
To: Khem Raj <raj.khem@gmail.com>
Cc: Armin Kuster <akuster808@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 9, 2021 at 9:55 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, Jun 9, 2021 at 12:31 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > I now maintain the project and this recipe in my own time. Update my
> > email address in the AUTHOR field.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> >  meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
> > index bb586b681..2d63d83e9 100644
> > --- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
> > +++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
> > @@ -1,5 +1,5 @@
> >  SUMMARY = "C library and tools for interacting with the linux GPIO character device"
> > -AUTHOR = "Bartosz Golaszewski <bgolaszewski@baylibre.com>"
> > +AUTHOR = "Bartosz Golaszewski <brgl@bgdev.pl>
>
> its missing closing quote, I have fixed it locally and staged it.
>
> >
> >  LICENSE = "LGPLv2.1+"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
> > --
> > 2.30.1
> >


Thank you and sorry.

Bart
