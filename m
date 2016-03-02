Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id CCE606FF97
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Mar 2016 10:31:44 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id p65so73336934wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Mar 2016 02:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=/LRJatL/OyX91HuDrZx08vv8Jk1T8HOWkvKcKVVkI9Y=;
	b=UNZSF7c/8SYcraqyeR59Q77Bxbdj1fETd9A8E8guRsmO9c0lkA6dnaIAZPTiPsjyYa
	r4vbRY5XgS4956EPHwBGwpjH5NiCPoCUVaukUXUCwJh5nFybzzLiyKOT0+Ohhego8sRu
	coc28IOLxqqpLDA6VrC/s/rTxsxpRD85C/aesHDbF9sFKOreTdcbHNWtsVnetX1Y2U5b
	Ca4r17voee52+aG+7LVmtw1lg+hSuJ8Z5tMNJVjBbvbfsu3p/OdIw9FaQhqDXG5e2EfN
	2sy01U2s+I5GF78FbILzXSodpd/g8LxsszP53/COeWqRo6Ey4pP+6HFMpDJhE+6VqBpv
	ErKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=/LRJatL/OyX91HuDrZx08vv8Jk1T8HOWkvKcKVVkI9Y=;
	b=FQABRlOIp913XQsj3XXvwc6h2/Lh2h5kcKc2e2tSj+8OekLxp6F7EBSr8cx5ki+A1v
	19Ym2/zi8SEzQeXJaruqXfvdj2mWnkm3vPQ7So5QgmgiErHfytjQHzpoRn3EgJLO46kh
	UvvmIGHK2rlDuIsdJTQWZQjdF/3jEo0GqKYjYd4DuUd/EZ6vnhw5Vr9dvMHC7lXoOLtj
	Vc62RvPDANthtw/Q0Yhy2SBNE4Zxccze2fqyakmJOmHTlCPeTXUKxoeZuLdlMOO2RhF7
	RwSSGFDtrMsEEwp222jbqQxJaFdLffX5ehbsrFYgq0LWj0WMTrg3al7Gqcci1T6q5DJn
	w2HQ==
X-Gm-Message-State: AD7BkJLD/C3oCJun/6gPoC8he0NKP19sduQsY0HrznFbEarYeQ44RSxpIzfOS9y7aQsxtQ==
X-Received: by 10.28.147.206 with SMTP id v197mr3641401wmd.70.1456914704415;
	Wed, 02 Mar 2016 02:31:44 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id 82sm3477287wmd.4.2016.03.02.02.31.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Mar 2016 02:31:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 2 Mar 2016 11:33:41 +0100
To: Joe MacDonald <Joe_MacDonald@mentor.com>
Message-ID: <20160302103341.GA10529@jama>
References: <20160225171903.GC2565@jama> <20160226181315.GA6310@mentor.com>
	<20160226195617.GA2554@jama> <20160227013944.GB6310@mentor.com>
MIME-Version: 1.0
In-Reply-To: <20160227013944.GB6310@mentor.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Still many meta-networking changes waiting in patchwork/master-next
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
X-List-Received-Date: Wed, 02 Mar 2016 10:31:45 -0000
X-Groupsio-MsgNum: 60293
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline

