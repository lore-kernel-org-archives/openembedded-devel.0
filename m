Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8432460667
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2013 07:20:47 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id c13so3645114eek.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2013 00:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=U7Ul4I9SYiVM5k3Sq4A7lQSXquVGp+0+dLcI6qUOCZE=;
	b=00hVAdD1zcUqWR+jYQhp7V/gf7JNAErbtL2oMupNTT6CdFOohnzJQZeg/Lk73rxR0g
	zvnh7J7a65ibLxTukIPPaSFiR8hXXTczXU2yZ3l1RK09b5bhFS8Z6Vq7yhmCtDIyTn44
	Q8yYxgXkyKtqVCbBfVAzTSNSEr6l/YBXzVfS/GtCAENQzgtagCdU6QgmWatWwSEPHZ5Y
	UyaL+CVNO9vkbf6t2PFPv+2wf2ydgtv0QejeEpEI6X2DVCiimO3oRAZtp2CzLTccrwfC
	PPHWTezqUJVwBVJTavUxgdfOO6TVFcFJb0c21WYHKcdXKHw/UAh4V6NN0BmQBqZP3yk8
	7R9g==
X-Received: by 10.15.91.69 with SMTP id r45mr26346660eez.79.1374477647269;
	Mon, 22 Jul 2013 00:20:47 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b3sm48556248eev.10.2013.07.22.00.20.46 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 22 Jul 2013 00:20:46 -0700 (PDT)
Date: Mon, 22 Jul 2013 09:21:07 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130722072107.GG9527@jama>
References: <1373509925-19531-1-git-send-email-B40290@freescale.com>
	<B21730BB6DA1D24B83348D9301EA417E104214FE@039-SN2MPN1-021.039d.mgd.msft.net>
	<B21730BB6DA1D24B83348D9301EA417E10424210@039-SN2MPN1-021.039d.mgd.msft.net>
MIME-Version: 1.0
In-Reply-To: <B21730BB6DA1D24B83348D9301EA417E10424210@039-SN2MPN1-021.039d.mgd.msft.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Yu Zongchun-B40527 <B40527@freescale.com>
Subject: Re: [meta-oe][PATCH] licences: Add iozone3, SMAIL_GPL
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
X-List-Received-Date: Mon, 22 Jul 2013 07:20:48 -0000
X-Groupsio-MsgNum: 45441
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/Zw+/jwnNHcBRYYu"
Content-Disposition: inline

--/Zw+/jwnNHcBRYYu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2013 at 02:47:46AM +0000, Guo Chunrong-B40290 wrote:
> ping

It was already applied 2 days ago:
http://git.openembedded.org/meta-openembedded/commit/?id=3D41748a4afc494b71=
4315ba529f138214f80d41b9

>=20
> -----Original Message-----
> From: Guo Chunrong-B40290=20
> Sent: Thursday, July 18, 2013 1:06 PM
> To: Guo Chunrong-B40290; openembedded-devel@lists.openembedded.org
> Cc: Liu Ting-B28495; Luo Zhenhua-B19537; Yu Zongchun-B40527
> Subject: RE: [meta-oe][PATCH] licences: Add iozone3, SMAIL_GPL
>=20
> Hello,
> Please apply this patch .
>=20
> Thanks,
> chunrong
>=20
> -----Original Message-----
> From: Guo Chunrong-B40290
> Sent: Thursday, July 11, 2013 10:32 AM
> To: openembedded-devel@lists.openembedded.org
> Cc: Liu Ting-B28495; Luo Zhenhua-B19537; Guo Chunrong-B40290; Yu Zongchun=
-B40527; Guo Chunrong-B40290
> Subject: [meta-oe][PATCH] licences: Add iozone3, SMAIL_GPL
>=20
>      *fix the fllowing warning
>      |WARNING:debianutils: No generic license file exists for: SMAIL_GPL =
in any provider
>      |WARNING:iozone3: No generic license file exists for: iozone3 in any=
 provider
