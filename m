Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web12.134361.1598020366911965773
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2020 07:32:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wittra.se header.s=google header.b=Ij7eprv7;
 spf=pass (domain: wittra.se, ip: 209.85.208.45, mailfrom: chencheng@wittra.se)
Received: by mail-ed1-f45.google.com with SMTP id c10so1594192edk.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2020 07:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wittra.se; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=Ca8P7FbTXJDcnrFdc9RT0ZITkcmwaD/10wJs3Fgamu4=;
        b=Ij7eprv7uLbpXg5cJ6zqLgGhycpZTRX+PCc9UWS8SZG1OiTjMwvirOYBm9SecGAeOI
         05rxuX2Z08qyEzZEgcGlbs4Po/pEyj4JyN+mcAfZlPinm4vAfNfGj+Y/VOVvorzh4w4M
         jUjpJ44m8XgIbKiE8HqAdgNGWyhCiIvzO3D+Ft1yxbWr9olA5sByafMKAx5aiH6znXaW
         Km1uD1Xf7s5Amme351XYZ9UOM/7eeQglmbAzt9FUXzvZSkLcmjbDURaX8ua045ReOsVI
         v6c9aMVaq7TUoSeqDjSIaNrs/E994EMpx2QMzCXNqSdTqL8fgJjLA8UcHo/WCSUEzGl4
         u3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Ca8P7FbTXJDcnrFdc9RT0ZITkcmwaD/10wJs3Fgamu4=;
        b=GfPIoRem7pLw3D3XVKUuv2kxYfldeN1YJ0pQyGdGHb+7EbeBF2QsFRkLJKbc+UZg4K
         hg0M8rUpyQA9UMYPm/GOFvOUn41b2MpJehJfRJ0WWnp8czC9hMLhIlQSBF/AadBRuIeP
         CxdDqtOEyC1s2WsR30DlHmP6leGJICfm2UHdKQ9RLBRe4oTXzHGp2j8HIMeqZDLd4uVH
         PSBEnzEehC//0SQareOrsrf2INhMFzSBXU61MhjIdEf7oBqhRrOxI4rv/ff5PndUB4oY
         FkrAKjFJBYb2Ux39uzE/knAN4I2RDXzzgKTH26ZtzMDYYc7zEQtrxlBJMHLv8iRWGu+i
         XOGg==
X-Gm-Message-State: AOAM530rkzfxznxknhsN/ANiVaIMSVgPcrmtRC7KBUzcnHz5Gb1tRxmy
	RQrdB+M+2Bh8fiRLg6kEKO+UUZNA/NDD4SIj5beQkw==
X-Google-Smtp-Source: ABdhPJzUyCR8A07m1XpR5fouFuHmc3sAsWTEB3yR1/Z7OE/RPbVR+xXIzROZC1mIr1L3AbmfTc9HpoxwADfny+7avko=
X-Received: by 2002:a05:6402:847:: with SMTP id b7mr3208782edz.39.1598020365218;
 Fri, 21 Aug 2020 07:32:45 -0700 (PDT)
MIME-Version: 1.0
From: chencheng@wittra.se
Date: Fri, 21 Aug 2020 16:32:34 +0200
Message-ID: <CAE5diG1AoUDZrO=V7pMjvgv3Gu5cMk3dvPzM82Dem1Sc8X3Wvg@mail.gmail.com>
Subject: Failed to fetch URL https://bitbucket.org/cacaovm/cacao-staging/get/2d6f6c14daf9.zip
To: richard.leitner@skidata.com, ricardo@ribalda.com, alex.kiernan@gmail.com, 
	openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003690a405ad641cf5"

--0000000000003690a405ad641cf5
Content-Type: text/plain; charset="UTF-8"

Hi,

The source of cacao seems to be invalid which makes the repice falsified:
https://layers.openembedded.org/layerindex/recipe/23632/
And this prevents Yocto from building openjre.

Could someone be kind enough to update the cacao recipe?
Thanks & Regards,
Chencheng

--0000000000003690a405ad641cf5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>The source of cacao seems to be inv=
alid which makes the repice falsified: <a href=3D"https://layers.openembedd=
ed.org/layerindex/recipe/23632/">https://layers.openembedded.org/layerindex=
/recipe/23632/</a></div><div>And this prevents Yocto from building openjre.=
</div><div><br></div><div>Could someone be kind enough to update the cacao =
recipe?</div><div>Thanks &amp;=C2=A0Regards,</div><div>Chencheng</div></div=
>

--0000000000003690a405ad641cf5--
