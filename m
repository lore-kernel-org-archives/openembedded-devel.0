Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5934F60248
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2016 08:15:36 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id p65so54598867wmp.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2016 01:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:subject:date:message-id:to:mime-version;
	bh=QyLshkrNHzbrLeNwD9pjLDiAvBg5VuI/4xWi+XbxVgY=;
	b=knunSQ/NYJ/XTP5YFWt9IulIYj1GzMzCjq2FTC8kN3Q8+qmO5iI5yYn+HP+gcuLRlP
	RPKOlk90n1Smi4mhvswuqdiRz7v0CXImWBZoajVjqnB9NVQV4tMpkjHZ0K8alHUmssjX
	KhcRdyuXRCh+HLfX5lkqU/k9Uu3cFKKFSoWb1YmhvUvCcRFKtggooirWFcQht62Eribv
	6knz8Cb3Fitpf06f0RsnyYizuLCM/T8VmFTAPLZljewPNa7Hnn8+ZporUwlCa6mb7Vz+
	vCJIZVT27niHXqwRDkcmD4HeLeoDYaGsB5B2aXQSZFt3RiRs72ZSpccYOhMj7iJgoFXD
	+yLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:subject:date:message-id:to:mime-version;
	bh=QyLshkrNHzbrLeNwD9pjLDiAvBg5VuI/4xWi+XbxVgY=;
	b=PIkwihEyqtp3fGPMbJL81BrdDSjGlf/no4bdvddHSc0D49TxkXxJju8jmMUkTE1Y+I
	O5ofbW18BFgsO3vO3yDm5LZTkjXP3IKCyOt8P3bMmeDnfWzue3z9s3NXlfWvxaoDP0s5
	aXyhTVUuCEQJOvU+hiEFV3pghKbkb19C7akJv3xq93XjER+xFrY7tsB6SRF+Z3NOxi0J
	D5VIQ3dX0qtDoxC1dL8E5TqNT0okxEH4Y8aiT62/MkGvIV+h5VA7iVn+vbWjAZZYXXN5
	vcfl4Y/ENp31rWE68pgXgKi8zkTQlpCk1giDnhVqbsbyVPeGRct/+xKaNDECZFBaCP4I
	LPqA==
X-Gm-Message-State: AD7BkJLzen0qZU9Dki+l4CZncCfItdQ0sHW89c1v+nHJeTnO175lf7Gomq6z0xhTFV+xuA==
X-Received: by 10.28.52.197 with SMTP id b188mr32798363wma.77.1458807337072;
	Thu, 24 Mar 2016 01:15:37 -0700 (PDT)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	p125sm6569148wmd.16.2016.03.24.01.15.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Mar 2016 01:15:36 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
X-Pgp-Agent: GPGMail 2.6b2
Date: Thu, 24 Mar 2016 09:15:34 +0100
Message-Id: <05E8F978-27FE-4D43-89FE-73BDDA7D279D@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Mailer: Apple Mail (2.3112)
Subject: [meta-cpan] pushed updates
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
X-List-Received-Date: Thu, 24 Mar 2016 08:15:39 -0000
X-Groupsio-MsgNum: 60651
Content-Type: multipart/signed;
	boundary="Apple-Mail=_CAA0619E-DDEC-4E0D-AAD9-02374FECE2A5";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_CAA0619E-DDEC-4E0D-AAD9-02374FECE2A5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

I pushed following local tested updates to meta-cpan

c5f98ca .gitignore: add to suppress noise on typical developer files
bd2891e datetime-format-strptime-perl: Update to 1.65
ebafe89 datetime-timezone-perl: Update to 1.96
6b45f37 datetime-perl: Update to 1.26
43f08b4 datetime-perl: Update to 1.26
98694a6 test-tcp-perl: Update to 2.15
fae8e71 scalar-list-utils-perl: Upate to 1.44
134b7dc package-deprecationmanager-perl: Update to 0.16
08b6042 sub-name-perl: Update to 0.15
21a47d2 log-log4perl-perl: Update to 1.47
11c1a8f lexical-sealrequirehints-perl: Update to 0.010
73c9e0a devel-mat-perl: Update to 0.22
2354316 datetime-perl: update to 1.25
e2c3157 text-diff-perl: update to 1.44
a14ba50 digest-md5-perl: update to 2.55
a85c759 path-tiny-perl: update to 0.084
6cf9f59 file-which-perl: update to 1.21
ce3e418 struct-dumb-perl: update to 0.09

Please fetch from https://github.com/rehsack/meta-cpan.git if you want =
to get rid of outdated perl modules:

