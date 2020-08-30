Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.web10.39887.1598820378860740411
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Aug 2020 13:46:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H/0n+tcQ;
 spf=pass (domain: gmail.com, ip: 209.85.217.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f50.google.com with SMTP id p3so2246819vsr.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Aug 2020 13:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jRZfssCC9JUHigb60qaJnIWwcRrtjcDFNEnpa23HQzI=;
        b=H/0n+tcQgwJ3vFXtkra97vBm3Xdn1X9NaFTfuweEEZoiHCUO7Hm+Db83OzU+iiJKKR
         Ca3xJ18++CJYuTNaQLbCdyhCf6rhbwYufiVZEu42BvlNL2jrKGDQb9z533xibhAmyfwl
         zWNlpSVdh4nMnWbEcO3nBVt47xIYVlSebzGW0B/ZI1gKPHcSoN555xZ8gDTnUcLuMcym
         8vSPstFCxe8Pr6WuGlqV/O9WtBGKTjVFUr2uNGxg+mP6pZpvX91kqO7FI8pFxMLTA6Rl
         VBZjlIDNh5h1cYMPahByEz2SVDU54VOUO6y2TSDoU3R0d/ludW40RjvWYbnHO1Q1RmeR
         xugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jRZfssCC9JUHigb60qaJnIWwcRrtjcDFNEnpa23HQzI=;
        b=p+HuUX8dYTaG/+baSiysQ6HcCJd2vHzcLwiQ6KiyB5akLQEYBimUC13K4DJcYLn+Mz
         RlIuoBL2drG0BV5CunubX+BH+THIqPsXjmgRd0ev6gtq7Bnt7V8zWzBHJz4w6nDsFT/Q
         un6BYQyR4hmSeq9md6qoF9QlS8JHCqNjzGiSI42zAD3LY0SIpS99nCyNloV8qf0LUgk3
         asCEAm6TJE0PatqIPJWm8SYE/YEnYM1cHkw4uC+w6YOey/4H8KRzznH8b2u6Jn5WxksI
         8pS+keIBzrnDsi40ax9UslGDMfCu96ausaAh1ALbyoOS0evZZhj8iq7qck12x4KSjQFY
         J6UQ==
X-Gm-Message-State: AOAM531+l27unUSUMCDnwQP3Bvmf/YljLG9ycRJxpNth682GuzfSatUO
	LFyUEZMoEQukdGJr/1bA2iW12V3I9A28/g3wPDk=
X-Google-Smtp-Source: ABdhPJw7RC3+e8b0ns9mvYbax3oXDXb8DN8bqSQJ1iDxhHlfRcCfqj4m/XWYZIw5ODh55vQtU+vvif1O5Sg/BSBMKhE=
X-Received: by 2002:a67:b408:: with SMTP id x8mr574370vsl.47.1598820378082;
 Sun, 30 Aug 2020 13:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200824083345.GG65616@pcleri> <CANNYZj9BA_nPnJCHDAUcxtzz9Lz3zn8WSPh7jeKJY9omCTHRaA@mail.gmail.com>
 <20200824091401.GB2286@pcleri> <CANNYZj_+KTOwyvBhrDQ7NuecOBFe=Poh8Khc_ntDU4M5iGL=Gg@mail.gmail.com>
 <20200824093831.GC2286@pcleri> <CANNYZj_LT1m2gSbhL+Di1PaFGzSYGmPVYsEus0YnSx19sOZ8jw@mail.gmail.com>
 <162E2BC2BA50B6B6.12673@lists.openembedded.org> <CANNYZj8fWMk1Ya+G-HbC2VVbC4HWV6x=4T=ni_cdW5-qNG1YnA@mail.gmail.com>
 <20200825055800.GA37583@pcleri> <CANNYZj-n4T1bkX4k36B5LgG+7nJANO+sVKGXbyf1mFZTMx-t1Q@mail.gmail.com>
 <20200825110343.GE37583@pcleri>
In-Reply-To: <20200825110343.GE37583@pcleri>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sun, 30 Aug 2020 22:46:06 +0200
Message-ID: <CANNYZj-a5HeUKExws6KNoofbPy4EQmmzx=2-ZtsD+N8j70g-HQ@mail.gmail.com>
Subject: Re: [oe] [meta-java] Changes from master-next merged to master
To: Richard Leitner <richard.leitner@skidata.com>
Cc: Jacob Kroon <jacob.kroon@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b2014d05ae1e6051"

--000000000000b2014d05ae1e6051
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Aug 2020 at 13:03, Richard Leitner <richard.leitner@skidata.com>
wrote:

> Great. Thanks for the feedback.
> dunfell-next and warrior-next are already available. I'll merge them to
> the real stable branches soon.
>

ping - I think dunfell is still at the old revision?

Alex

--000000000000b2014d05ae1e6051
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 25 Aug 2020 at 13:03, Richard Lei=
tner &lt;<a href=3D"mailto:richard.leitner@skidata.com">richard.leitner@ski=
data.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Great. Thanks for the feedback.<br>
dunfell-next and warrior-next are already available. I&#39;ll merge them to=
<br>
the real stable branches soon.<br></blockquote><div><br></div><div>ping - I=
 think dunfell is still at the old revision?</div><div><br></div><div>Alex<=
br></div></div></div>

--000000000000b2014d05ae1e6051--
