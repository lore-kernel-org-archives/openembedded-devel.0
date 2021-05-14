Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.5199.1620972681586463950
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 May 2021 23:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mpqK9VoU;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id a22so27243014qkl.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 May 2021 23:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=864y3kWUpBhErfQgLxkleqtU96uxXzj4BmUfq1uF1+Y=;
        b=mpqK9VoUffp6LWQyrsCql0zNcxVKLM8gf5efIzm7FGt0rZ5Y9glwVV7Vk4XL3tkGMf
         u53SUQAU2micp+P1gOjkW0ogfcaQIDPNmACzeYc7hLJ4e4Cj9O2oxvbH0Ra8sangb0wQ
         Ip73MvL4jaFaWneAgHuzfUmKYnfxOsPBCJQAHIpSEpkRFB+GWVSh/SK3tv4Up5Yr4NT2
         a75VvZ4LI/kIpsvY/UTXU/I5qOa24rqu4CwAJQoRXLuj5yVWBoLjQNELslGNszMTsayi
         Gw8yG85KyT/WxeBuDvYqMEsVJuMgbr8W6ZNuULrK6wuNVNlxU5PfrJW80yUQHQBBlYe+
         +c9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=864y3kWUpBhErfQgLxkleqtU96uxXzj4BmUfq1uF1+Y=;
        b=nkroEMODBi07ROnN5X4c2Ku6I+NEHYlrsUEGgviyeT3p4t/ogy+QC0Fb0lZTLXPh3H
         yaMXFd2TBosd6MerCS39cGdK4P1Dihuls3H5IRtNaYaXUTGqT8bffOy6LcwQREe3K0qJ
         3NTVQ6UfJKMJzgT60TdODq6A3BO1AQ1BnW3A+aPqgWV0TDo8YHEoI6QIEggqwieWZuBm
         fsFgNkAhdtzJhpZ/RyMaFLIbT+s3htIREYHQjXJNjpRmeL6idjf2tBbtOwcZtyHMUGPW
         +lovIMA/g4GpbWx1wXLcbUFFz8DhH2SXhuQRm1mc0mcwrS5ZIUrsPGjYryRPwoLvZJwp
         /2EA==
X-Gm-Message-State: AOAM533egb9j8LP+JIUwh4CVolkfOfYF++byj+r0BT7vEdAxrlYCD+Ad
	u6wH7iJFts98SHGeVr0LTdGBKaeGPh1vcanjS3s=
X-Google-Smtp-Source: ABdhPJynfM/MJIcRN5E9ntpfRxEBls4u4gST4gLPfUe5DUWSKHlLl904/66XaYqdN1j3p7p1ikWbhb9WVOux0xd0hus=
X-Received: by 2002:a37:994:: with SMTP id 142mr41765574qkj.119.1620972680780;
 Thu, 13 May 2021 23:11:20 -0700 (PDT)
MIME-Version: 1.0
References: <e50d9308-f329-4dc9-cf79-d439e3a0d3f1@gmail.com>
In-Reply-To: <e50d9308-f329-4dc9-cf79-d439e3a0d3f1@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 13 May 2021 23:10:54 -0700
Message-ID: <CAMKF1so7pqUyf4-H1wUC8jVTvynWjzyU+QLMJth_awLU8qUTbg@mail.gmail.com>
Subject: Re: Gatesgarth merge request May 13th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

merged thanks

On Thu, May 13, 2021 at 9:51 PM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit 70ee7293017c4f38fee71ffdb60e4713fdc88bcf:
>
>   nodejs: 12.20.2 -> 12.21.0 (2021-04-29 21:41:27 -0700)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded gatesgarth-next
>
> for you to fetch changes up to f3f7a5f1a4713f145107bb043e0d14cb3a51c62f:
>
>   ostree: switch from default master branch to main to fix do_fetch
> failure (2021-05-13 21:44:45 -0700)
>
> ----------------------------------------------------------------
> Martin Jansa (1):
>       ostree: switch from default master branch to main to fix do_fetch
> failure
>
>  meta-oe/recipes-extended/ostree/ostree_2020.7.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
