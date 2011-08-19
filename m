Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sylvain.pare@gmail.com>) id 1QuS4M-0000sQ-HB
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Aug 2011 18:37:18 +0200
Received: by qwh5 with SMTP id 5so2207050qwh.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2011 09:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=jHpjPm2FVD1H9QqhaMYdvY0kxM3xs4DL+24do61qSOM=;
	b=jyxe7L0260oigBk8yQtDfntu2qFGipFC5wrW/3Shh2FUcpvo59j6mFfhflCiAXoYBW
	Ed/lDoAmTFAJCgam8fm4EST/nJtm64A5qWuIThyvCyESqhanyhjhR/LqgdvAD+lxpx/2
	ZAdwqlYsapIrF3GBuyEui8WSWx/Qjcy6FmCwo=
Received: by 10.224.206.66 with SMTP id ft2mr2254170qab.379.1313771557057;
	Fri, 19 Aug 2011 09:32:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.239.76 with HTTP; Fri, 19 Aug 2011 09:32:16 -0700 (PDT)
In-Reply-To: <1313768459.3673.48.camel@mattotaupa>
References: <CACrTVg+OATbFizVqggezkfyM_k0i-JVfuBv3FNj0f59JthmvQQ@mail.gmail.com>
	<CACrTVgLU_=OHhepbGWM-m5U_siu_wBjci9-__xSO9ryhYdDh5Q@mail.gmail.com>
	<1313768459.3673.48.camel@mattotaupa>
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Fri, 19 Aug 2011 18:32:16 +0200
Message-ID: <CACrTVgLZ-7ZmBQv=GyjH30i-ESqrTm-=-mTPxaet9bZygv_jQQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] libpng: upgrade to 1.2.46
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Aug 2011 16:37:18 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Thanks Paul.
Yeah sorry about that.. I am about doing this for an other patch


2011/8/19 Paul Menzel <paulepanter@users.sourceforge.net>

> Dear Sylvain,
>
>
> Am Freitag, den 19.08.2011, 16:11 +0200 schrieb Sylvain Par=E9:
>
> > I have modified my patch to remove the old filepatch too. patch below :
>
> [=85]
>
> thank you for your patch. I applied after trying to fix up Google Mail=92=
s
> line wrapping, but I failed and therefore had to most of the stuff
> manually. Please try to avoid such issues in the future by using `git
> send-mail` or a =93good=94 mail program.
>
> The commit is b557ba57 [1].
>
>
> Thanks,
>
> Paul
>
>
> [1]
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Db557ba574=
5aa39bb9f0a6a9b3aaca5692bf21339
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>

