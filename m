Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 8CFBC789B4
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Mar 2018 05:22:53 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1520054575; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=qRde0vfr+myavfkT7uPF8f2MxZ5nOs/MnOKzTwTAVVA=;
	b=wPW42Moe8eOwY7ZDkaaDsJYAb2MTCxQn3w78EXXo+iC7ZnYwhX4wTahVLflKUlZdXcKt3/kc
	928UHyq8jSK2zBHOWLnr6e0jR3obSVF7mtlUPHDLsW+GzOmxLUBgccVY9LL1pxx2AEy+y5/6
	n4wwv4aTuOnaqB8Z4K4w2XJuyJ8=
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
X-Mailgun-Sending-Ip: 104.130.122.4
Sender: derek@asterius.io
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mxa.mailgun.org with ESMTP id 5a9a312f.7f984c17c2b0-smtp-out-n02;
	Sat, 03 Mar 2018 05:22:55 -0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id 130so14604150qkd.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Mar 2018 21:22:54 -0800 (PST)
X-Gm-Message-State: AElRT7HXka3JijZTleQYW3IdjClOHUcigcvSklh21NEegEHSG8wfV5ps
	0wrnaDwn2BsceKg0E/S5Ax/BRjFUDfM3oBUSWnw=
X-Google-Smtp-Source: AG47ELus+mRpxx7iyldM0hBCygQ0TRAITZM8qacCo7BLTsBZVBk+cEgb/TRVDA896UtG7GQinBRr4RFOPad+cHxpXRo=
X-Received: by 10.55.166.215 with SMTP id p206mr12380876qke.69.1520054574795; 
	Fri, 02 Mar 2018 21:22:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.108.35 with HTTP; Fri, 2 Mar 2018 21:22:54 -0800 (PST)
Received: by 10.140.108.35 with HTTP; Fri, 2 Mar 2018 21:22:54 -0800 (PST)
In-Reply-To: <CANx9H-CserwUFp2PyQEnYxAoL_dY6xwvJvz6ExuPwmbYOaLsnQ@mail.gmail.com>
References: <1519999561-9599-1-git-send-email-derek@asterius.io>
	<3f95e0a7-4663-cb73-6ab1-7eed4ab8927f@gmail.com>
	<CADNbA1p09wdEJGEW7d4wpoVWMLEzEKPAaF6PvPEtdOJFf2f0wA@mail.gmail.com>
	<CAMKF1srYnC2_hNEHfHC6hoH5wp8Y+OHqAD6fZpFzqpTHxOqwXQ@mail.gmail.com>
	<CADNbA1p=3uip_ROcCBwxZ4GJs0grUe1v6vhN5NoRUyacVJnS5w@mail.gmail.com>
	<CANx9H-CserwUFp2PyQEnYxAoL_dY6xwvJvz6ExuPwmbYOaLsnQ@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Sat, 3 Mar 2018 00:22:54 -0500
X-Gmail-Original-Message-ID: <CADNbA1qDZ+fdr7a6_408hTVeaUojT+OFYjyoNdVy5kiaeK=gpg@mail.gmail.com>
Message-ID: <CADNbA1qDZ+fdr7a6_408hTVeaUojT+OFYjyoNdVy5kiaeK=gpg@mail.gmail.com>
To: Tim Orling <ticotimo@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-sqlalchemy: update to version 1.1.17
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 03 Mar 2018 05:22:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Overall, it seems like there are bigger issues to worry about.  I just want
consistency.  I'm willing to conform to whatever people want.

On Mar 3, 2018 12:19 AM, "Tim Orling" <ticotimo@gmail.com> wrote:

> I usually would have said =E2=80=9Cthe copyright year changed, but the te=
rms
> remain the same=E2=80=9D, but I agree we need consistency. Tooling to mak=
e the
> license diff easy to generate is probably the key (and is in progress).
>
> Thank you again, Derek, for all your efforts to keep meta-python up to
> date.
>
> And thank you to Khem for taking the time to review and comment when few
> others ever do.
>
> On Fri, Mar 2, 2018 at 8:45 PM Derek Straka <derek@asterius.io> wrote:
>
>> This is the exact same commit message I've used at least 10s of times
>> without any negative feedback.  Saying the terms remain the same seems
>> sufficient to me to acknowledge the fact I looked at the license and it
>> was
>> reviewed as you stated.  I can start putting the diff in the commit if i=
t
>> adds value but let's start being consistent as a community in what we
>> expect.
>>
>> Even as a maintainer of several layers in meta-openembedded I don't know
>> what we as a community expect...
>>
>> On Mar 2, 2018 11:34 PM, "Khem Raj" <raj.khem@gmail.com> wrote:
>>
>> On Fri, Mar 2, 2018 at 8:15 PM, Derek Straka <derek@asterius.io> wrote:
>> > What more would you like in the commit message?  The license terms are
>> the
>> > same; the copyright moved to 2018.  Do we really need to put the resul=
ts
>> of
>> > the diff in the commit message?
>> >
>>
>> Not strictly, but you can. In general a line or two about the reason
>> is always a good thing.
>> The commit message wasn't clear about it.
>> This is essentially to let users as well as reviewers know that license
>> changes
>> were reviewed and a line in commit message is there for later to go back
>> and see what changed
>>
>>
>> >
>> > On Mar 2, 2018 9:52 PM, "Khem Raj" <raj.khem@gmail.com> wrote:
>> >
>> > On 3/2/18 6:06 AM, Derek Straka wrote:
>> >> Update the license checksum and verify the terms remain the same
>> >>
>> >> Signed-off-by: Derek Straka <derek@asterius.io>
>> >> ---
>> >>  meta-python/recipes-devtools/python/python-sqlalchemy.inc
>>  | 6
>> >> +++---
>> >>  .../{python-sqlalchemy_1.1.15.bb =3D> python-sqlalchemy_1.1.17.bb}
>> | 0
>> >>  .../{python3-sqlalchemy_1.1.15.bb =3D> python3-sqlalchemy_1.1.17.bb}
>> | 0
>> >>  3 files changed, 3 insertions(+), 3 deletions(-)
>> >>  rename meta-python/recipes-devtools/python/{python-sqlalchemy_1.1.
>> 15.bb
>> >> =3D> python-sqlalchemy_1.1.17.bb} (100%)
>> >>  rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.
>> 1.15.bb
>> >> =3D> python3-sqlalchemy_1.1.17.bb} (100%)
>> >>
>> >> diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy.in=
c
>> >> b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
>> >> index 2683a6a..0c191ae 100644
>> >> --- a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
>> >> +++ b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
>> >> @@ -2,13 +2,13 @@ DESCRIPTION =3D "Python SQL toolkit and Object
>> Relational
>> >> Mapper that gives \
>> >>  application developers the full power and flexibility of SQL"
>> >>  HOMEPAGE =3D "http://www.sqlalchemy.org/"
>> >>  LICENSE =3D "MIT"
>> >> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D452f4b8adb0feba42e5be5f1f=
bfbf5
>> 38"
>> >> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db1c412c9d8d1ce018f7a93744=
07c22
>> bb"
>> >>
>> >
>> > what changed here ?
>> >
>> >
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>

