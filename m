Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web12.5286.1620972651612505933
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 May 2021 23:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RvbQ//fm;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id i67so27812118qkc.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 May 2021 23:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S8ZNHM7ONXZURCZ6txes02C34YwBeG6QKo1mZgxzS+Q=;
        b=RvbQ//fm9uDQbc8xiKVuX88pl71LaMo+r0IsHRCa65ftTTYsXQ3a3rzTBXKKZ+D0+R
         qn7hrGgnDPnQLVaO9HdVI7TK8fxlQEFAjzkiRWXUVzurEpUP0ExpUFfPdmc+H845QJsQ
         vrGlL8N2pvGn06unVTDCYhm6APrzE1ZPwXne/ia024Xz8UlcwzFlpjbIJgsrRkiC3Pq9
         B8bYFep5eo0HtxGQ0XeXu80zy7fkgFtemwQZfI8dd9A54UcmKzHHp91DrPu4oNsITAmL
         vQQsfagcptheXNf02L+2Q4MCbJ3WUNm86m8rMcLnQiKRgyLlPdfCE9a7/OZIoFveBu5M
         IbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S8ZNHM7ONXZURCZ6txes02C34YwBeG6QKo1mZgxzS+Q=;
        b=tw98KlmcIUYMSXA8mmr2dUF1oBUqrAeq/Gdij3PXR00zUB7y9uex/QTzAcQ2jK8gWE
         1KHAev72kwuSD3DWxhQjdTopdSM9fnYXcojk/r3Iv4yagb34NgSD1KRE/dYnQS17yy/Z
         DdRvVx2aBzLVxu5gQgAlFkSwb/k+AbM9TJnFCUKhe2IG5E0xV3wEEzvzxY6WZveq/iht
         LhujJSLCiq8n7N0X5DDBK4wcggAfrlAaXyMc5Jc6TTnW89N8oBpYYkNnnZTc4vFfqGW8
         KmLo08PfyGLlFwgzDpB7k0FkoATLnmMo2Rp/NA6mYooP8umzDfAWQM2Pb+nlBcn1kbdH
         E/HA==
X-Gm-Message-State: AOAM533NgQMW56YIzBHSP1s0w6G+QQ3BvCyFiFtDMRZhh4L1yfZsG/Ks
	Mk06hOHK9Bia9xW8Nhn++LNcZlMChvyB5MPyaZA=
X-Google-Smtp-Source: ABdhPJz9Figz4Iou5sVgTvspq4nGjdY0rO43Vr6dSuoK2WWoe5VQVZfD4kRtWgET5s2+8HUTINcRt5DD7LPvSxptqiA=
X-Received: by 2002:a05:620a:24b:: with SMTP id q11mr23482627qkn.25.1620972650699;
 Thu, 13 May 2021 23:10:50 -0700 (PDT)
MIME-Version: 1.0
References: <53093edd-6ade-5b29-5972-179c1491fcec@gmail.com>
In-Reply-To: <53093edd-6ade-5b29-5972-179c1491fcec@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 13 May 2021 23:10:24 -0700
Message-ID: <CAMKF1sr-nYQXt4BsG1zC=nONaV-6ERpC9pkLs8g_VM2=PYzoGw@mail.gmail.com>
Subject: Re: hardknott merge request May13th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

merged thanks

On Thu, May 13, 2021 at 9:43 PM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit c3a36263f91e42302ad7c347e051cf1cd83e39f6:
>
>   packagegroup-meta-webserver: remove nostromo from pkg grp (2021-04-29
> 18:57:25 -0700)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded hardknott-next
>
> for you to fetch changes up to bbe3855ec7d7e1417a42e9d7a4d1d3d338812088:
>
>   ostree: switch from default master branch to main to fix do_fetch
> failure (2021-05-13 21:37:32 -0700)
>
> ----------------------------------------------------------------
> Martin Jansa (1):
>       ostree: switch from default master branch to main to fix do_fetch
> failure
>
>  meta-oe/recipes-extended/ostree/ostree_2021.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