--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 26, 2016 at 08:39:45PM -0500, Joe MacDonald wrote:
> Hi Martin,
>=20
> [Re: [oe] Still many meta-networking changes waiting in patchwork/master-=
next] On 16.02.26 (Fri 20:56) Martin Jansa wrote:
>=20
> > On Fri, Feb 26, 2016 at 01:13:17PM -0500, Joe MacDonald wrote:
> > > Hey Martin,
> > >=20
> > > [[oe] Still many meta-networking changes waiting in patchwork/master-=
next] On 16.02.25 (Thu 18:19) Martin Jansa wrote:
> > >=20
> > > > Hi Joe.
> > > >=20
> > > > there are still 18 meta-networking commits in master-next:
> > >=20
> > > I thought I'd follow up to this and let you know I'll do something wi=
th
> > > these before the end of the month.  Almost all of them (waf-samba asi=
de)
> > > obviously got missed because I'm watching patchwork based on
> > > 'meta-networking' and none of these had it in the subject line.
> > >=20
> > > I think I've asked before, but are you curating all of those bundles =
by
> > > hand or have you got some machinery that filters patches into bundles
> > > based on path names in the patches?  Because that would be kind of ne=
at
> > > to have.
> >=20
> > I think I've answered before, but I'm filtering them manually based on
> > subject and also actual paths inside the patch. I also need to mark them
> > "Accepted", "Superseded", ..  manually, there is git hooks which is sup=
posed
> > to mark at least accepted one, but it finds 1 from 1000 if any.
>=20
> Yeah, I've seen the hooks trying to find something when I push commits and
> just spewing a slew of errors.  I generally do my best to stay on top of
> the status in patchwork, doing it all at one time, though.
>=20
> > This is of course a bit error prone, especially when there are multiple
> > versions of the same patch already in master-next - I usually end up
> > marking all versions merged patch as Accepted (unless I've marked older
> > versions already as Superseded when filtering incoming queue).
>=20
> I took a bit of time this afternoon to try to come up with a way to
> automate at least part of the process for me and I'm sure there's a better
> way to do it (hence why I asked again) but since it sounds like you're
> doing it by hand for a much larger space than I am, maybe there's not.
>=20
> Anyway, for what it's worth, here's what I came up with:
>=20
>    git log --cherry-pick --format=3D"'%s'" \
>       oe/master-next...oe/master meta-networking | \
>       xargs -r -n1 pwclient search -f "%{id} %{name}" -s New
>=20
> Which does pretty well, though it obviously goes a little insane if
> someone puts a ' in the short log, but it didn't seem worth trying to work
> around that pretty rare (I hope) corner case.  As an aside, the first time
> I did this I was using --format=3D"\"%s\"" and the *very* top commit
> ('recipes: Replace "cp ...) showed me what kind of pain I'm in for when
> there are colliding characters in the short log.  It's ugly but nothing
> catastrophic.
>=20
> So that gave me 14 of the patches you asked about.  The others were easy
> to find:
>=20
>    git log --cherry-pick --format=3D"'%s'" \
>       oe/master-next...oe/master meta-networking | \
>       xargs -r -n1 pwclient search -f "%{id} %{name}" -s Accepted
>=20
> But obviously they haven't been accepted into 'master' next, obviously
> just a typo or a mis-click at some point.  So that's not bad.
>=20
> Once I had that sanity check done, it's easy to harvest them all:
>=20
>=20
>    git log --cherry-pick --format=3D"'%s'" \
>       oe/master-next...oe/master meta-networking | \
>       xargs -r -n1 pwclient search -f "%{name}" -s new | \
>       sed 's=3D\[.*\] *=3D=3D;s=3D"=3D.=3Dg;s=3D\(.*\)=3D"\1"=3D' | \
>       xargs -r -n1 git log --format=3D"%h" --grep | \
>       xargs -r -n1 git cherry-pick -s
>=20
> The hideous sed in the middle is just to throw out stuff from the pwclient
> output that doesn't appear in the git logs (eg. "[v2]") and to skip over
> the craziness that happens on the 'git log grep' if you have a " in the
> subject.
>=20
> Run it a second time to grab the three 'accepted' patches and we're nearly
> done.
>=20
> Setting aside all of the inspection steps that follow that nobody would
> want to automate, the same machinery applies equally well to keeping
> patchwork up to date:
>=20
>    git log --cherry-pick --format=3D"'%s'" \
>       master...oe/master meta-networking | \
>       xargs -r -n1 pwclient search -f "%{id}" -s new | \
>       xargs -r -n1 pwclient update -s "accepted"=20
>=20
> There's not really any point in running this one a second time for the
> patches already marked 'accepted'.
>=20
> I've been using a version of this last one for a while now because the git
> hooks are non-functional.
>=20
> The end result is that my semi-automated process above gets 17 of the 18
> patches you cited and the 18th (waf-samba.bbclass) is a special case that
> I don't think could ever be caught except by manual intervention.
>=20
> Mostly just throwing this out there so that maybe it'll help you or
> someone else with similar tasks and maybe someone can look at what I'm
> doing and point out obvious flaws / shortcomings / bear-traps /
> improvements.  And also since I haven't bothered to put this into a shell
> function or git alias yet, at least my process is archived in the mailing
> list and I can find it again if I need it.

Thanks for trying to improve patchwork experience with bunch of scripts.
Personally I would prefer to just use gerrit (that's why I gave up
trying to work around patchwork issues with scripts and rather sort &
apply the patches manually with just small help from pwclient).

After bigger merge yesterday I have only the waf-samba change in
master-next (and few new changes), can you please update status of few
pending changes in meta-networking bundle?
http://patchwork.openembedded.org/bundle/jama/meta-networking/?archive=3Dbo=
th

There is 22 changes and most of them were probably already merged or
rejected.

>=20
> -J.
>=20
> >=20
> > >=20
> > > -J.
> > >=20
> > > > pick 959b908 postfix: premission of /var/spool/mail seems incorrect
> > > > pick 21ccb84 wireshark: update SRC_URI link to sources
> > > > pick 204683a nbd: use BPN in Files
> > > > pick ed0b197 cim-schema-exper: fix host-user-contaminated
> > > > pick 1dd195e ctdb: add PACKAGECONFIG for libtdb
> > > > pick 3c95127 netkit-ftp: fixed invalid symlink
> > > > pick 56c4f31 iscsitarget: split the kernel module into separate pac=
kage
> > > > pick 38fd81c iscsitarget: skip the arch test for kernel modules
> > > > pick 84bfeae ncftp: fix build failures with ccdv
> > > > pick 46b1e93 postfix: fix clean broken issue
> > > > pick ba57020 lowpan-tools: add missing flex/bison deps
> > > > pick dd64a6b samba: Fix typo in PACKAGECONFIG for "acl" and "aio"
> > > > pick c3c6106 waf-samba.bbclass: add cross-answers option and files
> > > > pick ef42784 ebtables: enable KERNEL_64_USERSPACE_32 for powerpc
> > > > pick 87edda7 samba: update systemd service files
> > > > pick 8b320f4 lldpd: use bash-completion.bbclass
> > > > pick 32b5c6f ntp: remove empty libexecdir to prevent potential QA i=
ssues
> > > > pick 93c8a3c inetutils: Fix build when static libs disabled
> > > >=20
> > > > Not all of them are still "open" on patchwork, maybe they are no lo=
nger valid.
> > > >=20
> > > > + there are few meta-networking patches on patchwork which didn't m=
ake it to master-next
> > > >   here is complete list:
> > > >   http://patchwork.openembedded.org/bundle/jama/master-next/?archiv=
e=3Dboth
> > > > 	postfix: premission of /var/spool/mail seems incorrect	2015-10-27	=
Zhenbo Gao		New
> > > > 	[meta-oe] lldpd: configure the systemd unit file dir	2015-10-30	ro=
ngqing.li@windriver.com		New
> > > > 	[meta-oe] samba: systemv-init script must be executable	2015-11-04=
	Jens Rehsack		New
> > > > 	[meta-oe,v2,1/3] samba: fix dependencies and QA issues	2015-11-12	=
Jens Rehsack		New
> > > > 	[2/7] nbd: use BPN in Files	2015-11-20	Robert Yang		New
> > > > 	[4/7] cim-schema-exper: fix host-user-contaminated	2015-11-20	Robe=
rt Yang		New
> > > > 	[6/7] ctdb: add PACKAGECONFIG for libtdb	2015-11-20	Robert Yang		N=
ew
> > > > 	[7/7] netkit-ftp: fixed invalid symlink	2015-11-20	Robert Yang		New
> > > > 	[1/2] iscsitarget: split the kernel module into separate package	2=
015-11-25	jackie huang		New
> > > > 	[2/2] iscsitarget: skip the arch test for kernel modules	2015-11-2=
5	jackie huang		New
> > > > 	ncftp: fix build failures with ccdv	2015-11-30	jackie huang		New
> > > > 	samba: Fix typo in PACKAGECONFIG for "acl" and "aio"	2015-12-22	mi=
ke.looijmans@topic.nl		New
> > > > 	[meta-networking,0/7,v3] waf-samba: fix build failure on targets u=
nsupported by qemu	2016-01-06	jackie huang		New
> > > > 	[meta-oe,7/7,v3] waf-samba.bbclass: add cross-answers option and f=
iles	2016-01-06	jackie huang		New
> > > > 	ebtables: enable KERNEL_64_USERSPACE_32 for powerpc	2016-01-20	ron=
gqing.li@windriver.com		New
> > > > 	[RFC,3/4] lldpd: use bash-completion.bbclass	2016-01-14	George McC=
ollister		New
> > > > 	[07/12] inetutils: Fix build when static libs disabled	2016-02-22	=
Richard Purdie		New
> > > >=20
> > > > If they are still there next month, I'll drop them from master-next=
 branch
> > > > and master-next bundle on patchwork.
> > > >=20
> > > > Thanks
> > > >=20
> > > > --=20
> > > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > >=20
> > >=20
> > >=20
> > > --=20
> > > -Joe MacDonald.
> > > :wq
> >=20
> >=20
> >=20
> --=20
> -Joe MacDonald.
> :wq



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbWwYQACgkQN1Ujt2V2gBy1cQCfVt79pepy5Xwe0JxPevCLsmnG
m2IAoK3CpYEJ8F3GA333V4iE3BXz3g3v
=vATM
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--
