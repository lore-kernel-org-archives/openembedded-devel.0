Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.8621.1601193104344708523
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2020 00:51:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 08R7pf3W029928
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Sun, 27 Sep 2020 00:51:42 -0700 (PDT)
Received: from [128.224.162.131] (128.224.162.131) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Sun, 27 Sep 2020
 00:51:41 -0700
Subject: Re: [oe] [meta-python][PATCH 0/2] Update python3-pytest to 6.1.0
To: Tim Orling <ticotimo@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
References: <20200927054741.11210-1-kai.kang@windriver.com>
 <CANx9H-Ab2LG17H=_4U8a4m-xT+gHR6LQcR10v9OyU4AaeCKc4Q@mail.gmail.com>
From: "kai" <kai.kang@windriver.com>
Message-ID: <58d0fd17-7ded-936f-2fd7-5d468a051eee@windriver.com>
Date: Sun, 27 Sep 2020 15:50:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CANx9H-Ab2LG17H=_4U8a4m-xT+gHR6LQcR10v9OyU4AaeCKc4Q@mail.gmail.com>
Content-Type: multipart/alternative;
	boundary="------------BBA569F8B3AF4485DFADD040"
Content-Language: en-US

--------------BBA569F8B3AF4485DFADD040
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id 08R7pf3W029928

On 9/27/20 3:40 PM, Tim Orling wrote:
> When you do a major version update, or any update, =C2=A0please include =
the=20
> change log. It only takes a few seconds to copy and paste it. And then=
=20
> we all know what this change brings.

It is a little long what python3-pytest 6.1.0 changed, so I have=20
attached the link pointed to the changelog in the commit message.

" And the release changes are listed at:
 =C2=A0=C2=A0 https://docs.pytest.org/en/stable/changelog.html

Maybe it is more accurate to use=20
https://docs.pytest.org/en/stable/changelog.html#pytest-6-1-0-2020-09-26

Regards,
Kai

