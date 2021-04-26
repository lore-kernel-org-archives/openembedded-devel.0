Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web09.460.1619395575380953497
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:06:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OmPPqqFW;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id j19so149816qtx.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Apr 2021 17:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bF3QFt3sZeIWda2AhzTuxjb30kCW3pPymgb8AiD4ENI=;
        b=OmPPqqFWCvxVnoXEPo43liE8aQEbi7dVA2xwucX8c/M0VB7dtyVzrZq9ZZisrY5BFO
         91fOmZJs2l5MAc4q1LX3u/lPIhgFhTGxTW9Mit2yF5IXTNflxywI23SdMbtl2b3FLXKs
         /Y1dQVf7VjZVvLzhoE8ttsK6DuE94vqpbmGn3t6OzeAhwRK1RcdbRjpnHZ4SOHxXbRiC
         RyWeF3v+fx4+shOGH5gxdddyZtfBlVRUZwD09PzC1jNt8EORr4wxVpR7ns8SGi/CQVn7
         tuahKpfP/bMyXQ5beGHDSlZ7yOzyCz1qeBW38Vnt+0qTO3/eIx74h6qclx6xkpYnHEcF
         V0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bF3QFt3sZeIWda2AhzTuxjb30kCW3pPymgb8AiD4ENI=;
        b=owyjhI+fdnpJB2W0P747fwZkH89OvgWFgifxuIhKuXZzDbd27e+0zYERqi1CNscwUZ
         fBadfepqAmcN9XSbYUhc6XX/UkNahjcihXyivfHEV+CUFIkmbB5kv02t5JL27LKhBtG2
         v7ap8cUU5kK8FHNuA55VQp05z5KTM79KhSVtDCk/SrMZi7zqNNXovbrrO3ZyrnvXPLiH
         Bz9rSAC/yuWus6VYzZ0nL0j/mNVIA7Q5FMGFxCJsD6xm/GDNsNsH9///DkD2lhFYaoXU
         E4rQRCQvCL09YZGI3Do/kfotOox8RRjqdF1od4ukAU9MgA442NhPHfnGspe2sBeIfriK
         tVmg==
X-Gm-Message-State: AOAM531RfK4KSraBcEPm0D9njrpzPKkpvWqtO5N++pBYrp17Z6QGVXFK
	vyi6HtpgNj/yku5jmqLDNSAmIT2ktFHqLEbIWzs=
X-Google-Smtp-Source: ABdhPJyTUHk5zcxmVR5k1zP3niEKCuYe1L+ArDbkWMRRLPohTbmWIUqb0tXOV7M/iYYfYtgWfToUEvMNsOuePgA1/R4=
X-Received: by 2002:ac8:5cc4:: with SMTP id s4mr14035639qta.214.1619395574516;
 Sun, 25 Apr 2021 17:06:14 -0700 (PDT)
MIME-Version: 1.0
References: <bfd87f9a-d54f-25fd-5229-ff3cd60ad033@gmail.com>
In-Reply-To: <bfd87f9a-d54f-25fd-5229-ff3cd60ad033@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 25 Apr 2021 17:05:48 -0700
Message-ID: <CAMKF1sp2_j7D=XAE=+WiYHrLXf1C4qfE0f8mo9Zr7AWr4kdvZw@mail.gmail.com>
Subject: Re: Hardknott merge request - April 25th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

merged thanks

On Sun, Apr 25, 2021 at 2:35 PM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit 2297d4ee04b47bc574f8879732d9e213ab7bf6=
85:
>
>   wireguard: update to v1.0.20210219 +1 (2021-04-18 13:49:13 -0700)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded hardknott-next
>
> for you to fetch changes up to 71b546ed8595b14d29efc1e8b951f8c845ad10c4:
>
>   python3-cryptography: Upgrade to 3.3.2 (2021-04-23 19:09:56 -0700)
>
> ----------------------------------------------------------------
> Chen Qi (2):
>       tigervnc: upgrade to 1.11.0
>       python3-django: upgrade to 2.2.20
>
> Mingli Yu (2):
>       php: Upgrade to 7.4.16
>       python3-cryptography: Upgrade to 3.3.2
>
> Stefan Ghinea (1):
>       python3-django: fix CVE-2021-28658
>
> Ulrich =C3=96lmann (1):
>       v4l-utils: fix reproducibility
>
>  .../recipes-devtools/php/php/CVE-2020-7069.patch   | 158
> ---------------------
>  .../recipes-devtools/php/php/CVE-2020-7070.patch   |  24 ----
>  .../php/{php_7.4.9.bb =3D> php_7.4.16.bb}            |   7 +-
>  .../0002-do-not-build-tests-sub-directory.patch    |  21 +--
>  ...tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch |  36 ++---
>  .../{tigervnc_1.10.1.bb =3D> tigervnc_1.11.0.bb}     |  13 +-
>  ...ure.ac-autodetect-availability-of-systemd.patch |  47 ++++++
>  ...estrict-installation-of-50-rc_keymap.conf.patch |  40 ++++++
>  .../v4l2apps/v4l-utils_1.20.0.bb                   |  11 +-
>  ...aphy_3.3.1.bb =3D> python3-cryptography_3.3.2.bb} |   2 +-
>  .../python/python3-django_2.2.16.bb                |   9 --
>  .../python/python3-django_2.2.20.bb                |   9 ++
>  12 files changed, 137 insertions(+), 240 deletions(-)
>
