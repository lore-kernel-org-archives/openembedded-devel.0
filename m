Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3E733719F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Dec 2016 21:02:08 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 14 Dec 2016 13:02:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,348,1477983600"; 
	d="asc'?scan'208";a="18183865"
Received: from jalamego-mobl2.zpn.intel.com (HELO [10.219.5.137])
	([10.219.5.137])
	by orsmga002.jf.intel.com with ESMTP; 14 Dec 2016 13:02:09 -0800
To: openembedded-devel@lists.openembedded.org
References: <4717571.f7GXZOAcRz@peggleto-mobl.ger.corp.intel.com>
	<20161129204327.GG2546@bill-the-cat>
	<d93f4841-0154-2232-1802-2b8fcc85a81c@linux.intel.com>
	<19E9BF3F-664F-42A4-A170-5B7BB473ED80@gmail.com>
	<53ca2ead-1b75-ff6d-30c1-abb16330bad3@linux.intel.com>
	<20161202083009.GB3721@jama> <20161202122923.GI2546@bill-the-cat>
	<3a262190-a720-7901-5ab0-8023ecf2521f@linux.intel.com>
	<2f3da309-df26-78e8-0d5b-d62f71b529cd@linux.intel.com>
From: Jose Lamego <jose.a.lamego@linux.intel.com>
Message-ID: <ec502c78-20ab-9cea-c6cf-b9cffd7c377f@linux.intel.com>
Date: Wed, 14 Dec 2016 15:02:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <2f3da309-df26-78e8-0d5b-d62f71b529cd@linux.intel.com>
Subject: Re: meta-openembedded patchwork git hook
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
X-List-Received-Date: Wed, 14 Dec 2016 21:02:09 -0000
X-Groupsio-MsgNum: 64320
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="hPq6osurubcn4bthtxM0fScP8nrx9AgV9"

--hPq6osurubcn4bthtxM0fScP8nrx9AgV9
Content-Type: multipart/mixed; boundary="C3aqtfVC3DmCmlpgS2mPoMi55Jl6OBfuR";
 protected-headers="v1"
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <ec502c78-20ab-9cea-c6cf-b9cffd7c377f@linux.intel.com>
Subject: Re: [oe] meta-openembedded patchwork git hook
References: <4717571.f7GXZOAcRz@peggleto-mobl.ger.corp.intel.com>
 <20161129204327.GG2546@bill-the-cat>
 <d93f4841-0154-2232-1802-2b8fcc85a81c@linux.intel.com>
 <19E9BF3F-664F-42A4-A170-5B7BB473ED80@gmail.com>
 <53ca2ead-1b75-ff6d-30c1-abb16330bad3@linux.intel.com>
 <20161202083009.GB3721@jama> <20161202122923.GI2546@bill-the-cat>
 <3a262190-a720-7901-5ab0-8023ecf2521f@linux.intel.com>
 <2f3da309-df26-78e8-0d5b-d62f71b529cd@linux.intel.com>
In-Reply-To: <2f3da309-df26-78e8-0d5b-d62f71b529cd@linux.intel.com>

--C3aqtfVC3DmCmlpgS2mPoMi55Jl6OBfuR
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 12/14/2016 02:27 PM, Jose Lamego wrote:
>=20
>=20
> On 12/02/2016 09:45 AM, Jose Lamego wrote:
>> I'm looking into this right now. I've filed a bug for tracking:
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10759
>>
>>
>> On 12/02/2016 06:29 AM, Tom Rini wrote:
>>> On Fri, Dec 02, 2016 at 09:30:09AM +0100, Martin Jansa wrote:
>>>> On Wed, Nov 30, 2016 at 12:41:20PM -0600, Jose Lamego wrote:
>>>>>
>>>>>
>>>>> On 11/29/2016 07:50 PM, Khem Raj wrote:
>>>>>>
>>>>>>> On Nov 29, 2016, at 2:34 PM, Jose Lamego <jose.a.lamego@linux.int=
el.com> wrote:
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> On 11/29/2016 02:43 PM, Tom Rini wrote:
>>>>>>>> On Wed, Nov 30, 2016 at 06:52:46AM +1300, Paul Eggleton wrote:
>>>>>>>>
>>>>>>>>> Hi folks,
>>>>>>>>>
>>>>>>>>> Martin just brought to my attention that the git hook for the=20
>>>>>>>>> meta-openembedded repository that's supposed to update patchwor=
k still isn't=20
>>>>>>>>> working and hasn't done so for a very long time. I thought we'd=
 fixed this so=20
>>>>>>>>> that merged patches get marked as "Accepted", but at least for =
meta-
>>>>>>>>> openembedded it seems like that's not the case.
>>>>>>>>>
>>>>>>>>> Jose / Michael - can you look into this if you haven't already?=
 Please let me=20
