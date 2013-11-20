Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1D9566D915
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2013 11:58:35 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id h14so1593668eaj.21
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2013 03:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XbIptOi3d5Vtah44CjTxnhDMLBZPEGXxSn6Y/UhIyXg=;
	b=KaZNlDtSwnHl1N1IjaK94Cp6NLRu1lbMQsM66Fib+Eigm+6wGUo/NL1jZPwfaO397t
	W34aoKZrdTF9riyhhWWEkcwyyT5A+TsIp/FEI+85K5jpQlygBImHVVSMZpC/RHaIAHYr
	NROeEHsZKPBtwfwOK0XQgRbPl9hj/p0GqBWsdzTmyV9aG5jD7ObGArfUvbY1Nu8Xk+h0
	SKCVJ/b3ZNLNbsxKy2LNcuuIcIKpYYwWu4Nb2ZV4IcHb6h6vVGZo/8azu3VZrzVIO9PQ
	2cGIEgLucgJ6mIzoninW0OXoKlDnhRvSwBFjU5AhAzvxkyVnr1zbWxw3egDg3UOdXVaK
	pdGg==
X-Received: by 10.15.108.73 with SMTP id cc49mr232336eeb.93.1384948717332;
	Wed, 20 Nov 2013 03:58:37 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id h48sm2881586eev.3.2013.11.20.03.58.36
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Nov 2013 03:58:36 -0800 (PST)
Date: Wed, 20 Nov 2013 12:58:39 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20131120115839.GL3708@jama>
References: <1384813274-7231-1-git-send-email-Martin.Jansa@gmail.com>
	<1404521.4vplx1e1VT@helios> <20131120104331.GK3708@jama>
	<12826321.nELrz9JS6g@helios>
MIME-Version: 1.0
In-Reply-To: <12826321.nELrz9JS6g@helios>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 6/6] usb-modeswitch-data: Drop allarch
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
X-List-Received-Date: Wed, 20 Nov 2013 11:58:36 -0000
X-Groupsio-MsgNum: 47206
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hdW7zL/qDS6RXdAL"
Content-Disposition: inline

--hdW7zL/qDS6RXdAL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2013 at 10:55:22AM +0000, Paul Eggleton wrote:
> On Wednesday 20 November 2013 11:43:31 Martin Jansa wrote:
> > On Wed, Nov 20, 2013 at 10:29:46AM +0000, Paul Eggleton wrote:
> > > Hi Martin,
> > >=20
> > > On Monday 18 November 2013 23:21:14 Martin Jansa wrote:
> > > > * has runtime dependency on TUNE_PKGARCH usb-modeswitch
> > > >=20
> > > >   Hash for dependent task usb-modeswitch_1.2.5.bb.do_packagedata ch=
anged
> > > >=20
> > > > from 5709ee415d286847b58e7b438b5b9f75 to
> > > > fbef5eee3bb2bacb805a0bead2095b52
> > > >=20
> > > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > > ---
> > > >=20
> > > >  meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_2013080=
7.bb
> > > >  | 2
> > > >=20
> > > > -- 1 file changed, 2 deletions(-)
> > > >=20
> > > > diff --git
> > > > a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_201308=
07.bb
> > > > b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_201308=
07.bb
> > > > index fc0fbfb..8b71618 100644
> > > > ---
> > > > a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_201308=
07.b
> > > > b +++
> > > > b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_201308=
07.bb
> > > > @@
> > > > -2,8 +2,6 @@ DESCRIPTION =3D "Data files for usbmodeswitch"
> > > >=20
> > > >  LICENSE =3D "GPLv2"
> > > >  LIC_FILES_CHKSUM =3D
> > > >  "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19f"
> > > >=20
> > > > -inherit allarch
> > > > -
> > > >=20
> > > >  SRC_URI =3D
> > > >=20
> > > > "http://www.draisberghof.de/usb_modeswitch/usb-modeswitch-data-${PV=
}.tar
> > > > .bz
> > > > 2" SRC_URI[md5sum] =3D "91feff51deba6e48e78506b8f4db2274"
> > > >=20
> > > >  SRC_URI[sha256sum] =3D
> > > >=20
> > > > "a3114e2c1f38eed3ad0067df30e53a96313908a9539a8ea5d94a4d35651699eb"
> > >=20
> > > To be honest I view these in the same way as the corresponding OE-Core
> > > patches - if the contents of the output package or its metadata does =
not
> > > change dependent on the other package, then we should use other means=
 to