meta-cpan/recipes-devel/moox-options-perl/moox-options-perl_4.018: =
moox-options-perl-4.018-r0 (Poky <poky@yoctoproject.org>) needs update =
4.018 < 4.022
=
meta-cpan/recipes-time/datetime-timezone-perl/datetime-timezone-perl_1.96:=
 datetime-timezone-perl-1.96-r0 (Poky <poky@yoctoproject.org>) needs =
update 1.96 < 1.97
=
meta-cpan/recipes-www/dancer2-plugin-auth-yarbac-perl/dancer2-plugin-auth-=
yarbac-perl_0.009: dancer2-plugin-auth-yarbac-perl-0.009-r0 (Poky =
<poky@yoctoproject.org>) needs update 0.009 < 0.011
meta-openembedded/meta-oe/recipes-devtools/perl/libio-pty-perl_1.10: =
libio-pty-perl-1.10-r0 (Poky <poky@yoctoproject.org>) needs update 1.10 =
< 1.12
=
meta-openembedded/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-pe=
rl_1.15: libalgorithm-diff-perl-1.15-r0 (Poky <poky@yoctoproject.org>) =
needs update 1.15 < 1.1903
=
meta-openembedded/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0=
.30: libcapture-tiny-perl-0.30-r0 (Poky <poky@yoctoproject.org>) needs =
update 0.30 < 0.36
=
meta-openembedded/meta-perl/recipes-perl/libclass/libclass-method-modifier=
s-perl_2.11: libclass-method-modifiers-perl-2.11-r0 (Poky =
<poky@yoctoproject.org>) needs update 2.11 < 2.12
=
meta-openembedded/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-=
perl_0.04: libcrypt-openssl-random-perl-0.04-r0 (Poky =
<poky@yoctoproject.org>) needs update 0.04 < 0.11
meta-openembedded/meta-perl/recipes-perl/libcurses/libcurses-perl_1.32: =
libcurses-perl-1.32-r0 (Poky <poky@yoctoproject.org>) needs update 1.32 =
< 1.33
meta-openembedded/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.40: =
libdbd-sqlite-perl-1.40-r0 (Poky <poky@yoctoproject.org>) needs update =
1.40 < 1.50
meta-openembedded/meta-perl/recipes-perl/libdb/libdbi-perl_1.628: =
libdbi-perl-1.628-r0 (Poky <poky@yoctoproject.org>) needs update 1.628 < =
1.634
meta-openembedded/meta-perl/recipes-perl/libencode/libencode-perl_2.76: =
libencode-perl-2.76-r0 (Poky <poky@yoctoproject.org>) needs update 2.76 =
< 2.82
=
meta-openembedded/meta-perl/recipes-perl/libextutils/libextutils-config-pe=
rl_0.007: libextutils-config-perl-0.007-r0 (Poky =
<poky@yoctoproject.org>) needs update 0.007 < 0.008
=
meta-openembedded/meta-perl/recipes-perl/libextutils/libextutils-cppguess-=
perl_0.09: libextutils-cppguess-perl-0.09-r0 (Poky =
<poky@yoctoproject.org>) needs update 0.09 < 0.11
=
meta-openembedded/meta-perl/recipes-perl/libextutils/libextutils-installpa=
ths-perl_0.010: libextutils-installpaths-perl-0.010-r0 (Poky =
<poky@yoctoproject.org>) needs update 0.010 < 0.011
=
meta-openembedded/meta-perl/recipes-perl/libextutils/libextutils-parsexs-p=
erl_3.24: libextutils-parsexs-perl-3.24-r0 (Poky =
<poky@yoctoproject.org>) needs update 3.24 < 3.30
=
meta-openembedded/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.71:=
 libhtml-parser-perl-3.71-r0 (Poky <poky@yoctoproject.org>) needs update =
