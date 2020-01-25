Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 76F1E7FD5C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jan 2020 16:02:14 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id v25so4039044qto.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jan 2020 08:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=po7X6vRsE2lYlzzb/SfM3ESGRQVf4/EcF0qtDhnRh9s=;
	b=AlBRqnhXjl06UytupE6ejFiLbBRWgp1Q4+6rMngGzE7seVO9TT/aKxQaTakpOewOiG
	RrOV5LPf9ryhyQxXogJKflmfk+pMi2qI0Rea8IUzZYGnlJ3jN8ggR+lqeD6Lu4rhbBNO
	c4bcauYEuhl2WIKdLSaFmVDTs51s2bsCSDjSAxG2xJgzquF/Pw7E3mfaDVFUbLaDtK4D
	2HPK1KBtrbF+8fAuRDyz4E4hJf/D5quRlBgCxzUoH1dFV0EQGSMSPaB3wxbMXKlPirXL
	13Lb+kQ72JQCc/VYFj1zX/J1C7fMmdfs1Gk/jZ5fpzZX+5pQUUDxeRsn1gs8bKBlrG+l
	TiiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=po7X6vRsE2lYlzzb/SfM3ESGRQVf4/EcF0qtDhnRh9s=;
	b=YIoOB0dg2VqcciQRIKpoxgibOhCRtdq4EOie9C7zzqwU8Wta9OARNaug+YXuJ++UzB
	Jro/fueJVOXpMAjJUQaypMyUEvXE2TlQAlmQpphgNmAbdYZR5iQqTqi86FK+PbvqtVC4
	Ut6AsI9Vi0rOiZC0G7CKsjqdB5a4XlDWqLWuVMeymyPtDJGJUp8LJPMkcUwP0VoDnF07
	3W4i2nG7syTubAqU6LLB9XNjZqons+EYJSSRh7ythDb8+VnXtwKy3BRPbelnFcAIImZI
	BzuX58WGvcaNeDUaLfNMJ5KXHpmvue0i3rkNfoorz3cVd3zWchl4LBctT/glWH0o5Pwo
	hp3g==
X-Gm-Message-State: APjAAAVPEZZFBNRrIVcAZG7C8ePwhQBKyqX1tGs66QXavcFQMBQsufsO
	sbV9R5gcR9u3B98gCoyyfdqRqY7TwmB6HQXY3UY=
X-Google-Smtp-Source: APXvYqy69YJFVSeqidquXKGIesdU/TKm9REZG73PIiQHqrNCty15/K6C1vZ2yGLbw7IZhOXFVTwW0V1He3XwMctpIY0=
X-Received: by 2002:ac8:1a30:: with SMTP id v45mr7725142qtj.80.1579968135050; 
	Sat, 25 Jan 2020 08:02:15 -0800 (PST)
MIME-Version: 1.0
References: <20200125144043.18259-1-costamagnagianfranco@yahoo.it>
	<20200125144043.18259-2-costamagnagianfranco@yahoo.it>
In-Reply-To: <20200125144043.18259-2-costamagnagianfranco@yahoo.it>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 25 Jan 2020 08:01:48 -0800
Message-ID: <CAMKF1srY9dVvaeYLxTFqoXBCb8-UkgO4b6oo3_Fzi-Wvs4LSdA@mail.gmail.com>
To: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] boinc-client: cosmetic changes, such as unifying tabs VS spaces and adding cosmetic newlines
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
X-List-Received-Date: Sat, 25 Jan 2020 16:02:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 25, 2020 at 6:41 AM Gianfranco Costamagna
<costamagna.gianfranco@gmail.com> wrote:
>

patch is fine but commit message summary line is too big, usually we like

summary line ( perhaps < 80 char>

Details summary

see https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
Patch Headers and Commit Messages section.


> Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> ---
>  meta-oe/recipes-extended/boinc/boinc-client_7.16.bb | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.16.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.16.bb
> index 0780993db..c52828018 100644
> --- a/meta-oe/recipes-extended/boinc/boinc-client_7.16.bb
> +++ b/meta-oe/recipes-extended/boinc/boinc-client_7.16.bb
> @@ -73,15 +73,16 @@ do_compile_prepend () {
>         sed -i -e 's|^sys_lib_dlsearch_path_spec=.*|sys_lib_dlsearch_path_spec=""|g' ${B}/${TARGET_SYS}-libtool
>         sed -i -e 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' ${B}/${TARGET_SYS}-libtool
>  }
> +
>  do_install_append() {
>         if [ -e ${D}${nonarch_libdir}/systemd/system/boinc-client.service ]; then
> -                install -d ${D}${systemd_system_unitdir}
> +               install -d ${D}${systemd_system_unitdir}
>                 mv \
>                 ${D}${nonarch_libdir}/systemd/system/boinc-client.service \
>                 ${D}${systemd_system_unitdir}/boinc-client.service
>                 rmdir --ignore-fail-on-non-empty ${D}${nonarch_libdir}/systemd/system \
> -                ${D}${nonarch_libdir}/systemd \
> -                ${D}${nonarch_libdir}
> +               ${D}${nonarch_libdir}/systemd \
> +               ${D}${nonarch_libdir}
>         fi
>  }
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

