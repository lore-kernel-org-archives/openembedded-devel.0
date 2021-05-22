Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web12.4668.1621674617453847350
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 May 2021 02:10:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YiW00pSJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id x18so12429375pfi.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 May 2021 02:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ly/4fcn4IMUzqqjLip9cTmK6KElKM6uLM30HzZ047JY=;
        b=YiW00pSJ/UVWidf+/QmykDN8kBrFAlpevk5k1K6OXyOj1o0Ni/w0l1rmdb8ylZqgMO
         U3F6vY0brZqBkczXtUCwDCp25KJO5AYdxl0myO3Ka5LLk/LDjuDdPptwCX+xgUEXeQrK
         4VCw7dxjAlzGDqZJGabStGBCdM9wHHG6qHDCABHcgYRcLDcZGCvtcL4+YNq5XsTgp9Q0
         B3hwNJNa5vXXvc/OdsLN5wYf5b4aN6ABFUryjqqeboa/qYT2WYk0HH1xobt3VjufxDBW
         Opk1IWfEBNPQIMbM5HYOVq7pC0M+vmRJEbDoeo38le3n8RqWBUUTjTnxchkO1XNKVqAX
         GW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ly/4fcn4IMUzqqjLip9cTmK6KElKM6uLM30HzZ047JY=;
        b=a43JtuX+PwlP4JqXyN8bD2Tc/Rg97sasUN8bf7LeM4uQL7RsPRI3EwtTW9nM8zIZo1
         Cl/x6CWD0uRGjISFETlXxJuqmUw9ZzdpjJ71L+YV3CXtaTPnCClfiFHjaW1yJ35JRsi9
         wMmMForsq8z7kk0QVzedIDVsBGEeXMBLBCyTPhr0TOqYuIqRzTWocsnv31y8rBDHpx9M
         wGSuI9JC+ClASV/uPMh4g5O2WFz7lgGYn2i0UWxp6lGO+rlz5PLqJcqIs6q5gzHtE5ag
         HKYXgpmbKPURPq85SyN6LzmHLSmIAszVdav9bxJG5E4KubcnxRkPvYP9Wh/Cb1ABtpqC
         K8YQ==
X-Gm-Message-State: AOAM530u4Ef50QvRwZWMSlvywFglu2aBGbE7KToW/FaqJRu62gxbSMfS
	PdrfFKCjtxTqdxxV56urvyGpyyMfQI+B0h49t0c=
X-Google-Smtp-Source: ABdhPJwP8BLxxEAuGMtvJf6IoOkr2K1hEHeAzRunVJ8AojUSegye+1OOFYG5LoQulzJ2qoxqAC8BFyO6baX+CZKvzZU=
X-Received: by 2002:a62:148e:0:b029:2e4:e5a5:7e33 with SMTP id
 136-20020a62148e0000b02902e4e5a57e33mr6224519pfu.9.1621674616989; Sat, 22 May
 2021 02:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210522013521.588774-1-schnitzeltony@gmail.com>
 <20210522013521.588774-16-schnitzeltony@gmail.com> <CANPvuRniA5iXtmnuwpK5oJSrFZCV=gd3ZAszkPNKJT4JY0qajw@mail.gmail.com>
In-Reply-To: <CANPvuRniA5iXtmnuwpK5oJSrFZCV=gd3ZAszkPNKJT4JY0qajw@mail.gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Sat, 22 May 2021 11:10:05 +0200
Message-ID: <CALbNGRT49k3YZ=MnXMEQSNvCFEZDn9zWaJ3GOED+kK1dJTu4pA@mail.gmail.com>
Subject: Re: [oe] [PATCH 16/17] libeigen: upgrade 3.3.7 -> 3.3.7
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, May 22, 2021 at 10:36 AM Jose Quaresma <quaresma.jose@gmail.com> wrote:
>
> Typo in commit  message, new version should be 3.3.9
Indeed - thanks - just sent v2

Andreas
