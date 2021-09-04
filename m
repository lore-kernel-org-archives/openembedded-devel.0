Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web12.9805.1630752141595145549
 for <Openembedded-devel@lists.openembedded.org>;
 Sat, 04 Sep 2021 03:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SDbk/n70;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: manjunathan.n@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id dm15so2409140edb.10
        for <Openembedded-devel@lists.openembedded.org>; Sat, 04 Sep 2021 03:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=i16cn6luiEol5x5ImcEa7SbwdRQGH1/DQVOssVd/r18=;
        b=SDbk/n70Kpy4mjFj8GVwSZGqds+QflEBhsFrTm+IdCAp5HOTl64Go0TsFtOQBCgftI
         MrsEAQGb1S+PSlPXv58LQzIRdle5F6tAcTHL/3si/jtClzdnyC6c/gaYpNDhDsWVDrsP
         iahyHDM/f9lJMxKwT4dRpUbXCrrz+KmU6Z+PydzczdF1Jt82z6xK3n08sAs4Itctkmt7
         K9uOnKqg/7YaBl7agVAj7igulQH8lv21W53Bp86AndfH19UDD9vGXpmzMLg1KBtgEXRc
         fphsI3LbRZ5L74sT0nupuK607QFIQ8x3ZEumtaIAS46YSGpiFhDBgezbDb4fowVzcvsk
         8Qug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=i16cn6luiEol5x5ImcEa7SbwdRQGH1/DQVOssVd/r18=;
        b=D7xnAGN7CT/mClTLdmT3GVde2r1VygOi+w3wGqQBKHlO1RLfv9jb+/JNWUAAsj0E/U
         IfLHcc2aYYG/LiEoCZiEQf49GXbNu1BeLGbcqAC/6ygjnS//Rek1Q6tar1LdLyt5phqX
         VMfDP31z1W6sZXI7CtYbkP7v+cRsiqxWsPWzLGchXqjBhWsCaJvVnXoSEi+AMEFbX9VM
         mG6KM7B7D6FfGchAI0VntJ01hq+/xj1ESb8RPbWNX8rbUiDhaLnAHKEd5fQUop9Vi5wX
         hzTYCrUE0CVPT9g6crSjQStwNrHSkSeLDCbuBkt8sF8IWArb/D4j5Vb5ghlah8+RdRU/
         Zy5A==
X-Gm-Message-State: AOAM530X7+aYAxzoHc4Az31JkZZv19LR/yaFbGF82SGRhEXaznSQd6PB
	tX5OGn6rFdTnyaSuc93wKkNa2tayo8MBJda+jZ6O9A6Axiw=
X-Google-Smtp-Source: ABdhPJzRlibYXFBoIX5DbHRLycG/3b/FsIY0PVHFYo5mVu/WxV6Kwi/7zfUFnq/gOK+OxD2aG4xYfav87ykuSnRk5Ag=
X-Received: by 2002:a50:9e8b:: with SMTP id a11mr3577089edf.126.1630752139526;
 Sat, 04 Sep 2021 03:42:19 -0700 (PDT)
MIME-Version: 1.0
From: "manjunatha srinivasan" <manjunathan.n@gmail.com>
Date: Sat, 4 Sep 2021 16:12:08 +0530
Message-ID: <CA+xQMzz1cuSfo2XwV98BCCKmv=5XH65eYHdgSgH3TMNjU_d2cQ@mail.gmail.com>
Subject: Regarding Python 3.9 to yocto .2.2
To: Openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fe44d005cb291114"

--000000000000fe44d005cb291114
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi
I want to back port python 3.9.5 (python3_3.9.5.bb) from hardknott yocto
3.3 to my build environment morty (yocto 2.2). I don=E2=80=99t have any oth=
er
option for upgrading my yocto version from morty (yocto 2.2) to the latest.
Please let me know, how big is my porting effort?
What are key points/steps I need to look for while porting?

Thanks
Manjunatha Srinivasan N

--000000000000fe44d005cb291114
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br>I want to back port python 3.9.5 (<a href=3D"ht=
tp://python3_3.9.5.bb">python3_3.9.5.bb</a>) from hardknott yocto 3.3 to my=
 build environment morty (yocto 2.2). I don=E2=80=99t have any other option=
 for upgrading my yocto version from morty (yocto 2.2) to the latest. Pleas=
e let me know, how big is my porting effort?<br>What are key points/steps I=
 need to look for while porting?<br><br>Thanks<br>Manjunatha Srinivasan N<b=
r></div><div><br></div><br></div>

--000000000000fe44d005cb291114--
