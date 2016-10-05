Return-Path: <ruben.de.smet@rubdos.be>
Received: from mail.glycos.org (mail.glycos.org [178.62.217.237])
	by mail.openembedded.org (Postfix) with ESMTP id 8653A719DE
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Oct 2016 08:34:15 +0000 (UTC)
Received: from arch-club.local (unknown [85.27.50.55])
	by mail.glycos.org (Postfix) with ESMTPSA id 1BFA940316
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Oct 2016 08:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rubdos.be;
	s=default; t=1475656456;
	bh=OuPjILuPGL9E3Vi/N71YeNF7gyxSlsY8Gw+UAzpje7I=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=fWUeEABCcTGCdSd7/8GaDySSNFjBvxWAomiruE/6DA/dizQ0VFgAG1mTtkmNEdfvc
	BQapWN/5bu+5UFUXJzzTcldFVLcVaBpz4RJ03BOcF8Z8nlwdlbxNOst+Il43f5wlMF
	u7QaP+yXdiNFCPuVs9I5vSAeAw+D3+rIoO5SWKTM=
To: openembedded-devel@lists.openembedded.org
References: <20160929133054.20096-1-ruben.de.smet@rubdos.be>
	<CAAPZna1EHTEKernEX88FO5gv=1m5VrEhf-S3LB6EDF91j8vd2w@mail.gmail.com>
	<CAP9ODKrB3rdsRuoxqYrO3vPsMDuYC7g=ZHNeAjqFW18JJ5Cvww@mail.gmail.com>
	<CANx9H-AwOJbZ_VXfJ5B8RXzQhs+M4dBZVOzJvM+PDcSwzq7QDg@mail.gmail.com>
From: Ruben De Smet <ruben.de.smet@rubdos.be>
Message-ID: <3f852ad5-c4bd-6077-c3fa-08d7a0fceae9@rubdos.be>
Date: Wed, 5 Oct 2016 10:34:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CANx9H-AwOJbZ_VXfJ5B8RXzQhs+M4dBZVOzJvM+PDcSwzq7QDg@mail.gmail.com>
Subject: Re: [meta-python][PATCH] python-scales: add recipe for version 1.0.9
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
X-List-Received-Date: Wed, 05 Oct 2016 08:34:17 -0000
X-Groupsio-MsgNum: 63373
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="tsWNr6mlHKK4xaFgcpq9bAcc2LDVlQXqs"

--tsWNr6mlHKK4xaFgcpq9bAcc2LDVlQXqs
Content-Type: multipart/mixed; boundary="JnjQboUU7LKhcbmwNTKshKhNmnrm9mkLN";
 protected-headers="v1"
From: Ruben De Smet <ruben.de.smet@rubdos.be>
To: openembedded-devel@lists.openembedded.org
Message-ID: <3f852ad5-c4bd-6077-c3fa-08d7a0fceae9@rubdos.be>
Subject: Re: [oe] [meta-python][PATCH] python-scales: add recipe for version
 1.0.9
References: <20160929133054.20096-1-ruben.de.smet@rubdos.be>
 <CAAPZna1EHTEKernEX88FO5gv=1m5VrEhf-S3LB6EDF91j8vd2w@mail.gmail.com>
 <CAP9ODKrB3rdsRuoxqYrO3vPsMDuYC7g=ZHNeAjqFW18JJ5Cvww@mail.gmail.com>
 <CANx9H-AwOJbZ_VXfJ5B8RXzQhs+M4dBZVOzJvM+PDcSwzq7QDg@mail.gmail.com>
In-Reply-To: <CANx9H-AwOJbZ_VXfJ5B8RXzQhs+M4dBZVOzJvM+PDcSwzq7QDg@mail.gmail.com>

--JnjQboUU7LKhcbmwNTKshKhNmnrm9mkLN
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Excuse me, I didn't see that there was a reply here. I'll fix this
somewhere around tomorrow.

Thanks for the review,
Kind regards,

Ruben

On 10/03/2016 11:10 PM, Tim Orling wrote:
> On Mon, Oct 3, 2016 at 12:58 PM, Otavio Salvador <
> otavio.salvador@ossystems.com.br> wrote:
>=20
>> On Thu, Sep 29, 2016 at 10:54 AM, Fabio Berton
>> <fabio.berton@ossystems.com.br> wrote:
>>> On Thu, Sep 29, 2016 at 10:30 AM, Ruben De Smet <ruben.de.smet@rubdos=
=2Ebe
>>>
>>> wrote:
>>> +"
>>>> +
>>>> +DEPENDS_${PN} +=3D "\
>>>> +    python3-setuptools \
>>>> +"
>>>>
>>>
>>>
>>> Is this not provided by setuptools3
>>> class?
>>
>> The DEPENDS being PN specific is pointless also Fabio raised a point
>> which seems ignored.
>>
>> Martin, please drop this from master-next until it is fixed.
>>
>>
> Agreed. Thank you for the review.
>=20
>=20
>> --
>> Otavio Salvador                             O.S. Systems
>> http://www.ossystems.com.br        http://code.ossystems.com.br
>> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>



--JnjQboUU7LKhcbmwNTKshKhNmnrm9mkLN--

--tsWNr6mlHKK4xaFgcpq9bAcc2LDVlQXqs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQE2BAEBCAAgBQJX9Lr/GRxydWJlbi5kZS5zbWV0QGdseWNvcy5vcmcACgkQ+CZa
iBIT3BACaAf+PxDmPcc+qjbpNqHLd51wwfR1FbymovqDAToi4TNyo+89VuZ2QrpJ
17B0vcEqBWimPvqRZmikzAG5rYraZq11pmoyh4xVRGhi3R+9AySpGIuKsjKjn76e
RUYqa6B60soq1+pqpGYAAP12r2m0MlL8x5YuKbH1Nz9upSZKk8c3ia+lLEtrg2EP
FvzPnxNsDHHdJL+zVaL0Ifc6tzJjDUz7ME8vjmqO9SpO7evmR7sZaB/2nmNrFbxp
2SBOmKidB+CabILzvARyo7sTzrLw2nWsfvjbVm6E/rhPDPVxzqMr2zktSykNvsBs
o77kNCFOK7b13kJ2Yal92on9XlhAXcEi+Q==
=ARM/
-----END PGP SIGNATURE-----

--tsWNr6mlHKK4xaFgcpq9bAcc2LDVlQXqs--
