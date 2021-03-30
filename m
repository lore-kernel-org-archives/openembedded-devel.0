Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web09.1227.1617122429636241393
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Mar 2021 09:40:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rc39iQ/g;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: bjorn.lustig@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id jy13so25841003ejc.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Mar 2021 09:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=89m4BM+ZOqyxmdOhcEiZSygLIZPuZwnpAMcpKNyi4pw=;
        b=rc39iQ/grrayKhiYCQ7RBn4YeDIgctQwu0ZLxG4KJJCb7++cNoNmI5ROqjcb8Tg+ys
         kWBkjFS1at9BIkBlVJb+2JKV7A6q7L+NVw/5fbu2CqNs/S687btbCh6SkOk+A/s3XCpG
         wEMQAOByywXkSb/6vjXZE412LCrMaGP0L+9ItyrjYnBLP3DGiUM3+DMgjEniLqxXuuG1
         rMO1AVrEiM6k+ndweTOl7vvqy63p27Yg3ftxKeOdTXLWcvbU42FzqzF3k5kS0gn+7JhY
         S8UBwyiDp/dHYNE6/4d2XeUarkSTm3JSBZUOUCr21Ui9tBh5y7NP0XzvE9hQKx/hsPlw
         UtCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=89m4BM+ZOqyxmdOhcEiZSygLIZPuZwnpAMcpKNyi4pw=;
        b=PFuS6VfczdxkTehrs4nnurx5vn7xWpcAxKFDUHepaHI2uniUDvwJWfzJKeCb8CiNpP
         YtZTrYWypbG1bb+h3gwAKDDbIx9K4GKDPrraGFkbpumQ3buccVH4Zt7lh+aPgKW/4Ygm
         LvNiYCMFvhieUICK4uh8H0xw3DvuxUTYolQEmTKVLCCyxC9b/W4sXXaYqOv7H6Nd86mU
         gWyVk0NmNQ1+69O7ohbuaydmOK7wxFlWcZ7/xc3g5IHFiIQQ3MrKDXeckgeN8bNSDFZr
         Y1cKqOlfft+bOVSI5iX/CsepUq3X33HWJ+KdsC/4HFn1SPDYkKY8kP+sQkPrW1w6DNWa
         3Rfg==
X-Gm-Message-State: AOAM533aRkae+DtQZLcz8NbnDi7Kdh4KbVq6iud87mlw+2Nvwhbz6mpX
	EOWIbNHKrH7gBxgs0CxGfW2y6q+LHMr29J1v0Fyk0htHSX/y
X-Google-Smtp-Source: ABdhPJwtmHO2FL0e9Zqk6jfEddgr7dgZe46LjRwqB1vPcIB9yBJTi4LRLr++Hh73JJbIo7HW5jfxkkhymM5/4oc5lkc=
X-Received: by 2002:a17:906:a8a:: with SMTP id y10mr35093385ejf.288.1617122428332;
 Tue, 30 Mar 2021 09:40:28 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?QmrDtnJuIEx1c3RpZw==?= <bjorn.lustig@gmail.com>
Date: Tue, 30 Mar 2021 12:40:16 -0400
Message-ID: <CAHq2DFhj===t_aXq=nV+N2P_4vxPY__O2LS9qKWk=g9KgSiqMw@mail.gmail.com>
Subject: koreader recipe
To: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e62d3c05bec3a7c9"

--000000000000e62d3c05bec3a7c9
Content-Type: text/plain; charset="UTF-8"

Hey OE devs,

By chance, has anyone already developed a recipe for koreader (
https://github.com/koreader/koreader ) ?

-bjorn

--000000000000e62d3c05bec3a7c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hey OE devs,</div><div><br></div><div>By chance, has =
anyone already developed a recipe for koreader ( <a href=3D"https://github.=
com/koreader/koreader" target=3D"_blank">https://github.com/koreader/koread=
er</a> ) ?</div><div><br></div><div>-bjorn<br></div><br></div>

--000000000000e62d3c05bec3a7c9--
