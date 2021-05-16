Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web09.3906.1621155096175545129
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 May 2021 01:51:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=leZfCecL;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id f22so1658423pgb.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 May 2021 01:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XVkxzmU+KD8Q3SIwIXvyPu5neWzo1s84KWINOUtY44U=;
        b=leZfCecLmQKgZGkzrW00IR/9rifM+tCfV9ju3anr5TaLFcJlq+easnrgaRgR9WhB9D
         RrO1X5y8W8hsCywH4SvZ2vLvcGOUXouniDuCOMTc7lTG/AwfFc0pqmAeKZTxFqzGVXXf
         xcRoP7tk6kG5UYk/7mH7DyopJPGNXGOfmz3ys/IpgWxx5OoHKFks1mGQeKuvQkdlSbTy
         2OZqF90uYCCvbSGyp52qYe05+N/dZChEmMAlE/MDMPKPn7SaLwHW58fkv00nYwWXUOwc
         W/3voqzmHeTAHnvakQlzxyh6C8LB0XmcS59cKsVGpnUkGJXMt6DspbQDM8C88Z2/kv/t
         huag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XVkxzmU+KD8Q3SIwIXvyPu5neWzo1s84KWINOUtY44U=;
        b=GLLZmMpWP5DGR3Tt5LJ52cIDS3NDE4M8awNBcF+o45a+YCSdNts8Bk4b38chu2PKMf
         YTXYSHqGjL9kFDiSDP/0zme8f83A1IbIjWtAyHt4QvWvM1DJyjQA0pdoE3r0S0D6pInt
         uXZ1wKSDaCkhiOCJxPJq12aifLi8c7Uligprd3bGiUglbE6iRtW0QTFyNVE3tD3rkzNJ
         1MYDKwM1OItuje5jKSISLCUAB1IjLSCfaymLABVNwP/dpfZGJQHpklLWGjpYHOq69k/f
         sTe/g63sgw0jpAAh46fvRqLgxSJQIlzMvwoQmIlSwSkdpyIEDgNXM6LLEhvuGYM/G72Q
         8q2Q==
X-Gm-Message-State: AOAM532L2DSrYxxqPQtVUVOL3P60X3RXb6G0Wuq9WjiAt5ihHymZG7+t
	kcHvUfjYd1TNd0TBKASY005iKNAGCcbTcDDqhlc=
X-Google-Smtp-Source: ABdhPJwTuH0AIUNjaLIFcRMOj/qx4BUQyODuzjXaZwpdU5YYBBx4pqdkzw3+AE3C2xdk7yAVgEUbD8NqJU6ycbb4CVQ=
X-Received: by 2002:a65:6a05:: with SMTP id m5mr16993026pgu.319.1621155095716;
 Sun, 16 May 2021 01:51:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210516011332.664389-1-raj.khem@gmail.com>
In-Reply-To: <20210516011332.664389-1-raj.khem@gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Sun, 16 May 2021 10:51:24 +0200
Message-ID: <CALbNGRSK14v2okETFy94JUaPq40h_yrJsvUWzCE12wow5SnGaA@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] libraw: Move from meta-qt5-extra to meta-oe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 16, 2021 at 3:13 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Andreas M=C3=BCller <schnitzeltony@gmail.com>
Thanks !!

Andreas
