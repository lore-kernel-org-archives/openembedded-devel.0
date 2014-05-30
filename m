Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3D99B6FD4D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 May 2014 10:19:34 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id k48so1754816wev.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 May 2014 03:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=By3v6X0D7WHfiIZpKS0zYElYuB15QlPriGQml9AkZpA=;
	b=vQ+Z/R7eYPvipPhzQbI5D1+m7uVytmTnVH/I86O8jq75aGEjLcH7Smb1P+hTOOxzF3
	rZ37AwqnLgKkmV/QP5+uRLUoW7Fph1s5ghC/h26rpBTzvQWcAzV3az5JWj/yaXP7w5f5
	/x1yJkjmhmSTANLyduwTSp+eZUed6LyvED/byySWfIRwEGjqNPeGwTZpSPT4qQ0ORFO1
	uGx52TjWw3zfWF9dkSWDo44MaSm//DVIRk6VO3h/L7Qha1c0hV0L99CPQ3N7YuisAuG5
	CcPhkOrqzcrKOT3tjSywt2N2cQQEhkTfYTHnpJduG/nulROW/jMaDvW4X75oKWQnlpmg
	wDgw==
X-Received: by 10.180.72.243 with SMTP id g19mr5388835wiv.44.1401445174609;
	Fri, 30 May 2014 03:19:34 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	vp5sm8980195wjc.31.2014.05.30.03.19.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 May 2014 03:19:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 30 May 2014 12:19:42 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140530101942.GH2426@jama>
References: <AAE0766F5AF36B46BAB7E0EFB92732063397EB4BC0@GBTWK10E001.Technology.local>
	<2c12c9ff705a424c99db08f7cfa57c0a@BL2PR04MB852.namprd04.prod.outlook.com>
	<AAE0766F5AF36B46BAB7E0EFB92732063397EB4BC6@GBTWK10E001.Technology.local>
MIME-Version: 1.0
In-Reply-To: <AAE0766F5AF36B46BAB7E0EFB92732063397EB4BC6@GBTWK10E001.Technology.local>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: Fix for libxml++_ptest.patch with out-of-source build
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
X-List-Received-Date: Fri, 30 May 2014 10:19:40 -0000
X-Groupsio-MsgNum: 50116
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/9ZOS6odDaRI+0hI"
Content-Disposition: inline

--/9ZOS6odDaRI+0hI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2014 at 01:07:22PM +0100, Lewis, Nick wrote:
> >thanks for the note. However I would encourage you to submit a patch for=
 meta-oe if you can guidelines are here
> >
> >http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
> >
> >Thanks
>=20
> Khem
>=20
> I cannot use git send-email as only MAPI email is supported here . Howeve=
r I have redone the patch using git format-patch -s and pasted it into an e=
mail under the title "libxml plus plus ptest with B noteq S". I hope this c=
an be applied in a similar way
>=20
> Please let me know if there are any problems with it

It still does not apply

see http://patchwork.openembedded.org/patch/72639/

>=20
> Nick
>=20
>=20
>=20
> The details of this company are as follows:
> G4S Technology Limited, Registered Office: Challenge House, International=
 Drive, Tewkesbury, Gloucestershire GL20 8UQ, Registered in England No. 238=
2338.
>=20
> This communication may contain information which is confidential, persona=
l and/or privileged.
>=20
> It is for the exclusive use of the intended recipient(s).
> If you are not the intended recipient(s), please note that any distributi=
on, forwarding, copying or use of this communication or the information in =
it is strictly prohibited.
>=20
> Any personal views expressed in this e-mail are those of the individual s=
ender and the company does not endorse or accept responsibility for them.
>=20
> Prior to taking any action based upon this e-mail message, you should see=
k appropriate confirmation of its authenticity.
>=20
> This e-mail has been scanned for all viruses by MessageLabs.
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/9ZOS6odDaRI+0hI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlOIWz4ACgkQN1Ujt2V2gByuIQCgoppNQgxfSv/4EAhNDhUpCqvz
5rsAn35q6CHHAk4BigUELdN8pjoH+iGL
=EiAs
-----END PGP SIGNATURE-----

--/9ZOS6odDaRI+0hI--
