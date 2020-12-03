Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web11.10914.1607005352447972506
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Dec 2020 06:22:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bLEH8Ifn;
 spf=pass (domain: gmail.com, ip: 209.85.166.193, mailfrom: twoerner@gmail.com)
Received: by mail-il1-f193.google.com with SMTP id v3so2054345ilo.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Dec 2020 06:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=Euz7nQIWpwVreQFZ1wbwBX9Sh0j08KiVtd7hQG3x1wc=;
        b=bLEH8IfnFxSMQNnXlsv9a/LzUV5KMno3FXY9UILS47hLFlru3w5CN5VbIKVhEXqxXM
         GgGn0lhRsvx3SllpG5jWpDHCPsNVjGYGdQkoSGfgNbsEj6rQ8syX6CNxz+eoUDGyK9s4
         m6fkE7hStaWINVgyfkZzHiBf4921cmwodImq2cIo5qY88p6l8pmKIKScM8OYZ7PW9O/E
         dIG1dRxGOCUBMNRQyY1mn/pXtb2X7k3YTQCuL8YFMeTFZ2d5bUEDs01S0tL6bz5QMdno
         o427A+bBCObAXFF6wz1MZNShZ1wnz0qKI53O0JRjPmrT/1Eaw0eGZdF6Oma9CUiBjuxY
         mfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=Euz7nQIWpwVreQFZ1wbwBX9Sh0j08KiVtd7hQG3x1wc=;
        b=mDR6X9XuaLQ8XNnQ5rwv5sr9d9pJ5JDT+rZAeEptZMIrHN28xiHZ/y9StdIQdZeSqC
         uO/P9Xwo4JXqUnKUFMkGN6HGrGxmYseOirr5QiGGFpTuxPsTLxasHJ1OLljNjRTef3ZN
         7L2aYsZTlPCRi/Cs17p6Jl3uM7Z52noFHiolxq74MG16/fsR5AwTpRYbj91WhSvFrzcm
         11LClNGQAFsOcwk8Lqzk/f/jdRXYXBnP1eFO0uO6+maAxI8e21yNH/Z3jPFB/g2f5h2G
         p52vv9sPDjjBJcY9gqGxy5agmfaWcn9oOR6lD0lt9PnbGx7WFX2rPuKl3g1/dqXVIAuM
         gZVw==
X-Gm-Message-State: AOAM533z+OJV0cJ/qRDnCNDpBUlNzBTvLMv4Ws2lVJNsg2ewibJTWeMM
	czhw01HsQV9nBkWwc3TCDg1qKIRmNm+VPyplIwNur1Mt/Rc=
X-Google-Smtp-Source: ABdhPJxd29Ig+uWCMQCg+oC6KcF+jxeK4qISRIknz3hbkSt3Q+TjDz8iUVlWwCvOJh5Yz93WaYuoP68atNH3llqOmdA=
X-Received: by 2002:a92:d5c5:: with SMTP id d5mr3227750ilq.24.1607005351251;
 Thu, 03 Dec 2020 06:22:31 -0800 (PST)
MIME-Version: 1.0
References: <20201203135049.3409-1-twoerner@gmail.com>
In-Reply-To: <20201203135049.3409-1-twoerner@gmail.com>
From: "Trevor Woerner" <twoerner@gmail.com>
Date: Thu, 3 Dec 2020 09:22:20 -0500
Message-ID: <CAHUNapRfObqPf0h9EBSMptRADL4w-zHZSO8QwGWP5HHyrvQR5A@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] glmark2: add support for dispmanx
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001d141d05b590173c"

--0000000000001d141d05b590173c
Content-Type: text/plain; charset="UTF-8"

whoa!! brain fart!

This patch was supposed to be part of a series, resending with a v2

--0000000000001d141d05b590173c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">whoa!! brain fart!=C2=A0<div><br></div><div>This patch was=
 supposed to be part of a series, resending with a v2</div></div>

--0000000000001d141d05b590173c--
