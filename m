Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f175.google.com (mail-yk0-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id 98DDC72850
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 19:30:20 +0000 (UTC)
Received: by mail-yk0-f175.google.com with SMTP id 200so5621769ykr.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 11:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=zCjj2KqTndkAAobi/rODZS7XdO9pbNBEZoADn/ocMgE=;
	b=nQ6op4Br6u+nSkNshOMYgjXLJ9qte+MPOh/Yh18hQje/Q/KKQlEch9y4x4qrmbv6s2
	qqu1bD/IgL7g7toKKK8UbG6ZlSnVjTIW9xWj5vYlDntXSeL+EsGVimN59vwuKRrgt5Qa
	m9nKlbOOb9Tg5U0O/lxUQfoR/h36KUw0/VV9HfL9hoU1v7WoSTY1wAAiiUgMSwbkTaCa
	MRJb9IEKmvD+qps3DwB5ujDDGyNwQLD64kRGNwxwlBWbEMNuLD5IetU7JR3GvBXSkjyJ
	dDLKVqCWqVSn30PuaAEcKUAlBc8rx+E5MkY/AJK9SHnzhtYd17i5eTK5mMnvNe/h7Fit
	ggjw==
MIME-Version: 1.0
X-Received: by 10.236.210.5 with SMTP id t5mr33762577yho.104.1419708621515;
	Sat, 27 Dec 2014 11:30:21 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Sat, 27 Dec 2014 11:30:21 -0800 (PST)
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
Date: Sat, 27 Dec 2014 17:30:21 -0200
X-Google-Sender-Auth: xa3VZkuDp70mDcOZ8yvkmI1Bl5k
Message-ID: <CAP9ODKrSB+U_SvFYbAj_SxT+OKhL4znpfjfcpVVEdawMk8J5yw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Armin Kuster <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 00/27] [Dizzy-next] pull request
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 27 Dec 2014 19:30:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Armin,

On Sat, Dec 27, 2014 at 3:21 PM, Armin Kuster <akuster808@gmail.com> wrote:
> Please consider these changes for Dizzy-next
>
> The following changes since commit 510b7a9d8d5dda07120df5866507742a626478=
c1:
>
>   krb5: fix CVE-2014-5351 (2014-12-01 14:24:53 +0100)
>
> are available in the git repository at:
>
>   https://github.com/akuster/meta-openembedded.git akuster/dizzy-next
>   https://github.com//tree/akuster/dizzy-next
>
> Andreas M=C3=BCller (1):
>   glibmm: add perl to RDEPENDS_{PN}-dev
>
> Awais Belal (1):
>   enca: fix broken automake
>
> Belal, Awais (2):
>   mplayer2: use autotools-brokensep (B =3D S)
>   mplayer2: cleanup empty directories
>
> Chong.Lu@windriver.com (2):
>   samba: add winbind.service to winbind package
>   samba: fix error messages when startup samba service
>
> Chris Morgan (1):
>   dfu-util: Point to gitorious.org repository as gnumonks.org is down
>
> Gary S. Robertson (2):
>   libhugetlbfs: Make cross-devel recognize all ix86 arches
>   libhugetlbfs: Fix page size & text offset for arm arches
>
> Jackie Huang (5):
>   postfix.inc: Remove references to buildmachine paths in target
>     makedefs.out
>   rrdtool: inherit cpan-base to help build perl modules
>   rrdtool: add missing dependency on groff-native
>   hostapd: several fixes for init script
>   rfkill: fix the SRC_URI
>
> Javier Viguera (1):
>   xserver-common: disable TCP connections
>
> Kai Kang (1):
>   polarssl: add dependency openssl
>
> Kang Kai (2):
>   libnet-ssleay-perl: avoid host contamination
>   meta-gnome: fix typo of directory name
>
> Liu Jian (1):
>   lvm2: add lvm.con to CONFFILES

Typo!

>
> Martin Jansa (3):
>   iotop: Drop python-distutils from RDEPENDS
>   PNBLACKLIST: use weak assignments
>   xf86-video-glamo: fix build with xserver 1.16

The fix for 1.16, as said by Martin, are not needed. So I'd prefer to
not backport it for now (and we can consider it if we have a conflict
due the lack of it in future).

> Peter Bigot (3):
>   imagemagick: update URI to allow fetching current and previous
>     releases
>   obexd: conflict with bluez5
>   obex-data-server: conflict with bluez5
>
> Robert Yang (1):
>   libcanberra: fix installed-vs-shipped warning
>
> Wenzong Fan (1):
>   sethdlc: fix host contamination

Apart from those two comments I am fine with all the others. :)

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

