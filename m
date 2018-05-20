Return-Path: <clopez@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id A672C74856
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2018 19:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject;
	bh=gkDUzlSw5UrjUcr+nUbLw04A/U0eSylipDYvrcbqrC0=; 
	b=KF0CSIgxgJn6A4Up37xV1By3yWz34p1JZjngVlVyTy38SXA6hX0ce+ebTxsidsnW6DRJ/orLIbmqDhTxUGf+5KU5z8IItkhj5zIzdfoPC/VfY0X9Vee0urkTdtVcM95y8naiWez0keG0vTik89C4B2XXq5PEAi+/Vgyy/vZa/mEy+tcfPyao+bJs2QALgQaBUK1yi9GeKtwKCJjnFjupp921ovxLULIvC86FvUh3CgmJByJs3+CrW1jV/HnJUtY08Z+nAYKjvDzMMTHmIAu8qDLxogaBjJ14o/e/XKivmKMfoyUFc9qam3euUUO4ZVOP1298RnQjMeIih0bskHj7iw==;
Received: from 1.14.117.91.dynamic.reverse-mundo-r.com ([91.117.14.1]
	helo=[192.168.0.23]) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1fKTbE-0006XH-KN for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2018 21:02:32 +0200
To: openembedded-devel@lists.openembedded.org
References: <20180512030758.31409-1-raj.khem@gmail.com>
	<20180512030758.31409-5-raj.khem@gmail.com>
	<8c2ae33c-fbde-11de-6fd7-d220c0b55d57@igalia.com>
	<b55b0545-7867-a168-a853-903313da12de@gmail.com>
	<5e41dd1d-0a05-39a4-888c-948be3cc8714@igalia.com>
	<CAJ86T=VXbwsL=2gUqin0-2jdBB1tbbxgwP7+76AToZdO16Jtiw@mail.gmail.com>
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
Openpgp: id=B5D2B50BC48EC7F1EE90D9AB965089CE6B95F882;
	url=http://key.neutrino.es
Organization: Igalia S.L.
Mail-Followup-To: openembedded-devel@lists.openembedded.org
Message-ID: <2d676743-0f4f-a079-96b0-c352546ed892@igalia.com>
Date: Sun, 20 May 2018 21:02:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAJ86T=VXbwsL=2gUqin0-2jdBB1tbbxgwP7+76AToZdO16Jtiw@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 5/8] luajit: Dont use BUILD_LDFLAGS when compiling host binaries
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
X-List-Received-Date: Sun, 20 May 2018 19:02:34 -0000
X-Groupsio-MsgNum: 72281
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="OVd3vbu1HE742Jz3m0LMoW5PLu7NpgP1e"

--OVd3vbu1HE742Jz3m0LMoW5PLu7NpgP1e
Content-Type: multipart/mixed; boundary="GBPmDgXrvxk7uYCMyuUurTCUC5WBLkwaW";
 protected-headers="v1"
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <2d676743-0f4f-a079-96b0-c352546ed892@igalia.com>
Subject: Re: [oe] [meta-oe][PATCH 5/8] luajit: Dont use BUILD_LDFLAGS when
 compiling host binaries
References: <20180512030758.31409-1-raj.khem@gmail.com>
 <20180512030758.31409-5-raj.khem@gmail.com>
 <8c2ae33c-fbde-11de-6fd7-d220c0b55d57@igalia.com>
 <b55b0545-7867-a168-a853-903313da12de@gmail.com>
 <5e41dd1d-0a05-39a4-888c-948be3cc8714@igalia.com>
 <CAJ86T=VXbwsL=2gUqin0-2jdBB1tbbxgwP7+76AToZdO16Jtiw@mail.gmail.com>
In-Reply-To: <CAJ86T=VXbwsL=2gUqin0-2jdBB1tbbxgwP7+76AToZdO16Jtiw@mail.gmail.com>

