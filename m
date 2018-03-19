Return-Path: <trini@konsulko.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4E9ED78978
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 20:29:26 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id s188so19795943qkb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 13:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=SzaRHu8MF96RCNd5UoasqR/6Fnyvf9rqv7yA1MvjWw8=;
	b=q3is0FPgIQHg05h0MG3sUjcZH38/o5y/7XPjJ47XwFmnq1xF4L7qXI9//B91E0Vm0x
	BeE2z18RvBtUXIcTwIls5VKlflK9eCEyrhfvaKactneJU78Gpfb4Ro5pi75E+9WglPFf
	DbJmpu/8Vgft1YAQuusga3FHQyxhk3RYxU3y0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=SzaRHu8MF96RCNd5UoasqR/6Fnyvf9rqv7yA1MvjWw8=;
	b=h1YqC0AjL81MAbYCXhG647Wa/G9SpwU3CI3TsrmIkM/MEj4zYXetyiv6XSTbLS8CbU
	ywTTWsYWhTStbwjciBeCJ0K5iVSbTqnAazFrIWPSp5HfEDPbTeHIXqTq87lsG6FunJ6M
	HdQs55nIKLkrNpR5Ch1EprjeWgKTyIhCps1f+DB5RFPTngWj9Ml9R5AKDDAdvx4ifjBX
	JYkdzzjOUSVYlgjFxQ1SHu9lbV60b8jhIah2wrtRrKrl6Jnn68k+qN9x9M18SUNqgiQE
	ZfDpmzbJm2pkXDbkNVQ+ngiFQc4oVvHznRKDGwBPbJDw0hzA2FMDyFp38Peoz+rmaJZV
	TaHg==
X-Gm-Message-State: AElRT7HRTDNpBS7lR1yzRcio6ntKRKL+NJQPzpo24LA1fbwu/R9BVrjO
	zPNSwxItl6y1sKDvpb+FIbiCyQ==
X-Google-Smtp-Source: AG47ELu0FEwCIesKPN60zfmL71lzUmh0jvdKbR03qRZ8Zj/cI/uH6WnU1vm0zhYXgW5rlsdst7NxBw==
X-Received: by 10.55.112.199 with SMTP id l190mr20100992qkc.335.1521491367235; 
	Mon, 19 Mar 2018 13:29:27 -0700 (PDT)
Received: from bill-the-cat.ec.rr.com (cpe-65-184-142-68.ec.res.rr.com.
	[65.184.142.68])
	by smtp.gmail.com with ESMTPSA id e30sm51072qtg.1.2018.03.19.13.29.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Mar 2018 13:29:26 -0700 (PDT)
Date: Mon, 19 Mar 2018 16:29:24 -0400
From: Tom Rini <trini@konsulko.com>
To: Vesa =?iso-8859-1?B?SuTkc2tlbORpbmVu?= <dachaac@gmail.com>
Message-ID: <20180319202924.GZ4418@bill-the-cat.ec.rr.com>
References: <48f2945a-e330-4bc8-a4da-ab970b63ea5f@gmail.com>
	<20180319155951.GW4418@bill-the-cat.ec.rr.com>
	<cacb3c83-0b9d-c1c1-4685-58b48f277a04@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cacb3c83-0b9d-c1c1-4685-58b48f277a04@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: meta-openembedded Layers
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
X-List-Received-Date: Mon, 19 Mar 2018 20:29:26 -0000
X-Groupsio-MsgNum: 71348
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DHs1QIiRxKbdokJu"
Content-Disposition: inline

--DHs1QIiRxKbdokJu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 19, 2018 at 09:29:53PM +0200, Vesa J=E4=E4skel=E4inen wrote:
> On 19/03/2018 17.59, Tom Rini wrote:
>=20
> >I would suggest that for sumo, any layers that do get moved /
> >re-distributed / whatever, a "dummy" version be kept in place that says
> >where it moved to (or where recipes were migrated to, or whatever is
> >appropriate) and then they can be dropped in master.
> >
> Commit message with details should be enough for this kind of information.
> Leaving files behind would be just confusing.

I don't mean recipes.  I do mean a README update.  Perhaps even a
layer.conf file that throws an error?  There's a lot of people / use
cases that won't catch the git log nearly as easily as they'll catch a
README.  Even more so since we're talking about layers that've been
around for a long time.

--=20
Tom

--DHs1QIiRxKbdokJu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJasB2kAAoJEIf59jXTHXZSK5gP/RwBsD4F0+fLklbK8TBEuBzX
5ILSqTKyRNko9+GCWmAstguBZNEo8Yw5n5Cw5tQN3hlkksMN4rOzNDBOrr2vTDsE
oCLRXWDbHqNwLn5GcGxo0BoPkcgbinDH7X9vWZiBS5QmyBFyfZvHGV7ZBU/Z0DEp
XZ5Kk6DQ1rDlW5yh8ezzPWUwvkpyaeIecXBgXAxLDalpHiJBX8HSB2FFiZIci7gH
uAucYB4lDxTPkHG/cu0ZKThwU0Z4CdVXo33onh1xDHgTFC6CspBFVJppc4Yz+PGt
T4KpyJS72L2XUIJoshbOaQ57AX+AJGCl3dCERL168iB0zcsR/SxMjy4nssOWlExU
cZ/fqTeVsl3H/Etno2SaxqI+JlcV21XeSkQTvVHQywRQ75oWIa4Hvn4h71PJD7o+
563665LwbINGCPERtmZuJLp52DvOK1m12sR+mf1OxMhnsB/1DjcXMaHHYxBbOEpT
yFE6VY+X9YyEyxWnch6/NIPKoEDkUr6G//GQpVE90x5O5S4+dWhRkhpMWkFNgU7K
LerMPq8XuJ+P2FCvXGUAQLSUk+ofP+HXhY9Cm4ApjnGxPCFrwaXptdNnC5XfMdmW
NDESpIAMq5/bWkbe1qgVQBHkvAbIzX0FlbwCkSc5k9ou8IQHJ38n7F7iPspzIC8D
GSHwX8+skZJFQN3WFccy
=PB3W
-----END PGP SIGNATURE-----

--DHs1QIiRxKbdokJu--
