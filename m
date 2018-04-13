Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id DB1FA74667
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Apr 2018 09:05:53 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id s18so7583351wrg.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Apr 2018 02:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zg4BakQOsqlmaxONM+sP7195706rbE9XDlqBMTLSy6Y=;
	b=QMrrkCu46D07t3rdsHaIWJaZYHY4QslVSwaMo1aK/vyFA4PninEx+PBeEY7xh0EDGT
	M95wr5yAx+6wh3BTmP6+Zq1Do1BRTVFmO4e0gDd5DDaOIAjynxm9IpUPPIoKlYgJGyS6
	+UI3eudzJyIsh7SHgpn7Xowh6Zjwutk8Usc2lxiSPFvNPXntaUN0hedE3vckLlAFDzWC
	Tk7l/kPTpgauUIzovc5YCWAAjrSmD9gWJ5PZTxHA/JSz+LG2/HRD3I0t7oyM6ZlPWDsr
	nDwbqUoV61DddVuQZLWp8Md6+z7zR9A6Ty8YEjwpUzNUk2xXH7Xyz2lAaUJQcRoh1s8S
	He3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zg4BakQOsqlmaxONM+sP7195706rbE9XDlqBMTLSy6Y=;
	b=BiZqv4AUuI8YqIvOsdqjDoYQmDhE1/HutjzgtuiYawC9RGkneqiNJSfaWSTZpRJDpD
	EnJGlRUVRhWmRWmBckhbKye9Xi/GbdAUWed1NrXOr12kWrJkMtNyM0S8elBJ7rbOdUXD
	T0qKKB1xj8LKdxh3VwYS8K5iEAC/8wdT0E50GRavJBoy+z/PCXtPh5TfvbAyELpak9g5
	NBddflB3j23Lcmj7R9gMoFBob9VGwWVFchib0wP+3Il9+ABzB5ZLCjEQcPwIPe25GJXq
	zlIJFngnHL1pHOasybWc3td2+vutwhcIv/bf+ckgP9lwWdXlyCT6F61eF2q7KKru6Sbt
	dnQQ==
X-Gm-Message-State: ALQs6tBI+fjg1CX/BMbGM9H/beE2KJWDLeyKjgcvLGcqVxT0Mn1dje1K
	diNuwZL+Y0Yjtz7YMFL/EFZ0Xk1TR6KGBowOh6M=
X-Google-Smtp-Source: AIpwx4+fT4CdsyNv9YtW3mhNE0wK/CWXM38eymYXQ1rjHE9uiL6hZPv29ra1aCiJ3GH6Hb2kRyKJj20nay+4b8YQw8Q=
X-Received: by 10.223.163.155 with SMTP id l27mr199571wrb.133.1523610354139;
	Fri, 13 Apr 2018 02:05:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.126.12 with HTTP; Fri, 13 Apr 2018 02:05:53 -0700 (PDT)
In-Reply-To: <e3b7d598-e033-b698-0a4b-1b961e69c12b@zonque.org>
References: <20180412190931.4057-1-daniel@zonque.org>
	<CA+chaQeW=C8ZAhUSyNBH8r1ptnotA_o3Chj-ysNUxVSGH3sXcg@mail.gmail.com>
	<CA+chaQfSC_iBD6osNhz1zmOZiuxFEpVBFjtn-AHNmeDwn3-6XQ@mail.gmail.com>
	<e3b7d598-e033-b698-0a4b-1b961e69c12b@zonque.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 13 Apr 2018 11:05:53 +0200
Message-ID: <CA+chaQc-9kYgz6y-0=L3YCo+TTAytDEHhsdgYHncCBnvzyzVMw@mail.gmail.com>
To: Daniel Mack <daniel@zonque.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] Remove license files that were dropped in 5.9.5
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
X-List-Received-Date: Fri, 13 Apr 2018 09:05:54 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks, f23d1d54a06b0f3473e17300c3a1c495bcc25fdc added in rocko-next and
jansa/rocko

On Fri, Apr 13, 2018 at 10:47 AM, Daniel Mack <daniel@zonque.org> wrote:

> On Thursday, April 12, 2018 11:21 PM, Martin Jansa wrote:
> > Included in rocko-next and jansa/rocko branches now, thanks.
>
> qtdeclarative needs a bump as well ...
>
> diff --git a/recipes-qt/qt5/qtdeclarative_git.bb
> b/recipes-qt/qt5/qtdeclarative_git.bb
> index 827745d..0f1a30f 100644
> --- a/recipes-qt/qt5/qtdeclarative_git.bb
> +++ b/recipes-qt/qt5/qtdeclarative_git.bb
> @@ -30,6 +30,6 @@ do_install_append_class-nativesdk() {
>
>  EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG',
> 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
>
> -SRCREV = "317908e72a6ea0b4ca179690539cb352bbf60832"
> +SRCREV = "dfbe91853737ff8ab548925bbd40fc9183a6e05d"
>
>  BBCLASSEXTEND =+ "native nativesdk"
>
>

