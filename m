Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PcKhw-0005mW-09
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 17:35:00 +0100
Received: by fxm17 with SMTP id 17so18206845fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jan 2011 08:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=JsDt++WD21+AIQG5Xhz/c1ETd62j878fpsndIVqjtK4=;
	b=H7HCbe/bTJo1AP9/fg5pXtR1D2BnmtXvHBm/NXbWImzrI/rCk1BRrAvILapX8r1ZmD
	RG5gy8vcdNQNp9ry6NzgAMJ57qd8IezkwvQsU4QNRYaa3JK3mHG0GbJFveKaYMSBIPYE
	mU0koxys85m9jBX7boDjCA+NvCK9ivUUBb+24=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=pKclGPlYSCxltoo5+87Q5+Ji9nPbReAILFUgY+lcJ+CkMNAzLHZikAvxG6gDH5tEc7
	6/L7Jf5TA1KQnTZi676x/cRLToJ9mXfvZKnyXFtxMyK7tmtGw/0ipzgu2KBjSkE0L8tb
	/LECGjG10P+LfrJvlEeRdGDdmn8+Mqh1uMriM=
Received: by 10.223.96.199 with SMTP id i7mr1168454fan.56.1294677270570;
	Mon, 10 Jan 2011 08:34:30 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n1sm7024046fam.16.2011.01.10.08.34.28
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 10 Jan 2011 08:34:29 -0800 (PST)
Date: Mon, 10 Jan 2011 17:34:32 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110110163432.GF3244@jama>
References: <1292507333-20222-1-git-send-email-Martin.Jansa@gmail.com>
	<AANLkTik6N-zh9_o819ipEyu7-k3k5Nt24+GbVTg0q24n@mail.gmail.com>
	<AANLkTimea7_8xcgXXb751V_Jhk_q9GP7VAUcEupGUrGW@mail.gmail.com>
	<4D2B3303.4000008@mentor.com>
MIME-Version: 1.0
In-Reply-To: <4D2B3303.4000008@mentor.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [RFC] xorg: upgrade to X11R7.6 and remove preferred-xorg-versions*.inc files
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
X-List-Received-Date: Mon, 10 Jan 2011 16:35:00 -0000
X-Groupsio-MsgNum: 27873
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UBnjLfzoMQYIXCvq"
Content-Disposition: inline

--UBnjLfzoMQYIXCvq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 10, 2011 at 09:25:39AM -0700, Tom Rini wrote:
> On 01/10/2011 05:20 AM, Otavio Salvador wrote:
> > On Mon, Jan 10, 2011 at 06:31, Martin Jansa<martin.jansa@gmail.com>  wr=
ote:
> >> Or just push and see who complains? :/
> >
> > +1
>=20
> +1

can I sed 's/+1/Ackey-by you 2/g' ?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UBnjLfzoMQYIXCvq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)

iEYEARECAAYFAk0rNRgACgkQN1Ujt2V2gByEaQCgoEf9yiKRqHECqP2IHFZUu1Md
fCQAoLh9teUJLlJw9ELKEgwcgSXKsbyF
=XFzm
-----END PGP SIGNATURE-----

--UBnjLfzoMQYIXCvq--
