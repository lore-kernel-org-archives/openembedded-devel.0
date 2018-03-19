Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f48.google.com (mail-pl0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id B88D878A1D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 22:39:00 +0000 (UTC)
Received: by mail-pl0-f48.google.com with SMTP id f23-v6so11158411plr.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 15:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eHvJFs/TiGIh2GLD9hiYj4io/Lc6A2TCj/1pOATpHyg=;
	b=FKq5dT/ueW9Qy9vA6mOjGYS7UT876WZLpyaK0PhyTUfdEwLj0e9hhmokSgjFxrAz0Q
	VaVb0HYbGIlnolgzhr10kwyvXQRqkBjmUQwsrMuz3eomO+BeiVMNukYDHKr5uYFlawW0
	p15+xO3ZPAFmPkzl5x0rrs31lMXQ1siYY9fU48+UDyCO7l4BJCz21sTVGRIwonk4N0sJ
	cgXjgPwPklLhiHhXYGl+Uv7sA7pD0Q/YWNSCSJrcSlzlNfbZp2ntPl6zxp/DWpkH7Yni
	3krsh17IVRwiXC7sAiK02V7WI+SQrLfRN85tTIkXElQPkM2fG7bAzibZvGJ2rcWXe43C
	6ZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eHvJFs/TiGIh2GLD9hiYj4io/Lc6A2TCj/1pOATpHyg=;
	b=OangymTDlACYtd9tKPI3qLni33KKGgmBhcZ3PxiihZcy7l4uPOWc/PWg3hLgjn2KEC
	6sIZpGpnnpPlKx+/4andkWFL7s8yU67nXkdYHFZhruIt9WfYp5fV/eELe+vr1kFZZ8xM
	X7SjhvyT7+GoAuR4RFoiznfxw8nR5u8pNfqPMleDknhSu2iTkq0CkJysDlOEMApKhrqh
	Y93fml90mKjJCY+8yebCl1Gb4eeLTgJvHmM7BU6b8HwjJIG1Z2beoCn1qYyEkm4t897C
	Bsl7kh0iLr0yd2QsQtLKmkv0fsWI2L/isyTIFSuiJ2tqWkEQn7uTRohITEv0USrQdxR4
	5xKA==
X-Gm-Message-State: AElRT7EYVROnvEVVdLb+hW6ltgvVIuWYTYDo1g52lwG/wk5piwPBZ9KT
	WChLoutQpOUE3IBPLVFF7T/6HsOX1iAh7REzvvA=
X-Google-Smtp-Source: AG47ELsNDGuwOMjrhP61zB5PRnY8UikPsAqupmoqc0yZPf2xRcnS3lpomKLbeNZa4ptEIJ2TXjFHhNSVmnaSHp5lVfQ=
X-Received: by 2002:a17:902:8f97:: with SMTP id
	z23-v6mr14168891plo.162.1521499141722; 
	Mon, 19 Mar 2018 15:39:01 -0700 (PDT)
MIME-Version: 1.0
References: <20180319202911.30760-1-schnitzeltony@gmail.com>
In-Reply-To: <20180319202911.30760-1-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Mar 2018 22:38:50 +0000
Message-ID: <CAMKF1soEZp-L6Ead9FV-Wp3EUhKcZBb+Q9BnJyMG5Z_xUaz_wg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 00/17] remove gnome2 recipes for discontinued projects
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
X-List-Received-Date: Mon, 19 Mar 2018 22:39:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 19, 2018 at 1:29 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m>
wrote:

> I can't stand the low-quality/split/maintainer-spam anymore: Guys one way
> to
> change things is start sending patches.
>

Indeed indeed that was my call at the very first of my replies thanks for
doing this patchset it looks a very promising start