>=20
> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  meta-oe/conf/layer.conf    |    2 +
>  meta-oe/licenses/SMAIL_GPL |  164 ++++++++++++++++++++++++++++++++++++++=
++++++
>  meta-oe/licenses/iozone3   |   62 +++++++++++++++++
>  3 files changed, 228 insertions(+), 0 deletions(-)  create mode 100644 m=
eta-oe/licenses/SMAIL_GPL  create mode 100644 meta-oe/licenses/iozone3
>=20
> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf index 68f7=
823..bc025bb 100644
> --- a/meta-oe/conf/layer.conf
> +++ b/meta-oe/conf/layer.conf
> @@ -23,6 +23,8 @@ BBFILE_PATTERN_openembedded-layer :=3D "^${LAYERDIR}/"
> =20
>  BBFILE_PRIORITY_openembedded-layer =3D "6"
> =20
> +LICENSE_PATH +=3D "${LAYERDIR}/licenses"
> +
>  SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
>    pointercal-xinput \
>    mplayer-common \
> diff --git a/meta-oe/licenses/SMAIL_GPL b/meta-oe/licenses/SMAIL_GPL new =
file mode 100644 index 0000000..dfc3fd1
> --- /dev/null
> +++ b/meta-oe/licenses/SMAIL_GPL
> @@ -0,0 +1,164 @@
> +This is the Debian GNU/Linux package debianutils.
> +
> +It is an original Debian package.  Programs in it were maintained by=20
> +Guy Maor <maor@debian.org>, and are now maintained by Clint Adams=20
> +<schizo@debian.org>.
> +
> +All its programs except readlink, savelog, and which may be=20
> +redistributed under the terms of the GNU GPL, Version 2 or later, found=
=20
> +on Debian systems in the file /usr/share/common-licenses/GPL.
> +
> +which is in the public domain.
> +
> +readlink is Copyright (c) 1997 Kenneth Stailey, and may also be=20
> +distributed under the terms of the BSD copyright.
> +
> +savelog may be redistributed under the following terms: (The rest of=20
> +this file consists of savelog's distribution terms.)
> +
> +#ident	"@(#)smail:RELEASE-3_2:COPYING,v 1.2 1996/06/14 18:59:10 woods Ex=
p"
> +
> +		     SMAIL GENERAL PUBLIC LICENSE
> +		       (Clarified 11 Feb 1988)
> +
> + Copyright (C)  1988 Landon Curt Noll & Ronald S. Karr Copyright (C)
> + 1992 Ronald S. Karr Copyleft (GNU) 1988 Landon Curt Noll & Ronald S.=20
> + Karr
> +
> + Everyone is permitted to copy and distribute verbatim copies of this=20
> + license, but changing it is not allowed.  You can also use this=20
> + wording to make the terms for other programs.
> +
> +  The license agreements of most software companies keep you at the=20
> +mercy of those companies.  By contrast, our general public license is=20
> +intended to give everyone the right to share SMAIL.  To make sure that=
=20
> +you get the rights we want you to have, we need to make restrictions=20
> +that forbid anyone to deny you these rights or to ask you to surrender=
=20
> +the rights.  Hence this license agreement.
> +
> +  Specifically, we want to make sure that you have the right to give=20
> +away copies of SMAIL, that you receive source code or else can get it=20
> +if you want it, that you can change SMAIL or use pieces of it in new=20
> +free programs, and that you know you can do these things.
> +
> +  To make sure that everyone has such rights, we have to forbid you to=
=20
> +deprive anyone else of these rights.  For example, if you distribute=20
> +copies of SMAIL, you must give the recipients all the rights that you=20
> +have.  You must make sure that they, too, receive or can get the source=
=20
> +code.  And you must tell them their rights.
> +
> +  Also, for our own protection, we must make certain that everyone=20
> +finds out that there is no warranty for SMAIL.  If SMAIL is modified by=
=20
> +someone else and passed on, we want its recipients to know that what=20
> +they have is not what we distributed, so that any problems introduced=20
> +by others will not reflect on our reputation.
> +
> +  Therefore we (Landon Curt Noll and Ronald S. Karr) make the following=
=20
> +terms which say what you must do to be allowed to distribute or change=
=20
> +SMAIL.
> +
> +
> +			COPYING POLICIES
> +
> +  1. You may copy and distribute verbatim copies of SMAIL source code=20
> +as you receive it, in any medium, provided that you conspicuously and=20
> +appropriately publish on each copy a valid copyright notice "Copyright
> +(C) 1988 Landon Curt Noll & Ronald S. Karr" (or with whatever year is=20
> +appropriate); keep intact the notices on all files that refer to this=20
> +License Agreement and to the absence of any warranty; and give any=20
> +other recipients of the SMAIL program a copy of this License Agreement=
=20
> +along with the program.  You may charge a distribution fee for the=20
> +physical act of transferring a copy.
> +
> +  2. You may modify your copy or copies of SMAIL or any portion of it,=
=20
> +and copy and distribute such modifications under the terms of Paragraph
> +1 above, provided that you also do the following:
> +
> +    a) cause the modified files to carry prominent notices stating
> +    that you changed the files and the date of any change; and
> +
> +    b) cause the whole of any work that you distribute or publish,
> +    that in whole or in part contains or is a derivative of SMAIL or
> +    any part thereof, to be licensed at no charge to all third
> +    parties on terms identical to those contained in this License
> +    Agreement (except that you may choose to grant more extensive
> +    warranty protection to some or all third parties, at your option).
> +
> +    c) You may charge a distribution fee for the physical act of
> +    transferring a copy, and you may at your option offer warranty
> +    protection in exchange for a fee.
> +
> +Mere aggregation of another unrelated program with this program (or its
> +derivative) on a volume of a storage or distribution medium does not=20
> +bring the other program under the scope of these terms.
> +
> +  3. You may copy and distribute SMAIL (or a portion or derivative of=20
> +it, under Paragraph 2) in object code or executable form under the=20
> +terms of Paragraphs 1 and 2 above provided that you also do one of the f=
ollowing:
> +
> +    a) accompany it with the complete corresponding machine-readable
> +    source code, which must be distributed under the terms of
> +    Paragraphs 1 and 2 above; or,
> +
> +    b) accompany it with a written offer, valid for at least three
> +    years, to give any third party free (except for a nominal
> +    shipping charge) a complete machine-readable copy of the
> +    corresponding source code, to be distributed under the terms of
> +    Paragraphs 1 and 2 above; or,
> +
> +    c) accompany it with the information you received as to where the
> +    corresponding source code may be obtained.  (This alternative is
> +    allowed only for non-commercial distribution and only if you
> +    received the program in object code or executable form alone.)
> +
> +For an executable file, complete source code means all the source code=
=20
> +for all modules it contains; but, as a special exception, it need not=20
> +include source code for modules which are standard libraries that=20
> +accompany the operating system on which the executable file runs.
> +
> +  4. You may not copy, sublicense, distribute or transfer SMAIL except=
=20
> +as expressly provided under this License Agreement.  Any attempt=20
> +otherwise to copy, sublicense, distribute or transfer SMAIL is void and=
=20
> +your rights to use the program under this License agreement shall be=20
> +automatically terminated.  However, parties who have received computer=
=20
> +software programs from you with this License Agreement will not have=20
> +their licenses terminated so long as such parties remain in full complia=
nce.
> +
> +  5. If you wish to incorporate parts of SMAIL into other free programs=
=20
> +whose distribution conditions are different, write to Landon Curt Noll=
=20
> +& Ronald S. Karr via the Free Software Foundation at 51 Franklin St,=20
> +Fifth Floor, Boston, MA 02110-1301, USA.  We have not yet worked out a=
=20
> +simple rule that can be stated here, but we will often permit this.  We=
=20
> +will be guided by the two goals of preserving the free status of all=20
> +derivatives of our free software and of promoting the sharing and reuse=
=20
> +of software.
> +
> +Your comments and suggestions about our licensing policies and our=20
> +software are welcome!  This contract was based on the contract made by=
=20
> +the Free Software Foundation.  Please contact the Free Software=20
> +Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301,=20
> +USA, or call (617) 542-5942 for details on copylefted material in=20
> +general.
> +
> +		       NO WARRANTY
> +
> +  BECAUSE SMAIL IS LICENSED FREE OF CHARGE, WE PROVIDE ABSOLUTELY NO=20
> +WARRANTY, TO THE EXTENT PERMITTED BY APPLICABLE STATE LAW.  EXCEPT WHEN=
=20
> +OTHERWISE STATED IN WRITING, LANDON CURT NOLL & RONALD S. KARR AND/OR=20
> +OTHER PARTIES PROVIDE SMAIL "AS IS" WITHOUT WARRANTY OF ANY KIND,=20
> +EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED=
=20
> +WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
> +THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF SMAIL IS WITH YOU. =
=20
> +SHOULD SMAIL PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY=20
> +SERVICING, REPAIR OR CORRECTION.
> +
> +  IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW WILL LANDON CURT NOLL &=
=20
> +RONALD S. KARR AND/OR ANY OTHER PARTY WHO MAY MODIFY AND REDISTRIBUTE=20
> +SMAIL AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY=20
> +LOST PROFITS, LOST MONIES, OR OTHER SPECIAL, INCIDENTAL OR=20
> +CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE=20
> +(INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING RENDERED=20
> +INACCURATE OR LOSSES SUSTAINED BY THIRD PARTIES OR A FAILURE OF THE=20
> +PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS) SMAIL, EVEN IF YOU HAVE=20
> +BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES, OR FOR ANY CLAIM BY=20
> +ANY OTHER PARTY.
> diff --git a/meta-oe/licenses/iozone3 b/meta-oe/licenses/iozone3 new file=
 mode 100644 index 0000000..3468fa9
