Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1F4CB65D10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 11:16:31 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e53so2929877eek.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 04:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ptUaRIWNJiKfnzuhBDCldDzgN9aPmutlHNe9MMMahiw=;
	b=Lj+uhc5UKudnF0xpSe1N/bgBNp89IIjEc13NWCWMMW51Ag2FuEPMxD5By52xA4E28W
	P3X1ag68c0NT9o1CiMQkMG/FWzOo+qAk6LdWjNKqxhbcsPGYE521C9o85u2xuHEPU3GE
	ZIpL1b06aLP0OfYxmDQjrXpTUutAO6ZdYR8VkhovBauueOuuKHkiLw4Q4AxCLaunjcH/
	m2aYLIBOYxA0gyltqrtTJKKelduXid8vX2PPSjGtdWKwEtkgb7qaqqgd+5qMDYmSifwz
	7h5CWX8yrgkwp9vJi281nrK2FJmTlKWTSquqn6W/z2TUi0wp6MJ+q/ydXWjermzgOriM
	05Xw==
X-Received: by 10.14.218.193 with SMTP id k41mr37936622eep.16.1397992592009;
	Sun, 20 Apr 2014 04:16:32 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	q41sm93739833eez.7.2014.04.20.04.16.30 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 04:16:30 -0700 (PDT)
Date: Sun, 20 Apr 2014 13:16:35 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420111635.GM2486@jama>
References: <1397066253-13843-1-git-send-email-trevor.woerner@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1397066253-13843-1-git-send-email-trevor.woerner@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: patches@linaro.org
Subject: Re: [meta-oe][PATCH v2] licenses: add The Open Group Public License
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
X-List-Received-Date: Sun, 20 Apr 2014 11:16:34 -0000
X-Groupsio-MsgNum: 49320
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CoKeqzoheR24UlpS"
Content-Disposition: inline

--CoKeqzoheR24UlpS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 09, 2014 at 01:57:33PM -0400, Trevor Woerner wrote:
> This is the license used for the openmotif library.

Merged, thanks!

