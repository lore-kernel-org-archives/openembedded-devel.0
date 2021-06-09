Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.340.1623268523019855223
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jun 2021 12:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bNVH78Cv;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id c124so24956325qkd.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jun 2021 12:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ewLZkNOBug9LMObs7eMVQowTRP/aCGXwycXy3jIy1SA=;
        b=bNVH78Cv0aejlB30ldqhWHYflJV71V879ZvoJTx+Kjf8UpzYAox0c1GtNEOuS2ksXF
         0QdeK8HpQvUoX804e4Zzm6H8bMBgG5yZmR79LOLrO0/ndIKiORtsNM50hR4qX+wfMhpp
         quiK0YMfF7xGMz6FpCIwbAR1VBvvDptvme7rMJ3u/Qg5HnLlF/Sun/02rshoPZNtlaeU
         TaZfs6ggcnwylOWlZnmsKptEkNJkJdI0HGw1pLNdvatQJren59x6HsQdz67zDj6/naye
         lSCJYRTIluoQon3A/2qnX4LehnnfY8170+vScZ5mno/xxAG+mArVR7/9AuL73rSlPBNS
         sN8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ewLZkNOBug9LMObs7eMVQowTRP/aCGXwycXy3jIy1SA=;
        b=KAoYFDXK2HWzSd/faf4H+JazbprMIJmaUO+DUo/trd56L82oRkjXMSEaVdy9QMZ4B0
         dP9FMTqOKvTTkv+LJvdSSLcPZDJHGN/Fa40xMm6LtyxtPKEHeti2RjtxXOBpEpYE3xj7
         /bIwbNRnSuQDK0p2gGxeu1JMpLncbyVV0vw/TgbI5eVVuUK6dKqJW+jCEHlJ8wQCqVHL
         bdm2dpyeayTV0hI9V5AQpvvBaOmolHinwrtvrNdXJqafyxpeiPoEmzvzB70aYEJI2cxl
         hlMenLyxPRRkZIYicNQ0jqfBm0R4t+ylotWou8vTIcsi9qxz/Mr4//tFT4y+66AP6uLA
         yzgw==
X-Gm-Message-State: AOAM532vjBQRwITfxjmzHPdA7Rl+pYn0RwQP8gJyVSrRNn042FjIiAF7
	ycZJoUTozlDQzRxAdMsr6AHjH8jOuLiAy7M8JyE=
X-Google-Smtp-Source: ABdhPJybsTc0gdPXDy0BxNbmEtHCmpg+Yz7bnTCaSQmIg+is8Ex58kR1FRFQ5H67R5lwXcQtMdl3VBl0+oHEpqrNGl0=
X-Received: by 2002:a37:855:: with SMTP id 82mr1345735qki.25.1623268522052;
 Wed, 09 Jun 2021 12:55:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210609193144.25592-1-brgl@bgdev.pl>
In-Reply-To: <20210609193144.25592-1-brgl@bgdev.pl>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 9 Jun 2021 12:54:55 -0700
Message-ID: <CAMKF1spCeKarT1kcVtbyorKjwjzV6Ydx5t8TLiJH6zUbwmPbmQ@mail.gmail.com>
Subject: Re: [PATCH] libgpiod: update my email address
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Armin Kuster <akuster808@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 9, 2021 at 12:31 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> I now maintain the project and this recipe in my own time. Update my
> email address in the AUTHOR field.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
> index bb586b681..2d63d83e9 100644
> --- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
> @@ -1,5 +1,5 @@
>  SUMMARY = "C library and tools for interacting with the linux GPIO character device"
> -AUTHOR = "Bartosz Golaszewski <bgolaszewski@baylibre.com>"
> +AUTHOR = "Bartosz Golaszewski <brgl@bgdev.pl>

its missing closing quote, I have fixed it locally and staged it.

>
>  LICENSE = "LGPLv2.1+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
> --
> 2.30.1
>