> --- /dev/null
> +++ b/meta-oe/licenses/iozone3
> @@ -0,0 +1,62 @@
> +LICENSE:
> +
> + Copyright 1991, 1992, 1994, 1998, 1999, 2002   William D. Norcott
> +
> + License to freely use and distribute this software is hereby granted=20
> + by the author, subject to the condition that this copyright notice=20
> + remains intact.  The author retains the exclusive right to publish=20
> + derivative works based on this work, including, but not limited to=20
> + revised versions of this work.
> +
> +
> +
> +Below is author reply to question about distributing iozone3 in
> +OpenEmbedded:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=3D
> +
> +Marcin,
> +
> +        Re-distribution is permitted as long as the copyright is
> +    maintained and the source code is not changed. I do not
> +    see a problem with your mods to enable fileop for Linux-arm,
> +    as these mods have been returned to the Iozone folks,
> +    and they have been accepted for inclusion in the next
> +    release :-)
> +
> +Thank you for your contribution,
> +Don Capps
> +
> +----- Original Message -----
> +From: "Marcin Juszkiewicz" <firma@hrw.one.pl>
> +To: "Don Capps" <don.capps2@verizon.net>; "William D. Norcott"=20
> +<wnorcott@us.oracle.com>
> +Sent: Sunday, October 29, 2006 4:55 PM
> +Subject: iozone3 263 patch for arm and License question
> +
> +
> +> Morning
> +>
> +> I want to include iozone3 in OpenEmbedded [1] metadata to give it for=
=20
> +> other developers. Currently OE is used to build few distributions for=
=20
> +> misc platforms: ARM, SH3, SH4, x86, PowerPC and different types of=20
> +> machines (PDA, settopbox, devboards, desktops, thin clients, routers).
> +>
> +> According to your distribution of derivations is forbidden. Packaging
> +> iozone3 in OpenEmbedded will not involve any source code changes. But=
=20
> +> when I was building it for ARM I discovered that fileop binary was=20
> +> not built - so I created patch for it (attached). Not yet tested it=20
> +> on target device.
> +>
> +> Thus, I seek your written permission via e-mail to distribute a=20
> +> package of the unmodified source code and also a package of the pre-co=
mpiled binary.
> +> Your copyright statement will be included in the package.
> +>
> +>
> +> 1. http://www.openembedded.org/
> +>
> +> Regards
> +> --
> +> JID: hrw-jabber.org
> +> OpenEmbedded developer/consultant
> +
> --
> 1.7.5.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/Zw+/jwnNHcBRYYu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHs3WMACgkQN1Ujt2V2gByE8ACgpPULI4Q+wD+zr6ucL4e0L6xx
UIYAoICElmt8d0zoTOHCBbM5QFT1pv6v
=JJ0j
-----END PGP SIGNATURE-----

--/Zw+/jwnNHcBRYYu--
