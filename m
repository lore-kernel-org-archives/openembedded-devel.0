Received: from einhorn.in-berlin.de ([192.109.42.8] ident=root)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PlKDM-0004mo-0X
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 12:52:40 +0100
X-Envelope-From: sledz@dresearch.de
X-Envelope-To: <openembedded-devel@lists.openembedded.org>
Received: from mobil-400-586.intern.dresearch.de
	(p57A227EA.dip0.t-ipconnect.de [87.162.39.234])
	(authenticated bits=0)
	by einhorn.in-berlin.de (8.13.6/8.13.6/Debian-1) with ESMTP id
	p14Bpdh0017517
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 4 Feb 2011 12:51:39 +0100
Received: from mobil-400-586.intern.dresearch.de (localhost [IPv6:::1])
	by mobil-400-586.intern.dresearch.de (Postfix) with ESMTP id 39EB52E97E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Feb 2011 12:51:38 +0100 (CET)
Message-ID: <4D4BE849.9070704@dresearch.de>
Date: Fri, 04 Feb 2011 12:51:37 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Lightning/1.0b1
	Thunderbird/3.0.11
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Scanned-By: MIMEDefang_at_IN-Berlin_e.V. on 192.109.42.8
X-MIME-Autoconverted: from 8bit to quoted-printable by einhorn.in-berlin.de id
	p14Bpdh0017517
Subject: =?UTF-8?B?w4VuZ3N0csO2bSB2ZXJzaW9ucz8=?=
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
X-List-Received-Date: Fri, 04 Feb 2011 11:53:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I'm a bit confused about the Angstrom versions.

Setting in local.conf is

  DISTRO =3D "angstrom-2008.1"

but bitbake reports

  Build Configuration:
  BB_VERSION        =3D "1.10.2"
  METADATA_BRANCH   =3D "testing-next"
  METADATA_REVISION =3D "3a7b93a"
  TARGET_ARCH       =3D "arm"
  TARGET_OS         =3D "linux-gnueabi"
  MACHINE           =3D "hipox"
  DISTRO            =3D "angstrom"
  DISTRO_VERSION    =3D "2010.7-test-20110204"
  TARGET_FPU        =3D "soft"

Is this intented?

BTW: Which is the suggested/released =C3=85ngstr=C3=B6m version? http://w=
ww.angstrom-distribution.org/ seems to be not very helpful here. e.g. the=
 FAQ link results in an PAGE NOT FOUND. :(

Steffen


