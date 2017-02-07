Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 09FC460110
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Feb 2017 18:32:46 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Feb 2017 10:32:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; 
	d="asc'?scan'208";a="1123379735"
Received: from unknown (HELO [10.219.128.137]) ([10.219.128.137])
	by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2017 10:32:46 -0800
To: openembedded-devel@lists.openembedded.org
References: <1486399174-28949-1-git-send-email-akuster808@gmail.com>
	<caa1a269-b4e4-9909-967f-c637146fc4ba@gmail.com>
	<1486453274.14889.135.camel@intel.com> <20170207102518.GA3276@jama>
	<1486465148.14889.140.camel@intel.com>
From: Jose Lamego <jose.a.lamego@linux.intel.com>
Message-ID: <17a923eb-ec4b-1401-8277-cba1ddd1aae0@linux.intel.com>
Date: Tue, 7 Feb 2017 12:32:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1486465148.14889.140.camel@intel.com>
Subject: Re: Patchwork-Status via email
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
X-List-Received-Date: Tue, 07 Feb 2017 18:32:47 -0000
X-Groupsio-MsgNum: 65024
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="RPB7FoVNlG45vxSGjFwghd1spqmioxw44"

--RPB7FoVNlG45vxSGjFwghd1spqmioxw44
Content-Type: multipart/mixed; boundary="KjWl8VDubRThMnp69M9vtpW6xAour3OEX";
 protected-headers="v1"
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <17a923eb-ec4b-1401-8277-cba1ddd1aae0@linux.intel.com>
Subject: Re: Patchwork-Status via email
References: <1486399174-28949-1-git-send-email-akuster808@gmail.com>
 <caa1a269-b4e4-9909-967f-c637146fc4ba@gmail.com>
 <1486453274.14889.135.camel@intel.com> <20170207102518.GA3276@jama>
 <1486465148.14889.140.camel@intel.com>
In-Reply-To: <1486465148.14889.140.camel@intel.com>

--KjWl8VDubRThMnp69M9vtpW6xAour3OEX
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 02/07/2017 04:59 AM, Patrick Ohly wrote:
> On Tue, 2017-02-07 at 11:25 +0100, Martin Jansa wrote:
>> On Tue, Feb 07, 2017 at 08:41:14AM +0100, Patrick Ohly wrote:
>>> On Mon, 2017-02-06 at 09:10 -0800, akuster808 wrote:
>>>> please drop. this is fixed via a change in master-next.
>>>>
>>>> http://cgit.openembedded.org/meta-openembedded/commit/?h=3Dmaster-ne=
xt&id=3D2e83e33c592543045a7761907d8cd62937e1e60d
>>>
>>> Let's see whether the magic keyword works :-)
>>>
>>> [Patchwork-Status: Superseded]
>>>
>>> https://patchwork.openembedded.org/patch/136794/
>>>
>>> --=20
>>> Best Regards, Patrick Ohly
>>>
>>> The content of this message is my personal opinion only and although
>>> I am an employee of Intel, the statements I make here in no way
>>> represent Intel's position on the issue, nor am I authorized to speak=

>>> on behalf of Intel on this matter.
>>
>> If it was supposed to update status on Patchwork, then it didn't work
>> it's still in "New" state.
>=20
> Jose, in your "parsemail: Set patch state from email metadata" patch yo=
u
> said that it "allows project maintainers to change a patch status
> directly from an email message".
>=20
> Can you clarify who the "project maintainers" are who can use this emai=
l
> interface?
>=20
Correct, the patch status change through email is available only for
those registered as project maintainers in Patchwork. These are listed
under "About this project" section at the web interface.

> What about this use case here: the original author wants to retract a
> patch. Can he do that via email and/or the web interface?
>=20
Patch submitter (and project maintainers) can update status manually
through the web interface.

> I wasn't the original author and probably also no project maintainer, s=
o
> I guess that's why my email had no effect. Can we enable some kind of
> error response for such cases?
>=20
Good idea. I've filed a request to track this:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D11027

--=20
Jose Lamego | OTC Embedded Platforms & Tools | GDC


--KjWl8VDubRThMnp69M9vtpW6xAour3OEX--

--RPB7FoVNlG45vxSGjFwghd1spqmioxw44
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJYmhLNAAoJEFJAtowlSEbnH/cH+wVRqkT89biZIDWlRb8hZT9W
61riaKWX0s6ldUikVIDIeDK/bAKNGp4TaqztFzUAcPp7eivCUVSsd4XhnJPw6OCW
ZZQLVZYEOHLs9Ao+XNiN/yPBNfhP5sinueZJf/VkArN/1D4BSK6FiJoWFIjlRlQO
Z2g9tNckGtwZHcwEeS9ASiIu3hEi8KLBeSt9yLe47gdehXKDkTrlGsjyVX11j8XV
OiZgHZU0rc/3kS5zJLbLtVjzYfbPKwctoQdgQEjW3vBPd1w9RAcyLL0Ypq+IPqtn
3DmGJbe0N/Xu7AoOXG1ca3qP7mInKQS5oHAqv9J9XXq1KM7Lybow4iaM+LawuAY=
=pG/Z
-----END PGP SIGNATURE-----

--RPB7FoVNlG45vxSGjFwghd1spqmioxw44--