> The following changes since commit
> 4598769a96980b756b3489ac71ed46a075cfabd7:
>
>   openbox: Improve handling of openbox-session / gnome-openbox-session
> (2018-03-16 19:27:54 -0700)
>
> are available in the Git repository at:
>
>   https://github.com/schnitzeltony/meta-openembedded.git quality-explosio=
n
>
> for you to fetch changes up to e739a1b1212a75a5530eeb238abd807cb3865138:
>
>   libidl: remove (2018-03-19 21:25:35 +0100)
>
> ----------------------------------------------------------------
> Andreas M=C3=BCller (17):
>       libglade: remove
>       evolution-data-server: remove libglade from dependencies
>       libgnomecanvas: remove
>       libbonoboui: remove
>       glade3: remove gnome packageconfig
>       libgnomeui: remove
>       libbonobo: remove
>       florence: remove
>       gnome-vfs: remove
>       gst-plugins-base: remove gnomevfs packageconfig
>       vlc: remove gnome-vfs packageconfig
>       libgnome: remove
>       gnome-mime-data: remove
>       gnome-themes: remove
>       orbit2: remove
>       gtk-engines: remove
>       libidl: remove
>
>  meta-gnome/recipes-devtools/glade/glade3_3.8.5.bb
>                                            |    3 -
>  meta-gnome/recipes-gnome/bonobo/files/0001-bonobo-ui-node-qualify-functi=
ons-with-G_GNUC_PRINTF.patch
>               |   49 --
>  meta-gnome/recipes-gnome/bonobo/files/gcc5.patch
>                                           |   12 -
>  meta-gnome/recipes-gnome/bonobo/files/gtk-doc.m4
>                                           |   53 --
>  meta-gnome/recipes-gnome/bonobo/files/gtk-doc.make
>                                           |  173 ----
>  meta-gnome/recipes-gnome/bonobo/libbonobo.inc
>                                            |   30 -
>  meta-gnome/recipes-gnome/bonobo/libbonobo/0001-Remove-use-of-G_DISABLE_D=
EPRECATED.patch
>                            |   47 -
>  meta-gnome/recipes-gnome/bonobo/libbonobo/do-not-use-srcdir-variable.pat=
ch
>                                         |   24 -
>  meta-gnome/recipes-gnome/bonobo/libbonobo/fix-nonliteral-in-string.patch
>                                           |   26 -
>  meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb
>                                            |    9 -
>  meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb
>                                            |   25 -
>  meta-gnome/recipes-gnome/eds/evolution-data-server_3.26.3.bb
>                                             |    2 +-
>  meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime-data/pkgconfig.patch
>                                           |   14 -
>  meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime-data_2.18.0.bb
>                                             |   19 -
>  meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/0001-multiple-Makefi=
le.am-remove-DG_DISABLE_DEPRECATED-to.patch
> |   77 --
>  meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/do-not-use-srcdir-va=
riable.patch
>                               |   22 -
>  meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/gconftool-lossage.pa=
tch
>                                        |   13 -
>  meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/gnome-vfs-no-kerbero=
s.patch
>                                    |   53 --
>  meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
>                                             |   58 --
>  meta-gnome/recipes-gnome/gtk-engines/files/glib-2.32.patch
>                                           |   23 -
>  meta-gnome/recipes-gnome/gtk-engines/files/substitute-tests.patch
>                                            |   37 -
>  meta-gnome/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
>                                             |   55 --
>  meta-gnome/recipes-gnome/libgnome/libgnome/0001-libgnome-Makefile.am-all=
ow-deprecated-symbols.patch
>                |   35 -
>  meta-gnome/recipes-gnome/libgnome/libgnome/05_fix_invalid_utf8.patch
>                                           |   26 -
>  meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb
>                                             |   38 -
>  meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb
>                                             |   22 -
>  meta-gnome/recipes-gnome/libgnome/libgnomeui/0001-suppress-string-format=
-literal-warning-to-fix-build-.patch
>       |   78 --
>  meta-gnome/recipes-gnome/libgnome/libgnomeui/05_fix_invalid_utf8.patch
>                                           |   21 -
>  meta-gnome/recipes-gnome/libgnome/libgnomeui/gnome-stock-pixbufs.h
>                                           | 4030
> -------------------------------------------------------------------------=
-------------
>  meta-gnome/recipes-gnome/libgnome/libgnomeui/no-pixbuf-csource.patch
>                                           |   11 -
>  meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb
>                                             |   34 -
>  meta-gnome/recipes-gnome/libidl/libidl-native_0.8.14.bb
>                                            |   10 -
>  meta-gnome/recipes-gnome/libidl/libidl.inc
>                                           |   13 -
>  meta-gnome/recipes-gnome/libidl/libidl_0.8.14.bb
>                                             |   13 -
>  meta-gnome/recipes-gnome/orbit2/orbit2/0001-linc2-src-Makefile.am-fix-bu=
ild-with-glib-2.36.patch
>                   |   34 -
>  meta-gnome/recipes-gnome/orbit2/orbit2/0002-Use-AM_CPPFLAGS-instead-of-I=
NCLUDES-and-fix-problem-.patch
>             |   42 -
>  meta-gnome/recipes-gnome/orbit2/orbit2/configure-lossage.patch
>                                           |   37 -
>  meta-gnome/recipes-gnome/orbit2/orbit2/pkgconfig-fix.patch
>                                           |   12 -
>  meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb
>                                            |   42 -
>  meta-gnome/recipes-gnome/themes/gnome-themes/drop-localedir-override.pat=
ch
>                                         |   22 -
>  meta-gnome/recipes-gnome/themes/gnome-themes/iconpath-option.patch
>                                           |   52 --
>  meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
>                                             |   39 -
>  meta-gnome/recipes-support/florence/florence_0.6.3.bb
>                                            |   21 -
>  meta-multimedia/recipes-multimedia/gstreamer-0.10/
> gst-plugins-base_0.10.36.bb                                       |    1 =
-
>  meta-multimedia/recipes-multimedia/vlc/vlc.inc
>                                           |    1 -
>  meta-oe/recipes-gnome/libglade/libglade-2.6.4/0001-configure.in-remove-d=
eprecated-GNOME_COMMON_INIT.patch
>          |   30 -
>  meta-oe/recipes-gnome/libglade/libglade-2.6.4/glade-cruft.patch
>                                            |  102 ---
>  meta-oe/recipes-gnome/libglade/libglade-2.6.4/no-xml2.patch
>                                            |  501 -----------
>  meta-oe/recipes-gnome/libglade/libglade-2.6.4/python_environment.patch
>                                           |   14 -
>  meta-oe/recipes-gnome/libglade/libglade_2.6.4.bb
>                                             |   35 -
>  50 files changed, 1 insertion(+), 6139 deletions(-)
>  delete mode 100644
> meta-gnome/recipes-gnome/bonobo/files/0001-bonobo-ui-node-qualify-functio=
ns-with-G_GNUC_PRINTF.patch
>  delete mode 100644 meta-gnome/recipes-gnome/bonobo/files/gcc5.patch
>  delete mode 100644 meta-gnome/recipes-gnome/bonobo/files/gtk-doc.m4
>  delete mode 100644 meta-gnome/recipes-gnome/bonobo/files/gtk-doc.make
>  delete mode 100644 meta-gnome/recipes-gnome/bonobo/libbonobo.inc
>  delete mode 100644
> meta-gnome/recipes-gnome/bonobo/libbonobo/0001-Remove-use-of-G_DISABLE_DE=
PRECATED.patch
>  delete mode 100644
> meta-gnome/recipes-gnome/bonobo/libbonobo/do-not-use-srcdir-variable.patc=
h
>  delete mode 100644
> meta-gnome/recipes-gnome/bonobo/libbonobo/fix-nonliteral-in-string.patch
>  delete mode 100644 meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb
>  delete mode 100644 meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb
>  delete mode 100644
> meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime-data/pkgconfig.patch
>  delete mode 100644 meta-gnome/recipes-gnome/gnome-mime-data/
> gnome-mime-data_2.18.0.bb
>  delete mode 100644
> meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/0001-multiple-Makefil=
e.am-remove-DG_DISABLE_DEPRECATED-to.patch
>  delete mode 100644
> meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/do-not-use-srcdir-var=
iable.patch
>  delete mode 100644
> meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/gconftool-lossage.pat=
ch
>  delete mode 100644
> meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs-2.24.4/gnome-vfs-no-kerberos=
.patch
>  delete mode 100644 meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.b=
b
>  delete mode 100644
> meta-gnome/recipes-gnome/gtk-engines/files/glib-2.32.patch
>  delete mode 100644
> meta-gnome/recipes-gnome/gtk-engines/files/substitute-tests.patch
>  delete mode 100644 meta-gnome/recipes-gnome/gtk-engines/
> gtk-engines_2.20.2.bb
>  delete mode 100644
> meta-gnome/recipes-gnome/libgnome/libgnome/0001-libgnome-Makefile.am-allo=
w-deprecated-symbols.patch
>  delete mode 100644
> meta-gnome/recipes-gnome/libgnome/libgnome/05_fix_invalid_utf8.patch
>  delete mode 100644 meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb
>  delete mode 100644 meta-gnome/recipes-gnome/libgnome/
> libgnomecanvas_2.30.3.bb
>  delete mode 100644
> meta-gnome/recipes-gnome/libgnome/libgnomeui/0001-suppress-string-format-=
literal-warning-to-fix-build-.patch
>  delete mode 100644
> meta-gnome/recipes-gnome/libgnome/libgnomeui/05_fix_invalid_utf8.patch
>  delete mode 100644
> meta-gnome/recipes-gnome/libgnome/libgnomeui/gnome-stock-pixbufs.h
>  delete mode 100644
> meta-gnome/recipes-gnome/libgnome/libgnomeui/no-pixbuf-csource.patch
>  delete mode 100644 meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.b=
b
>  delete mode 100644 meta-gnome/recipes-gnome/libidl/
> libidl-native_0.8.14.bb
>  delete mode 100644 meta-gnome/recipes-gnome/libidl/libidl.inc
>  delete mode 100644 meta-gnome/recipes-gnome/libidl/libidl_0.8.14.bb
>  delete mode 100644
> meta-gnome/recipes-gnome/orbit2/orbit2/0001-linc2-src-Makefile.am-fix-bui=
ld-with-glib-2.36.patch
>  delete mode 100644
> meta-gnome/recipes-gnome/orbit2/orbit2/0002-Use-AM_CPPFLAGS-instead-of-IN=
CLUDES-and-fix-problem-.patch
>  delete mode 100644
> meta-gnome/recipes-gnome/orbit2/orbit2/configure-lossage.patch
>  delete mode 100644
> meta-gnome/recipes-gnome/orbit2/orbit2/pkgconfig-fix.patch
>  delete mode 100644 meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb
>  delete mode 100644
> meta-gnome/recipes-gnome/themes/gnome-themes/drop-localedir-override.patc=
h
>  delete mode 100644
> meta-gnome/recipes-gnome/themes/gnome-themes/iconpath-option.patch
>  delete mode 100644 meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.b=
b
>  delete mode 100644 meta-gnome/recipes-support/florence/florence_0.6.3.bb
>  delete mode 100644
> meta-oe/recipes-gnome/libglade/libglade-2.6.4/0001-configure.in-remove-de=
precated-GNOME_COMMON_INIT.patch
>  delete mode 100644
> meta-oe/recipes-gnome/libglade/libglade-2.6.4/glade-cruft.patch
>  delete mode 100644
> meta-oe/recipes-gnome/libglade/libglade-2.6.4/no-xml2.patch
>  delete mode 100644
> meta-oe/recipes-gnome/libglade/libglade-2.6.4/python_environment.patch
>  delete mode 100644 meta-oe/recipes-gnome/libglade/libglade_2.6.4.bb
> --
> 2.14.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

