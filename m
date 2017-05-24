Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by mail.openembedded.org (Postfix) with ESMTP id 68D5B77DD5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 May 2017 18:07:54 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id h82so13319697ywb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 May 2017 11:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7Ss1iwddyGYCTE91g+jNtO58rjxBulfAjnm7T3lnJKg=;
	b=s5r6J6tQtl/UxWUUTTthU6n019OjiZk6qPRdqemsa2Wc1N5GERnsvPy34oQj1e29TN
	365KrZmyMAQ3WeoHMx2GgQ4auI1Oj9frsg9Zw/ufcACc88fWeG2ydZknqy42yxxMrhHu
	OssMQIQJ8ru3bLmUmZEJIzOVH/MeWlIieYhRe1fp/yI9a9brisDPv1icUTsfLbjye47W
	O1bV+MCICdbET7MuXnun3EKGiiN4zvHtqffCzEoc9FGGhwAsqROo+9pTUnKhk7pkYiAn
	OSBxqmwhfusIwSyMllyvBfDlyo7Wm4yP2bG6CnxA/DeVJ0p5XItg8R6prNmF3H657gTF
	iODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7Ss1iwddyGYCTE91g+jNtO58rjxBulfAjnm7T3lnJKg=;
	b=ev5pkyfjrL8zocIUKgAPXn7jTfQyDQm6DU7ozNZyKhtkdFhHSPxT+vzTAd4LE21pCr
	td5+IXCCOwlg4VXTB71MEcCLzDdU48c3B2WmSg1R0tN9OOd58fqRYHjd02nONTlavUPe
	sW5KGjDgOhjuvIfPKf1LwqeaRezXtWOdeC5lpdDKjhXWF/ydKlo7OR6SUu4uGRQdMRUd
	EeZXO+13otG6dQCDD1/tvaco7LbiAG9Zgv9j5yKn/g6aZ9VQgqSsVYwTdvCccQcKLTmB
	vLFngWMi1K3BORcWdUbYq5AQM6Tn3kZz7cCaf9Aqimf5bjxPFzdK09d3+VzBzuoR1ScG
	HqfA==
X-Gm-Message-State: AODbwcBwMuStd3FBASe8BWyAyrYr4IJ6zG/8xcuO2drbwK3OtKKNDMp3
	x2D3rHmHEPS68uzVH7BAQgUEkeyJlw==
X-Received: by 10.129.82.68 with SMTP id g65mr22043332ywb.33.1495649276309;
	Wed, 24 May 2017 11:07:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.162.38 with HTTP; Wed, 24 May 2017 11:07:55 -0700 (PDT)
In-Reply-To: <53440828.3Sg9Fezlrp@samweis.auenland.lan>
References: <20170524153407.22969-1-dl9pf@gmx.de>
	<CA+chaQcTOv_sa3_j7_4xH-k01mkhN+QLhrSoCasBfoSnJdABSA@mail.gmail.com>
	<CA+chaQdQPSvbnz0FPvF30ga6dJgdZFUox1952qgnqJaFUJ3B_A@mail.gmail.com>
	<53440828.3Sg9Fezlrp@samweis.auenland.lan>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 24 May 2017 20:07:55 +0200
Message-ID: <CA+chaQfowifcBP9sdzCLh3pw7LUswyu9ZPKFJ7puz1JXjjg58g@mail.gmail.com>
To: =?UTF-8?Q?Jan=2DSimon_M=C3=B6ller?= <dl9pf@gmx.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] [meta-oe][master, morty] sg3-utils upstream SRC_URI unavailable
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
X-List-Received-Date: Wed, 24 May 2017 18:07:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

http://sources.openembedded.org/sg3_utils-1.42.tgz -> 200 OK This is what
counts

On Wed, May 24, 2017 at 7:53 PM, Jan-Simon M=C3=B6ller <dl9pf@gmx.de> wrote=
:

