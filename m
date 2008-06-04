Received: from [209.85.132.240] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <summatusmentis@gmail.com>) id 1K3tUP-00036W-IH
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Jun 2008 15:57:21 +0200
Received: by an-out-0708.google.com with SMTP id b38so18695ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jun 2008 06:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:x-enigmail-version:content-type;
	bh=hITxcBULLkFwqG07fF3QxhkJjsEGiGK3A58AYRuOMb8=;
	b=yADipZ67IQy17HoCjst+V8DWTdX9DOZpnaZ1E80TXGcJIhNoAvHBgr4woB16OhO5JI
	95vpW0e/S3PFkvLnCf9/WDjuIp+pCXvRFAWDwAfODt9sW9YCPs6DkJuZxT8mZ/YsWIW6
	w2CxPwzyOLy7SqPLUSLAzyYPNJ6hcM8icCKEs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type;
	b=Uim6ChSjBVNms9wEvPrsTTMHXMD5yy7Tibqur/tZnJeyqCNIyn5or7lBHakqd0yCL5
	QpxzKoE40mpierytscLDyVwLQsTUsPIqclrxKUThT+pSGjCvjh0OVOPsUVYY4QAyFMMP
	rnGUFGKbJIrvdAbF3t6iBDDB2Bl+8DrQUa+i0=
Received: by 10.100.214.3 with SMTP id m3mr12778546ang.134.1212587565995;
	Wed, 04 Jun 2008 06:52:45 -0700 (PDT)
Received: from beatitas-2.local ( [69.49.136.34])
	by mx.google.com with ESMTPS id d38sm3119082and.20.2008.06.04.06.52.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Jun 2008 06:52:44 -0700 (PDT)
Message-ID: <48469E26.7010008@gmail.com>
Date: Wed, 04 Jun 2008 09:52:38 -0400
From: Jacob Thebault-Spieker <summatusmentis@gmail.com>
User-Agent: Thunderbird 2.0.0.14 (Macintosh/20080421)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <g1eulp$skn$1@ger.gmane.org>	<200805270944.04922.openembedded@haerwu.biz>	<483BEBD0.4070707@balister.org>	<4842C92B.1020208@kernelconcepts.de>	<c384c5ea0806011556s3983e0dcq6f887698341b17c1@mail.gmail.com>	<4843D763.4080307@balister.org>
	<g265th$bv3$1@ger.gmane.org>
In-Reply-To: <g265th$bv3$1@ger.gmane.org>
X-Enigmail-Version: 0.95.6
Subject: Re: RFC: restart wiki from scratch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 04 Jun 2008 13:57:21 -0000
X-Groupsio-MsgNum: 5292
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig9FBFBDA29CC39D9880FE7FDA"

--------------enig9FBFBDA29CC39D9880FE7FDA
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

I don't have very much OE dev experience, but I've been a user for=20
years. I do have a decent amount of web experience, so if help is=20
needed, I would be willing to contribute some of my time towards this=20
effort.

--
Jacob Thebault-Spieker
Cell: (207) 717-5114


Rolf Leggewie wrote:
> Philip Balister wrote:
>> I mean that the people responsible for the management tasks, like what=

>> backups, and figuring out who to give access to, should make the
>> decision regarding what software to use.
>=20
> Great.  So, it's agreed.  I'll start implementation soon.  Currently, w=
e
> have cbrake and me as main admins, hrw and mickey for standby in case
> the mysql server needs a kick or some such.
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--------------enig9FBFBDA29CC39D9880FE7FDA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.8 (Darwin)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAkhGnioACgkQT1NNAgG+H+whMACfcFem1WNw16Dr1ZUzpKhGaRkA
YjQAoILosxhp+11KOsGvpeR4xuTDQ5Ij
=kKFW
-----END PGP SIGNATURE-----

--------------enig9FBFBDA29CC39D9880FE7FDA--