--GBPmDgXrvxk7uYCMyuUurTCUC5WBLkwaW
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 18/05/18 20:46, Andre McCurdy wrote:
> On Fri, May 18, 2018 at 6:27 AM, Carlos Alberto Lopez Perez
> <clopez@igalia.com> wrote:
>> On 18/05/18 06:44, Khem Raj wrote:
>>>> I suggest adding something like this:
>>>>
>>>> EXTRA_OEMAKE_remove_class-target =3D "'HOST_LDFLAGS=3D${BUILD_LDFLAG=
S}'"
>>>>
>=20
> This idea looks right, but be aware that ${BUILD_LDFLAGS} will be
> expanded before being processed by _remove. Therefore any individual
> string within ${BUILD_LDFLAGS} will be removed from the final value of
> EXTRA_OEMAKE, even if it occurs somewhere other than in the value of
> HOST_LDFLAGS. For example:
>=20
>   BUILD_CFLAGS =3D "one two three"
>   BUILD_LDFLAGS =3D "one two three"
>=20
>   FOO =3D " \
>     'HOST_CFLAGS=3D${BUILD_CFLAGS}' \
>     'HOST_LDFLAGS=3D${BUILD_LDFLAGS}' \
>   "
>=20
>   FOO_remove_class-target =3D "'HOST_LDFLAGS=3D${BUILD_LDFLAGS}'"
>=20
>   $ bitbake recipe -e | grep ^FOO=3D
>=20
>   FOO=3D"'HOST_CFLAGS=3Done three'"
>=20
> Notice how "two" has been removed from the final value of HOST_CFLAGS
> set within FOO.
>=20

Interesting.. didn't knew this.

Is there any way to tell _remove to only remove a string if it matches
as a whole instead of removing the individual words separated by spaces?
I tried escaping the quotes but didn't worked :?


> In this case, if you want to have a HOST_LDFLAGS=3D'...' only for nativ=
e
> builds, it's better to use _append_class-native as required.
>=20
> In general, it's usually a bug (or at least bad form) to use _remove
> in a recipe. It's usually reserved for custom changes in a .bbappend
> etc.
>=20

Indeed. And it seems this is what caused the issue with the native class
for me.

Just removing the 'HOST_LDFLAGS=3D${BUILD_LDFLAGS}' entry directly in the=

luajit recipe (without a bbappend) like the original patch from Khem Raj
proposed works fine.

I just checked that doing that way I can't reproduce the breakage of the
native class. So please commit this original patch from Khem Raj.
It is the right fix.

Thanks






--GBPmDgXrvxk7uYCMyuUurTCUC5WBLkwaW--

--OVd3vbu1HE742Jz3m0LMoW5PLu7NpgP1e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: You can fetch my GnuPG key from http://key.neutrino.es

iQIzBAEBCgAdFiEEtdK1C8SOx/HukNmrllCJzmuV+IIFAlsBxj4ACgkQllCJzmuV
+IJR9A/+O0wIyYhV6NTbK8qK/Fkr6MJXNfTb+eNetHUiAWVpwjJDcQcVmLl+tZo2
tAOGr/+M6Tb7DwkM/BUFu/VLtdVokBzSVL9TlT0UgRJJnlmdSZIPyZGberxwQeNP
ad3wOoJvunEEnaadwwsJNpV4ad4WCJEuwJsb5A2Gau7eOE27keKeE7Yt+7qJe1bG
EbV6yWzSXMRtRf2mbDEka/UCkxCzEDSbCkE3S0VUXG6wua5xkOUBuyZf7Vo8IsBA
4Fal8jo8aXwCLqf23SZub5fW9v1BSa7e3lh/GiMzYLZJ0yKPZdrpkcVAimJ7RRoZ
h3471aIV9X900u2P0n53hpAM9qgA+6ULFmjg9QMMoIyJ979zesmcPqIpaA1GD+XL
mu/oTJAIEBT4Dye51b+ppTSjFG4xB5M39Esc4Hi2VupQkbmd4RUTiyD7TsnwW3PQ
uS2KvuGbe5fgZttynTQLEBteWFGgesOwMgg3uKBf6k72rSrMjnOtnjvp0SFsgv2K
FhL1CAMQw5ORTTLQ7KVoJiGMVNIDS87OYsRwD3Bh6shUeWqLL8z/ImokwPkQS4c3
VGTnla6hiSJiyX+sOQn+fuHVxW3AmHOKEn3nzLvs8PPtn+3SVYLHYYSFBJakzW6x
hKlCC8eNZ/dm5z3KpFpGR/VhoWK5O9qkAnufAyIhHzSn0fH//48=
=qN8j
-----END PGP SIGNATURE-----

--OVd3vbu1HE742Jz3m0LMoW5PLu7NpgP1e--