> http://sources.openembedded.org/  -> 403 Forbidden
>
> --
>
> Dipl.-Ing.
> Jan-Simon M=C3=B6ller
>
> jansimon.moeller@gmx.de
> On Wednesday 24 May 2017 19:07:59 Martin Jansa wrote:
> > I've fixed it for now.
> >
> > sources.openembedded.org points to /home/home2/jenkins/htdocs/oe-
> sources/
> >
> > While jenkins jobs rsync it to /home5/jenkins/htdocs/oe-sources/,
> >
> > I don't know who moved it or why, so I've just rsynced current state:
> > $ rsync -avir /home5/jenkins/htdocs/oe-sources/
> > /home/home2/jenkins/htdocs/oe-sources/
> >
> > Removed confusing and outdated index* files
> > $ rm -f /home/home2/jenkins/htdocs/oe-sources/index*
> >
> > and some weird empty directories:
> > $ rmdir  fixes i586/ images/ licenses/ opensuse/ opkg/conf opkg pam.d
> > porting prefs scripts share test touchscreen/ x86_64/ iceweasel-brandin=
g/
> > arm backport chromium-40/ debian-hacks/ debian1.0.2/ eglibc-2.17/
> > etc/default/ etc/init.d/ etc debian/fixes/ debian/
> >
> > and a bit more:
> > jenkins@milla:/home/home2/jenkins/htdocs/oe-sources$ find home/
> > home/
> > home/jenkins
> > home/jenkins/oe
> > home/jenkins/oe/world
> > home/jenkins/oe/world/shr-core
> > home/jenkins/oe/world/shr-core/openembedded-core
> > home/jenkins/oe/world/shr-core/openembedded-core/scripts
> > home/jenkins/oe/world/shr-core/tmp-glibc
> > home/jenkins/oe/world/shr-core/tmp-glibc/work
> > home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-gnueabi
> > home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-
> linux-gnueabi/lsof
> > home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-
> linux-gnueabi/lsof/4
> > .88-r0
> >
> > home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linu
> > x-gnueabi/lsof/4.88-r0/lsof_4.88
> > home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi
> > home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-
> oe-linux-gnueabi/lsof
> > home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-
> oe-linux-gnueabi/lsof/
> > 4.88-r0
> >
> > home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-
> > linux-gnueabi/lsof/4.88-r0/lsof_4.88
> > home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-
> oe-linux-gnueabi/lsof/
> > 4.89-r0
> >
> > home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-
> > linux-gnueabi/lsof/4.89-r0/lsof_4.89
> > home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux
> > home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/lsof
> > home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-
> oe-linux/lsof/4.88-r0
> >
> > home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-
> oe-linux/lsof/4.88-r0
> > /lsof_4.88
> >
> > home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-
> oe-linux/lsof/4.89-r0
> >
> > home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-
> oe-linux/lsof/4.89-r0
> > /lsof_4.89
> >
> > home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux
> > home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/lsof
> > home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/lsof/4.88-r=
0
> > home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-
> linux/lsof/4.88-r0/lso
> > f_4.88
> >
> > home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/lsof/4.89-r=
0
> > home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/
> > lsof/4.89-r0/lsof_4.89
> > $ rm -rf home/
> > $ du -hs git
> > 581M    git
> > $ rm -rf git/ (someone with cow powers here will need to remove this as
> > some files were owned by different than jenkins account)
> > $ ls -lah git/www.sakoman.net.git.u-boot-omap3.git/.git/refs/tags/v20
> > 09.06-rc1
> > -rw-r--r--+ 1 tking admin 41 Oct 27  2009 git/www.sakoman.net.git.u-boo=
t
> > -omap3.git/.git/refs/tags/v2009.06-rc1
> > similarly with:
> > $ du -hs svn cvs hg bzr
> > 1.4M    svn
> > 932K    cvs
> > 8.0K    hg
> > 20K     bzr
> >
> > Please also chown following 4 files to be owned by jenkins:jenkins
> > -rw-r--r--+  1 www-data www-data  4.4M Apr 14  2016
> git2_git.lighttpd.net.
> > lighttpd.lighttpd-1.x.git.tar.gz
> > -rw-r--r--+  1 www-data www-data    89 Apr 14  2016
> git2_git.lighttpd.net.
> > lighttpd.lighttpd-1.x.git.tar.gz.md5
> > -rw-r--r--   1 root     root      237K Apr 27  2016 zaurus-legacy-tar.g=
z
> > -rw-r--r--   1 root     root        55 Apr 27  2016
> zaurus-legacy-tar.gz.md5
> >
> > And in the end I've created backup if anyone misses
> > mv /home5/jenkins/htdocs/oe-sources/ /home5/jenkins/htdocs/oe-
> sources-old
> >
> > and replaced the old one with symlink to
> > /home/home2/jenkins/htdocs/oe-sources/ so it should be updated
> > automatically until someone moves it again somewhere else.
> >
> > Regards,
> >
> >
> >
> >
> >
> > On Wed, May 24, 2017 at 5:51 PM, Martin Jansa <martin.jansa@gmail.com>
> >
> > wrote:
> > > +Tom
> > >
> > > the archives are correctly rsynced to milla:
> > >
> > > jenkins@milla:~$ ls htdocs/oe-sources/sg3*
> > > htdocs/oe-sources/sg3-utils_1.24.orig.tar.gz
> > > htdocs/oe-sources/sg3-utils_1.24.orig.tar.gz.md5
> > > htdocs/oe-sources/sg3_utils-1.31.tgz
> > > htdocs/oe-sources/sg3_utils-1.38.tgz
> > > htdocs/oe-sources/sg3_utils-1.40.tgz
> > > htdocs/oe-sources/sg3_utils-1.41.tgz
> > > htdocs/oe-sources/sg3_utils-1.42.tgz
> > >
> > >
> > > but they don't appear on http://sources.openembedded.org/ can you
> check
> > > what went wrong? The DNS might point to different host or something
> like
> > > that, because there are no archives from 2016 or 2017 (newest I've se=
en
> > > are
> > > from April 2015) and I think it was working a bit longer than that.
> > >
> > > On Wed, May 24, 2017 at 5:45 PM, Martin Jansa <martin.jansa@gmail.com=
>
> > >
> > > wrote:
> > >> Why do you introduce the bbappend instead of fixing it in
> > >> ./meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bb ?
> > >>
> > >> It should be on sources.openembedded.org (everything built in my
> bitbake
> > >> world should be rsynced there, will check where it got broken this
> time).
> > >>
> > >> On Wed, May 24, 2017 at 5:41 PM, Khem Raj <raj.khem@gmail.com> wrote=
:
> > >>> On Wed, May 24, 2017 at 8:34 AM,  <dl9pf@gmx.de> wrote:
> > >>> > From: Jan-Simon M=C3=B6ller <dl9pf@gmx.de>
> > >>> >
> > >>> > This patch temporarily fixes the unavailable upstream URL for
> > >>> > sg3-utils
> > >>> > with an bbappend that redirects the SRC_URI to a mirror.
> > >>> > Checksums match.
> > >>> >
> > >>> > Signed-off-by: Jan-Simon M=C3=B6ller <dl9pf@gmx.de>
> > >>> > ---
> > >>> >
> > >>> >  meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bbappend | 2 ++
> > >>> >  1 file changed, 2 insertions(+)
> > >>> >  create mode 100644 meta-oe/recipes-support/sg3-ut
> > >>>
> > >>> ils/sg3-utils_1.42.bbappend
> > >>>
> > >>> > diff --git a/meta-oe/recipes-support/sg3-
> utils/sg3-utils_1.42.bbappend
> > >>>
> > >>> b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bbappend
> > >>>
> > >>> > new file mode 100644
> > >>> > index 000000000..aeef696cf
> > >>> > --- /dev/null
> > >>> > +++ b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bbappend
> > >>> > @@ -0,0 +1,2 @@
> > >>> > +# Upstream URL currently unavailable. Use mirror:
> > >>> > +SRC_URI =3D "https://fossies.org/linux/misc/sg3_utils-${PV}.tgz"
> > >>>
> > >>> Can we also host it on sources.openembedded.org please ?
> > >>>
> > >>> > --
> > >>> > 2.12.0
> > >>> >
> > >>> > --
> > >>> > _______________________________________________
> > >>> > Openembedded-devel mailing list
> > >>> > Openembedded-devel@lists.openembedded.org
> > >>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >>>
> > >>> --
> > >>> _______________________________________________
> > >>> Openembedded-devel mailing list
> > >>> Openembedded-devel@lists.openembedded.org
> > >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