>=20
> Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
> ---
>  meta-oe/licenses/OGPL | 104 ++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 104 insertions(+)
>  create mode 100644 meta-oe/licenses/OGPL
>=20
> diff --git a/meta-oe/licenses/OGPL b/meta-oe/licenses/OGPL
> new file mode 100644
> index 0000000..bce3b71
> --- /dev/null
> +++ b/meta-oe/licenses/OGPL
> @@ -0,0 +1,104 @@
> +$TOG: COPYRIGHT.MOTIF /main/5 2000/04/10 12:00:00 $
> +
> +                            MOTIF 2.1.30
> +                             Source Code
> +                        MASTER COPYRIGHT NOTICE
> +
> +(c) Copyright 1989 - 1994, 1996 - 1999 The Open Group
> +(c) Copyright 1987 - 1999 Hewlett-Packard Company
> +(c) Copyright 1987 - 1999 Digital Equipment Corporation, Maynard, Mass.
> +(c) Copyright 1988 Massachusetts Institute of Technology
> +(c) Copyright 1988 Microsoft Corporation
> +(c) Copyright 1990 Motorola Inc.
> +(c) Copyright 1989 - 1994 Groupe Bull
> +(c) Copyright 1991 Joseph Friedman
> +(c) Copyright 1995 - 1999 International Business Machines Corp.
> +(c) Copyright 1995 - 1999 Sun Microsystems, Inc.
> +(c) Copyright 1995 - 1999 Santa Cruz Organization, Inc.
> +(c) Copyright 1995, 1996 Fujitsu Limited
> +(c) Copyright 1995, 1996 Hitachi, Ltd.
> +
> +
> +ALL RIGHTS RESERVED
> +
> +This software is furnished under a license and may be used
> +and copied only in accordance with the terms of such license and
> +with the inclusion of this copyright notice. No title to and ownership
> +of the software is hereby transferred.
> +
> +This software is subject to an open license. It may only be
> +used on, with or for operating systems which are themselves open
> +source systems. You must contact The Open Group for a license allowing
> +distribution and sublicensing of this software on, with, or for
> +operating systems which are not Open Source programs.
> +
> +See http://www.opengroup.org/openmotif/license for full
> +details of the license agreement. Any use, reproduction, or
> +distribution of the program constitutes recipient's acceptance of
> +this agreement.
> +
> +THE OPEN GROUP AND ITS THIRD PARTY SUPPLIERS, ASSUME NO RESPONSIBILITY
> +FOR THE USE OR INABILITY TO USE ANY OF ITS SOFTWARE.
> +
> +EXCEPT AS EXPRESSLY SET FORTH IN THIS AGREEMENT, THE PROGRAM IS
> +PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
> +KIND, EITHER EXPRESS OR IMPLIED INCLUDING, WITHOUT LIMITATION, ANY
> +WARRANTIES OR CONDITIONS OF TITLE, NON-INFRINGEMENT, MERCHANTABILITY
> +OR FITNESS FOR A PARTICULAR PURPOSE.
> +
> +EXCEPT AS EXPRESSLY SET FORTH IN THIS AGREEMENT, NEITHER RECIPIENT
> +NOR ANY CONTRIBUTORS SHALL HAVE ANY LIABILITY FOR ANY DIRECT,
> +INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
> +DAMAGES (INCLUDING WITHOUT LIMITATION LOST PROFITS), HOWEVER CAUSED
> +AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
> +LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
> +ANY WAY OUT OF THE USE OR DISTRIBUTION OF THE PROGRAM OR THE
> +EXERCISE OF ANY RIGHTS GRANTED HEREUNDER, EVEN IF ADVISED OF THE
> +POSSIBILITY OF SUCH DAMAGES.
> +
> +The information in this software is subject to change without
> +notice and should not be construed as a commitment by The Open Group
> +or its third party suppliers.
> +
> +Notice: Notwithstanding any other lease or license that may pertain to,
> +or accompany the delivery of, this computer software, the rights of the
> +Government regarding its use, reproduction and disclosure are as set
> +forth in Section 52.227-19 of the FARS Computer Software-Restricted
> +Rights clause.
> +
> +(c) Copyright 1990, 1991, 1992, 1993, 1994, 1996 Open Software
> +Foundation, Inc.
> +(c) Copyright 1996, 1997, 1998, 1999, 2000 The Open Group.
> +Unpublished - all rights reserved under the Copyright laws of the United
> +States.
> +
> +RESTRICTED RIGHTS NOTICE: Use, duplication, or disclosure by the
> +Government is subject to the restrictions as set forth in subparagraph
> +(c)(1)(ii) of the Rights in Technical Data and Computer Software clause
> +at DFARS 52.227-7013.
> +
> +The Open Group LLC
> +Apex Plaza, Forbury Road
> +Reading, Berkshire,
> +RG1 1AX, UK.
> +
> +RESTRICTED RIGHTS LEGEND: This computer software is submitted with
> +"restricted rights." Use, duplication or disclosure is subject to the
> +restrictions as set forth in NASA FAR SUP 18-52.227-79 (April 1985)
> +"Commercial Computer Software- Restricted Rights (April 1985)." The
> +Open Group, Apex Plaza, Forbury Road, Reading, Berkshire, RG1 1AX, UK.
> +If the contract contains the Clause at 18-52.227-74 "Rights in Data
> +General" then the "Alternate III" clause applies.
> +
> +(c) Copyright 1990, 1991, 1992, 1993, 1994, 1996 Open Software
> +Foundation,Inc. ALL RIGHTS RESERVED
> +(c) Copyright 1996, 1997, 1998, 1999, 2000 The Open Group. ALL RIGHTS
> +RESERVED
> +
> +The Open Group, Open Software Foundation, OSF, OSF/Motif, and Motif are
> +Trademarks of The Open Group
> +DEC and DIGITAL are registered trademarks of Digital Equipment
> +Corporation
> +HP is a trademark of Hewlett-Packard Company
> +X Window System is a trademark of the Massachusetts Institute of
> +Technology
> --=20
> 1.9.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--CoKeqzoheR24UlpS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTrJMACgkQN1Ujt2V2gBxdmwCfZqRm2It2VLFRqSKQ8t95A+Di
jocAn1arVIcgpinGNOy3YxIKAmWnx/IC
=Vxuh
-----END PGP SIGNATURE-----

--CoKeqzoheR24UlpS--