>>>>>>>>> know if you need any help.
>>>>>>>
>>>>>>> The git hook was configured to update OE-core only, Michael will =
help us
>>>>>>> to include meta-openembedded.
>>>>>>>
>>>>>>
>>>>>> There are more repos using patchwork beyond OE-core and meta-opeme=
bedded
>>>>>> please enable it for all of them  as well.
>>>>>>
>>>>>
>>>>> Now all of the projects are enabled to receive automatic updates fr=
om
>>>>> the git-hook (Thanks Michael). Please let me know if any undesired
>>>>> behavior is detected.
>>>>
>>>> Still doesn't mark anything as accepted:
>>>>
>>>> OE @ ~/meta-openembedded $ git push origin master
>>>> Counting objects: 293, done.
>>>> Delta compression using up to 8 threads.
>>>> Compressing objects: 100% (257/257), done.
>>>> Writing objects: 100% (293/293), 48.83 KiB | 0 bytes/s, done.
>>>> Total 293 (delta 179), reused 68 (delta 18)
>>>> remote: E: failed to find patch for rev efd3696e70a6603f1a45faa4a172=
433514f0a487.
>>>> remote: E: failed to find patch for rev 8c720146b718aae3bc194621f3e0=
95cf11ecb2ed.
>>>> remote: E: failed to find patch for rev fc2fc9097b2fa437d4af0338e418=
692b4dd6c989.
>>>> remote: E: failed to find patch for rev 533826b7652a2cf86ca7b665c25b=
98c89afc266e.
>>>> remote: E: failed to find patch for rev 6afb85d29286aaa4cdd892460f6a=
df68912917a5.
>>>> remote: E: failed to find patch for rev a7f3ec87f957ff35b8a853cd0e04=
c6b18bac0ece.
>>>> remote: E: failed to find patch for rev 877e52fd75c7d3b88add94691df3=
beb5e0c54529.
>>>> remote: E: failed to find patch for rev 2f6e45baba961629bfe023599144=
be6cfcd45728.
>>>> remote: E: failed to find patch for rev 86fed80d80bc33f0a3cdbf719c00=
ee5f05ed4d19.
>>>> remote: E: failed to find patch for rev 41d7bac5d50091cab835eac0a5ea=
a6c431fb2023.
>>>> remote: E: failed to find patch for rev a85e12928131fce057f777daa76a=
7f0c75cffa14.
>>>> remote: E: failed to find patch for rev 45837e6c567b1b9ff9d152a7e2a7=
52488d313455.
>>>> remote: E: failed to find patch for rev 119e75e48dbf0539b4e440417901=
458ffff79b38.
>>>> remote: E: failed to find patch for rev a4251575f41fa5aafe5072e56249=
7b05c11b6702.
>>>> remote: E: failed to find patch for rev b6ea2c0bacb21b83bae3605ef4da=
080de0cad15e.
>>>> remote: E: failed to find patch for rev 4580e5ae201b320ed407eae26f58=
655b8768b387.
>>>> remote: E: failed to find patch for rev c476219e845934f767927e81fe60=
dbaa157df9ee.
>>>> remote: E: failed to find patch for rev 0288b204f3c12af1561218fa0cfc=
dfb9a5508b47.
>>>> remote: E: failed to find patch for rev 5596b52d64c30d8e66ec6e379cf6=
9a9fc9407fb1.
>>>> remote: E: failed to find patch for rev 24e51a6a106bc10a8838b23e4bf9=
ea6304314bca.
>>>> remote: E: failed to find patch for rev aac6bf8bf911c3f14ff9dce08f0f=
011838f5a426.
>>>> remote: I: 0 patch(es) updated to state Accepted.
>>>> remote: Sending notification emails to: openembedded-commits@lists.o=
penembedded.org.
>>>> To git.openembedded.org:meta-openembedded
>>>>    761639b..aac6bf8  master -> master
>>>
>>> I don't know how far apart the freedesktop.org one is from ozlabs but=

>>> when I was seeing that problem locally as part of what I was working =
on
>>> it was because of some missing host deps (that are now not required).=

>>> FWIW you can pretty easily turn the hook into a script to run manuall=
y
>>> and sh -x it to see _why_ it's not hashing out those patches.
>>>
> Now all of the patchwork projects/repositories are using the
> asynchronous githook that was previously only used by oe-core. This hoo=
k
> version features some response time improvements (maintainers will
> regain control of their machines sooner) but mainly it should solve the=

> automatic updating issue. We are waiting for pushes to confirm.

This task is being tracked in
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10762

the change was implemented on Dec 13, so git pushes from this day
onwards should trigger the state update in patchwork.
>>
>>
>>
>=20
>=20
>=20

--=20
Jose Lamego | OTC Embedded Platforms & Tools | GDC


--C3aqtfVC3DmCmlpgS2mPoMi55Jl6OBfuR--

--hPq6osurubcn4bthtxM0fScP8nrx9AgV9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJYUbNYAAoJEFJAtowlSEbnIVYH/37VW2xhkr1bIyzL+p64SZMN
oXErXKAeGAjLuk3StzB1dD9MlKmOjfFctmkefb0tfZDxNmoBvhyN6N7QvgV8+lEt
dTwkITx9JRoD06fPlvduhnYe5ddoPcPzoZbGyNliKIYYsR2UsejR+9hHBiE2dshX
08OjWWC3MvG4fDWMvuKt9cpTLxEwaIwJvUqrpKW7HInT/xuEdV5dnG/2CrFNT1si
WBUgIcANjJJrH8HdV0UuW/wZPQAosQvlOWL1OfaBoxtV9SEiP+RQltWc9Je2lzUS
OCeAQmbPwjsAKMhnnhp/cxVRabt12Z11WvXDdVcjfIMIbkOiGySjDJlF8pjq/Y0=
=yDzg
-----END PGP SIGNATURE-----

--hPq6osurubcn4bthtxM0fScP8nrx9AgV9--