> > > fix this issue rather than the huge hammer of removing allarch.
> >=20
> > OK, I'll send patch for layer.conf, but the point is that incorrectly
> > using allarch is worse than not using it at all.
> >=20
> > Most allarch recipes are very quick to build and their signatures stay
> > valid for long time even after they are changed to TUNE_PKGARCH, but wi=
th
> > issue like this and allarch they are rebuilt after each MACHINE switch.
> >=20
> > So on concrete example of SHR distribution with 3 supported
> > TUNE_PKGARCHs in binary feed, it's faster to build
> > 3x TUNE_PKGARCH usb-modeswitch-data and keep the same .ipk for some time
> > than build it 3 times as allarch every single day in daily build which
> > populates binary feed.
>=20
> Yes I understand the problem, but there's a question of fixing it the rig=
ht=20
> way, particularly as this is by no means a new problem. I don't think=20
> selective use of allarch is a good path for us to be going down, because =
if=20
> nothing else it makes it harder for users to know when to apply it. (If w=
e=20
> need to have some kind of QA check to report when allarch recipes depend =
upon=20
> non-allarch recipes with a coherent message telling the user what they ne=
ed to=20
> do, then let's add that.)

FWIW I've added new job to my jenkins world builds with will compare
signatures for different MACHINEs and report when native or allarch
signatures are different + different TUNE_PKGARCH signatures for
identical machines with just different name.

It looks like this:
openembedded-core/scripts/sstate-diff-machines.sh --machines=3D"qemuarm qem=
ux86 qemux86copy qemux86-64" --targets=3Dworld --tmpdir=3Dtmp-eglibc/;

function compareSignatures() {
  MACHINE1=3D$1
  MACHINE2=3D$2
  PATTERN=3D$3
  PRE_PATTERN=3D""
  [ -n "${PATTERN}" ] || PRE_PATTERN=3D"-v"
  [ -n "${PATTERN}" ] || PATTERN=3D"MACHINE"
  for TASK in do_configure.sigdata do_populate_sysroot.sigdata do_package_w=
rite_ipk.sigdata; do
    printf "\n\n =3D=3D=3D Comparing signatures for task ${TASK} =3D=3D=3D\=
n"
    diff tmp-eglibc/sstate-diff/*/${MACHINE1}/list.M tmp-eglibc/sstate-diff=
/*/${MACHINE2}/list.M | grep ${PRE_PATTERN} "${PATTERN}" | grep ${TASK} > l=
ist.${TASK}
    for i in `cat list.${TASK} | sed 's#[^/]*/\([^/]*\)/.*#\1#g' | sort -u =
| xargs`; do
      [ -e BUILD/sstate-diff/*/${MACHINE1}/*/$i/*${TASK}* ] || echo "Task $=
{i}.${TASK} doesn't exist in ${MACHINE1}" >&2
      [ -e BUILD/sstate-diff/*/${MACHINE1}/*/$i/*${TASK}* ] || continue
      [ -e BUILD/sstate-diff/*/${MACHINE2}/*/$i/*${TASK}* ] || echo "Task $=
{i}.${TASK} doesn't exist in ${MACHINE2}" >&2
      [ -e BUILD/sstate-diff/*/${MACHINE2}/*/$i/*${TASK}* ] || continue
      printf "\n =3D=3D Comparing signatures for ${i}.${TASK} =3D=3D\n"

      printf "# (R)DEPENDS on \nPACKAGE_ARCH_pn-$i =3D \"\${MACHINE_ARCH}\"=
\n";
      bitbake-diffsigs tmp-eglibc/sstate-diff/*/${MACHINE1}/*/$i/*${TASK}* =
tmp-eglibc/sstate-diff/*/${MACHINE2}/*/$i/*${TASK}*;
      echo
    done | tee list.${TASK}.inc
  done
}

# TUNE_PKGARCH should be the same between qemux86 and qemux86copy
compareSignatures qemux86 qemux86copy

# native and allarch should be the same for all MACHINES
compareSignatures qemux86 qemuarm "\(^< all\)\|\(^< x86_64-linux\)"

It needs first patch from jansa/tune2-test branch for qemux86copy MACHINE:
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/tune2-=
test

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hdW7zL/qDS6RXdAL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKMo+8ACgkQN1Ujt2V2gByHIQCgh6laiKpTZHfhNNVm6+S8RJ7t
AQwAn0k16LLwo4xjk2JPVYhTdh6SVIaN
=BTj3
-----END PGP SIGNATURE-----

--hdW7zL/qDS6RXdAL--
