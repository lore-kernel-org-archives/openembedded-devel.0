Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.795.1612994425644763717
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Feb 2021 14:00:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VNp1Ffor;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id b8so1971358plh.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Feb 2021 14:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2MheBDTpkz5yWq1YWjXpa2rgOreL15sjJw4tX8kS+ks=;
        b=VNp1FforLi8MH4IC7IhmFaz7j58e7fmApjtA4gmYX+zP7JR7xCXNUv88y80FRPHSa9
         cjLjppkGzFZT/5KImnZSMOgf7htc75mBFbMNGW8ObkHEHFA+2TwqiseN1aYg5jMsNmJz
         zDjUN7BAjK8voHZds7sS2ovUsqzQCGk0us0RH1jlv7Oz4pGmT2t1TJTgeEtNwZroFMq+
         I1ZFPzP1LGe6dwQJfifP7jNsgJd9yISh8C308ykbdTkMHsZKs4rcCtE20Eb+0pTqFpEe
         U1Z+XDKesYsK5TV7UCUOCoy7zBuX4SQR5zeAmbq3M4oFgeYTSYrJI1EmuJItjUY8ntMr
         0kvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2MheBDTpkz5yWq1YWjXpa2rgOreL15sjJw4tX8kS+ks=;
        b=Ew8T0Ma2FGw4wDricxNkJUVyffzxZpD1yDjV2Lb3IC9739Owi0uoSbqbSO3TcjoEqh
         znKmnurQBS5BNjpJ2mpbnxhMx4XxksDBKZfH9uTHMoVr+QjZTqPTm8ikl3E330khc4Aa
         a31gcpSy9RYAqo5PhKPYLLtVaTQ/f2ba9Xq5nmn+9IIprNu7SuhpeUHXw+/d2+ViOqjO
         nO7YlzasykPcrC38tHfsASTHQERFxrqaszmW3Z+Myz4g0/dD9x3xl2NpwBZrH2QR3re7
         oXMfg9OV6Eam/2Nx8bOL2nOI1O5sNnUCIEIKZGedBfQvZVVT9Oy81V5DJzBE7SxjTo2z
         SNuA==
X-Gm-Message-State: AOAM530mZnqpwR+qB9FiddV9PgDD/wtXPvcMYVEWKwFU0MSuUOiAyLES
	uieHqce30SLv5U+1Ikj+V7tcED9/EJlhz+2F8W0=
X-Google-Smtp-Source: ABdhPJxapDhzpgeVJKiFR2o7jXXEEfIgIAeZZ2QyUE65kFS/498yYce104L0p03hDo52wmlZGbu0aCyaoruWPsH0ifM=
X-Received: by 2002:a17:90a:ec05:: with SMTP id l5mr909257pjy.161.1612994425058;
 Wed, 10 Feb 2021 14:00:25 -0800 (PST)
MIME-Version: 1.0
References: <20210210205538.690009-1-schnitzeltony@gmail.com>
 <20210210205538.690009-9-schnitzeltony@gmail.com> <CAMKF1sphEKtJVdO7Ns7FDsniK6mDzKojjpFcTVmA_C4-AEzKJA@mail.gmail.com>
In-Reply-To: <CAMKF1sphEKtJVdO7Ns7FDsniK6mDzKojjpFcTVmA_C4-AEzKJA@mail.gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Wed, 10 Feb 2021 23:00:13 +0100
Message-ID: <CALbNGRQEtAhFyHmnSZo6npBP=gg1Ky-AVAH2TV3VikA1CJRpYA@mail.gmail.com>
Subject: Re: [oe] [PATCH 09/13] glibmm4: Initial add 2.68.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 10, 2021 at 10:17 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Can you add the newly added recipes to testing packagegroup as well ?

Will do tomorrow

Andreas