>
> On Sat, Sep 26, 2020 at 10:47 PM kai <kai.kang@windriver.com=20
> <mailto:kai.kang@windriver.com>> wrote:
>
>     From: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>
>
>
>
>
>     Kai Kang (2):
>
>     =C2=A0 python3-iniconfig: add recipe
>
>     =C2=A0 python3-pytest: 5.4.3 -> 6.1.0
>
>
>
>     =C2=A0.../python/python3-iniconfig_1.0.1.bb
>     <http://python3-iniconfig_1.0.1.bb> =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 8 +++++
>
>     =C2=A0...he-setup_requires-for-setuptools-scm.patch | 35
>     ++++++++++---------
>
>     =C2=A0...ytest_5.4.3.bb <http://ytest_5.4.3.bb> =3D>
>     python3-pytest_6.1.0.bb <http://python3-pytest_6.1.0.bb>} |=C2=A0 3 =
+-
>
>     =C2=A03 files changed, 29 insertions(+), 17 deletions(-)
>
>     =C2=A0create mode 100644
>     meta-python/recipes-devtools/python/python3-iniconfig_1.0.1.bb
>     <http://python3-iniconfig_1.0.1.bb>
>
>     =C2=A0rename
>     meta-python/recipes-devtools/python/{python3-pytest_5.4.3.bb
>     <http://python3-pytest_5.4.3.bb> =3D> python3-pytest_6.1.0.bb
>     <http://python3-pytest_6.1.0.bb>} (89%)
>
>
>
>     --=20
>
>     2.17.1
>
>
>
>
>
>    =20
>
>
>

--=20
Kai Kang
Wind River Linux


--------------BBA569F8B3AF4485DFADD040
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id 08R7pf3W029928

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-=
8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 9/27/20 3:40 PM, Tim Orling wrote:<b=
r>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CANx9H-Ab2LG17H=3D_4U8a4m-xT+gHR6LQcR10v9OyU4AaeCKc4Q@mail.gma=
il.com">
      <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUT=
F-8">
      <div dir=3D"auto">When you do a major version update, or any update,
        =C2=A0please include the change log. It only takes a few seconds t=
o
        copy and paste it. And then we all know what this change brings.
        <br>
      </div>
    </blockquote>
    <p>It is a little long what python3-pytest 6.1.0 changed, so I have
      attached the link pointed to the changelog in the commit message.</p=
>
    <p>" And the release changes are listed at:<a
        class=3D"moz-txt-link-freetext"
        href=3D"https://docs.pytest.org/en/stable/changelog.html"><br>
        =C2=A0=C2=A0 https://docs.pytest.org/en/stable/changelog.html</a><=
/p>
    <p>Maybe it is more accurate to use
      <a class=3D"moz-txt-link-freetext" href=3D"https://docs.pytest.org/e=
n/stable/changelog.html#pytest-6-1-0-2020-09-26">https://docs.pytest.org/en=
/stable/changelog.html#pytest-6-1-0-2020-09-26</a><br>
    </p>
    <p>Regards,<br>
      Kai<br>
    </p>
    <blockquote type=3D"cite"
cite=3D"mid:CANx9H-Ab2LG17H=3D_4U8a4m-xT+gHR6LQcR10v9OyU4AaeCKc4Q@mail.gma=
il.com">
      <div><br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Sat, Sep 26, 2020 at
            10:47 PM kai &lt;<a href=3D"mailto:kai.kang@windriver.com"
              moz-do-not-send=3D"true">kai.kang@windriver.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Kai
            Kang &lt;<a href=3D"mailto:kai.kang@windriver.com"
              target=3D"_blank" moz-do-not-send=3D"true">kai.kang@windrive=
r.com</a>&gt;<br>
            <br>
            <br>
            <br>
            <br>
            <br>
            Kai Kang (2):<br>
            <br>
            =C2=A0 python3-iniconfig: add recipe<br>
            <br>
            =C2=A0 python3-pytest: 5.4.3 -&gt; 6.1.0<br>
            <br>
            <br>
            <br>
            =C2=A0.../python/<a href=3D"http://python3-iniconfig_1.0.1.bb"
              rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true=
">python3-iniconfig_1.0.1.bb</a>=C2=A0
            =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8 +++++<br>
            <br>
            =C2=A0...he-setup_requires-for-setuptools-scm.patch | 35
            ++++++++++---------<br>
            <br>
            =C2=A0...<a href=3D"http://ytest_5.4.3.bb" rel=3D"noreferrer"
              target=3D"_blank" moz-do-not-send=3D"true">ytest_5.4.3.bb</a=
>
            =3D&gt; <a href=3D"http://python3-pytest_6.1.0.bb"
              rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true=
">python3-pytest_6.1.0.bb</a>}
            |=C2=A0 3 +-<br>
            <br>
            =C2=A03 files changed, 29 insertions(+), 17 deletions(-)<br>
            <br>
            =C2=A0create mode 100644 meta-python/recipes-devtools/python/<=
a
              href=3D"http://python3-iniconfig_1.0.1.bb" rel=3D"noreferrer=
"
              target=3D"_blank" moz-do-not-send=3D"true">python3-iniconfig=
_1.0.1.bb</a><br>
            <br>
            =C2=A0rename meta-python/recipes-devtools/python/{<a
              href=3D"http://python3-pytest_5.4.3.bb" rel=3D"noreferrer"
              target=3D"_blank" moz-do-not-send=3D"true">python3-pytest_5.=
4.3.bb</a>
            =3D&gt; <a href=3D"http://python3-pytest_6.1.0.bb"
              rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true=
">python3-pytest_6.1.0.bb</a>}
            (89%)<br>
            <br>
            <br>
            <br>
            -- <br>
            <br>
            2.17.1<br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------BBA569F8B3AF4485DFADD040--
