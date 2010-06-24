Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john3909@gmail.com>) id 1ORvay-0005pT-5o
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jun 2010 01:12:33 +0200
Received: by pvg3 with SMTP id 3so1259035pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jun 2010 16:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:reply-to:from:to:references
	:in-reply-to:subject:date:organization:message-id:mime-version
	:content-type:content-transfer-encoding:x-mailer:thread-index
	:content-language;
	bh=10esE7KgGB593PaunjzGiBkmlhr0xm/PPEf9xp2p4kY=;
	b=kLtH1wlakNg1qCyGz4jZUqmjWSwVQwKPEYQ/+IE4ojSoFpXfavfmGfQQOcOAMTgYpL
	zuodSnA7LzdTvIac4DbJx9TnFWopxCAX1wxOiTk9C+UJZLQ/gBh/1/p/s3Qg6mSuhmFR
	iyBRMvfHTkWM89/ou8GvWpt2WdwzLjqD7/YVk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=reply-to:from:to:references:in-reply-to:subject:date:organization
	:message-id:mime-version:content-type:content-transfer-encoding
	:x-mailer:thread-index:content-language;
	b=u0/rDK20fZ9NPYzb9Fwf/KNDGkAAwWgX3qY+ppuDlJ8ppBrH22dt4eFRvdfFBKA4xD
	+hMzrSjRSu8Uc0baxHoiohEPLki7VNR/o8HeWO32jpZft6OsTd4wKAZnN0zXRMMrOqH+
	ww2osbRREu/b7RjNjhtCj32KRE8lTrCiImVPY=
Received: by 10.115.84.13 with SMTP id m13mr10491716wal.55.1277420873274;
	Thu, 24 Jun 2010 16:07:53 -0700 (PDT)
Received: from inspiron9400 (99-26-125-126.lightspeed.sndgca.sbcglobal.net
	[99.26.125.126])
	by mx.google.com with ESMTPS id f11sm61286937wai.11.2010.06.24.16.07.50
	(version=SSLv3 cipher=RC4-MD5); Thu, 24 Jun 2010 16:07:51 -0700 (PDT)
From: "John \(GMail\)" <john3909@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
References: <4BF2417A.6000302@acn-group.ch> <ht374m$lsv$2@dough.gmane.org>
	<4BF524AF.5030700@acn-group.ch>
In-Reply-To: <4BF524AF.5030700@acn-group.ch>
Date: Thu, 24 Jun 2010 16:07:45 -0700
Organization: U.S. Power, Inc
Message-ID: <014f01cb13f2$0fdebca0$2f9c35e0$@com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: Acr4FFyYzf+ZxqgvQv6J0257vCFMVQb3U+Sg
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: john3909@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [hawkboard] OE Kernel Not Booting
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
X-List-Received-Date: Thu, 24 Jun 2010 23:12:33 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Language: en-us



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf =
Of
> Christophe Aeschlimann
> Sent: Thursday, May 20, 2010 5:02 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [hawkboard] OE Kernel Not Booting
>=20
> Le 20.05.2010 13:41, Koen Kooi a =E9crit :
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > On 18-05-10 09:27, Christophe Aeschlimann wrote:
> >> Hi,
> >>
> >> We are at least three hawkboard owners that have the same issue.
> >>
> >> Building org.openembedded.dev HEAD with
> >>
> >> MACHINE=3D "hawkboard"
> >> DISTRO =3D "angstrom-2008.1"
> >>
> >> produces a Kernel Image that cannot be booted on our hawkboards.
> >>
> >> The behaviour is the following with the following kernel bootargs :
> >
> >>> [    0.350000] vpif vpif: vpif probe success
> >>> [    0.350000] Switching to clocksource timer0_1
> >>
> >> And it hangs there forever.
> >
> > That should be fixed now with:
> >
>
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D49a1f4bdb=
30996
> 9f2c40b5dbfefdb56c83c0b264
> >
> > regards,
>=20
> Yes I confirm it is.
Did you ever manage to update your u-boot on your Hawkboard? I signed my
Angstrom generated u-boot with AISGen but my board did not work and had =
to
revert to u-boot_nand_ais_v1.bin.=20

Regards
John.=20

>=20
> Thanks,
>=20
> Christophe
>=20
> >
> > Koen
> > -----BEGIN PGP SIGNATURE-----
> > Version: GnuPG v1.4.5 (Darwin)
> >
> >
> iD8DBQFL9R/WMkyGM64RGpERAj0qAJ4kmzsizEWt/bxA/GmfqK9wVIAjbQCeP
> KC1
> > 6bz6gYhGO+l/4TFhk9TNhcI=3D
> > =3DPHmx
> > -----END PGP SIGNATURE-----
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > =
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