3.71 < 3.72
=
meta-openembedded/meta-perl/recipes-perl/libimport/libimport-into-perl_1.0=
02004: libimport-into-perl-1.002004-r0 (Poky <poky@yoctoproject.org>) =
needs update 1.002004 < 1.002005
=
meta-openembedded/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_1.997=
: libio-socket-ssl-perl-1.997-r0 (Poky <poky@yoctoproject.org>) needs =
update 1.997 < 2.024
=
meta-openembedded/meta-perl/recipes-perl/libmime/libmime-types-perl_2.04: =
libmime-types-perl-2.04-r0 (Poky <poky@yoctoproject.org>) needs update =
2.04 < 2.13
=
meta-openembedded/meta-perl/recipes-perl/libmodule/libmodule-build-perl_0.=
31: libmodule-build-perl-0.31-r0 (Poky <poky@yoctoproject.org>) needs =
update 0.31 < 0.4216
=
meta-openembedded/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-pe=
rl_0.036: libmodule-build-tiny-perl-0.036-r0 (Poky =
<poky@yoctoproject.org>) needs update 0.036 < 0.039
meta-openembedded/meta-perl/recipes-perl/libmoo/libmoo-perl_2.000002: =
libmoo-perl-2.000002-r0 (Poky <poky@yoctoproject.org>) needs update =
2.000002 < 2.001001
meta-openembedded/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65: =
libnet-ssleay-perl-1.65-r0 (Poky <poky@yoctoproject.org>) needs update =
1.65 < 1.72
=
meta-openembedded/meta-perl/recipes-perl/libstrictures/libstrictures-perl_=
2.000001: libstrictures-perl-2.000001-r0 (Poky <poky@yoctoproject.org>) =
needs update 2.000001 < 2.000002
=
meta-openembedded/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.30=
: Test-Harness-3.30 has newer modules in core: =
TAP::Parser::Iterator::Array  3.35 > 3.26
meta-openembedded/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41: =
libtext-diff-perl-1.41-r0 (Poky <poky@yoctoproject.org>) needs update =
1.41 < 1.44
=
meta-openembedded/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0121:=
 libxml-libxml-perl-2.0121-r0 (Poky <poky@yoctoproject.org>) needs =
update 2.0121.tar.gz;name=3Dlibxml < 2.0124
=
meta-openembedded/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.5=
4: libxml-sax-writer-perl-0.54-r0 (Poky <poky@yoctoproject.org>) needs =
update 0.54 < 0.56
poky/meta/recipes-devtools/perl/liburi-perl_1.60: liburi-perl-1.60-r0 =
(Poky <poky@yoctoproject.org>) needs update 1.60 < 1.71
poky/meta/recipes-devtools/perl/libxml-simple-perl_2.20: =
libxml-simple-perl-2.20-r0 (Poky <poky@yoctoproject.org>) needs update =
2.20 < 2.22
poky/meta/recipes-devtools/perl/perl_5.22.1: perl-5.22.1 has newer =
modules in core: DynaLoader  1.32 > 1.15
poky/meta/recipes-lsb4/perl/libfile-checktree-perl_4.41: =
libfile-checktree-perl-4.41-r0 (Poky <poky@yoctoproject.org>) needs =
update 4.41 < 4.42

342 Perl5 distributions packaged, 309 up to date, 31 needs update, 2 =
need further investigation

Powered by Packager::Utils

Enjoy
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_CAA0619E-DDEC-4E0D-AAD9-02374FECE2A5
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJW86InAAoJEESZlq7c5QqdoQEP/0+zl+RuOFYuG05FGOpzZ5rN
hiIeyrNoJfgWT78MMwOJRqHijKjxd90V/2JmZfwtbmnIYr/fx095qnPP65OeXZq/
gzYZs4LDzX3nruQHR0vbGrNOi2dGNULtEc+WkFwAl7tn6XY8bRbbrijrrcPd8wn8
49pRuEQj0DjVXpyBbSFJ/X9zJixrdls2NjyPSg3Iw9Nj0dAyqtD6dLjXBqSl8m3k
Q2zY39nYjK373NG68QSPiZ72XxLeSDzX4oZrOvFmXFJQx0QoN+0HhUnoD2J3Gg0D
pq3YRgzlCs6wcY2pq/wSz/hwW6itvqY3jYPf8j5wxOZknE6990b/pDhISGD7bypJ
NTspIggkcdB/CfYGEYdEV+Bqqk6NJld1r6yCIdCEk9PUHOPyJdnoE+WyAifD+n3A
3L+q1KNRYLYhwC2Hgl4FVrdN4xG+b3z67JI61L2RHbz1gfN7/bZy59U3LKFRfR9k
1Qwnm4FDrOagmcrHIVqC+gmJF22WbgUDOv0nEcmsUDJ1WutncxL598XnbtycuK01
RNgeUKVgmIcknhlvsp3yYAeGQ0nnueNwU0ZxALYbNycLmNWkuKnwBO6tsmb850Zz
Pqq7wKKlTuXvsGyZGYUG2eEKjlFECwG9YzsRtLyY1/YCVVsg5phdMDI0kdbvuLvG
bQQH7pCvg7mZNmUMVxBu
=nCGF
-----END PGP SIGNATURE-----

--Apple-Mail=_CAA0619E-DDEC-4E0D-AAD9-02374FECE2A5--
