Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web08.1369.1617122684359516429
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Mar 2021 09:44:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RAWJ77tW;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id u5so25827940ejn.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Mar 2021 09:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rCxbJqffbRK4EKzAHmvEsrPNXwOz6U4xkncsRhJSVlM=;
        b=RAWJ77tWNgX83ToL/9WmxHV56QnbDLo+ixC5wF5WtC6VnHslBse7/0NA7ufZW3JBly
         ujXnc8rUqqrr9qUClTC75RvOF5qcRaa7VUVxaNP3a6xbpPRwOTaTogU8qfcHk9rOwKC+
         ufQ49eI2S8y7my4FOt0m/iwYxKNu5LYrYkSbPZag/AOLSPJLs8jRwX/D6Gq7w0NsdsMH
         4VT70vDBc2AfJ4jUEl9HnzlxQRThSc9CVDJdCBYj3ftDthe5hpokSvbQvpBZc8NbOKuq
         2uQxyVW2/s0TNoJEwlcTTJEXSmuqWF3MWC7lBwxmaDEEQ5eKZyXVojJ+X5DlX/teUbqq
         16Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rCxbJqffbRK4EKzAHmvEsrPNXwOz6U4xkncsRhJSVlM=;
        b=gQO55JGN1Qk45kOQ5NTb/ztXOOy+mSijDSVXjM6Wmr3c8imvi6cFaQcKDzhbxXdF8+
         IcQ6xJfiPV0Seb2Fdml6/GBBGSl7vZlCtyJoJy+J1/rcyikqtnuoYPWJEyfzurznebK+
         +Qz/dV3p7r8YFTAj21aenehO+7XO3CFEr5S7Wz0I7R4Wjl2l4AngtlhHrPSpHqN17jD0
         9Fju/ZY9hz1RVSXOGL8cnlQvaajPMywwF0kSGtETKCpABuKzo1Al+mtrzLUx5YXpl3ZI
         qOTWolorhbm7iGf9Ggvq/cJPgMQg198/2usD+jh4uwkZrweREZM7KpHYI9o8y7mTiLH/
         3UKQ==
X-Gm-Message-State: AOAM533nA2YUwKYyz9tLIWWZGbdKQjtMPDKwDExxT0IfmNZOlhbfrKCN
	n6X1Zu46et4WGQWAUe6qXjrHuloe7rpai1zLCsY=
X-Google-Smtp-Source: ABdhPJz/ycbyVjQJlEyVY60mantU1/SxKSds43RZ47hYhAy3mKJQjASC2u+lceapCmlglEQSN4YpJFpfkV+DAeGxQmU=
X-Received: by 2002:a17:906:5495:: with SMTP id r21mr34491307ejo.471.1617122682949;
 Tue, 30 Mar 2021 09:44:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAHq2DFhj===t_aXq=nV+N2P_4vxPY__O2LS9qKWk=g9KgSiqMw@mail.gmail.com>
In-Reply-To: <CAHq2DFhj===t_aXq=nV+N2P_4vxPY__O2LS9qKWk=g9KgSiqMw@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 30 Mar 2021 18:44:31 +0200
Message-ID: <CA+chaQfjhrbj8EiyizEAHpfRXTzAQhOOZdip7aYPh0D2MwXJ2w@mail.gmail.com>
Subject: Re: [oe] koreader recipe
To: =?UTF-8?Q?Bj=C3=B6rn_Lustig?= <bjorn.lustig@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000013547205bec3b7b4"

--00000000000013547205bec3b7b4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Probably not as it isn't listed in:
https://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Dkore=
ader

On Tue, Mar 30, 2021 at 6:40 PM Bj=C3=B6rn Lustig <bjorn.lustig@gmail.com>=
 wrote:

> Hey OE devs,
>
> By chance, has anyone already developed a recipe for koreader (
> https://github.com/koreader/koreader ) ?
>
> -bjorn
>
>
>=20
>
>

--00000000000013547205bec3b7b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Probably not as it isn&#39;t listed in:<div><a href=3D"htt=
ps://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Dkoreader=
">https://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Dkor=
eader</a><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Tue, Mar 30, 2021 at 6:40 PM Bj=C3=B6rn Lustig &lt;<a=
 href=3D"mailto:bjorn.lustig@gmail.com">bjorn.lustig@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr"><div>Hey OE devs,</div><div><br></div><div>By chance, has anyone alread=
y developed a recipe for koreader ( <a href=3D"https://github.com/koreader/=
koreader" target=3D"_blank">https://github.com/koreader/koreader</a> ) ?</d=
iv><div><br></div><div>-bjorn<br></div><br></div>
<br>
<br>
<br>
</blockquote></div>

--00000000000013547205bec3b7b4--
