Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 45A7273204
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Dec 2016 20:27:35 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 14 Dec 2016 12:27:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,348,1477983600"; 
	d="asc'?scan'208";a="202642268"
Received: from jalamego-mobl2.zpn.intel.com (HELO [10.219.5.137])
	([10.219.5.137])
	by fmsmga004.fm.intel.com with ESMTP; 14 Dec 2016 12:27:36 -0800
Reply-To: openembedded-devel@lists.openembedded.org
References: <4717571.f7GXZOAcRz@peggleto-mobl.ger.corp.intel.com>
	<20161129204327.GG2546@bill-the-cat>
	<d93f4841-0154-2232-1802-2b8fcc85a81c@linux.intel.com>
	<19E9BF3F-664F-42A4-A170-5B7BB473ED80@gmail.com>
	<53ca2ead-1b75-ff6d-30c1-abb16330bad3@linux.intel.com>
	<20161202083009.GB3721@jama> <20161202122923.GI2546@bill-the-cat>
	<3a262190-a720-7901-5ab0-8023ecf2521f@linux.intel.com>
To: openembedded-devel@lists.openembedded.org,
	Martin Jansa <martin.jansa@gmail.com>
From: Jose Lamego <jose.a.lamego@linux.intel.com>
Message-ID: <2f3da309-df26-78e8-0d5b-d62f71b529cd@linux.intel.com>
Date: Wed, 14 Dec 2016 14:27:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <3a262190-a720-7901-5ab0-8023ecf2521f@linux.intel.com>
Cc: Patrick Ohly <patrick.ohly@intel.com>,
	Michael Halstead <michael@yoctoproject.org>
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
X-List-Received-Date: Wed, 14 Dec 2016 20:27:36 -0000
X-Groupsio-MsgNum: 64319
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="GXO7nWgu5GTJesWMMSq9QcG2htvmO9eFa"

--GXO7nWgu5GTJesWMMSq9QcG2htvmO9eFa
Content-Type: multipart/mixed; boundary="6swn80pTSrPr5LhQio8uRXAFbV2d18fjo";
 protected-headers="v1"
From: Jose Lamego <jose.a.lamego@linux.intel.com>
Reply-To: openembedded-devel@lists.openembedded.org
To: openembedded-devel@lists.openembedded.org,
 Martin Jansa <martin.jansa@gmail.com>
Cc: Patrick Ohly <patrick.ohly@intel.com>,
 Michael Halstead <michael@yoctoproject.org>
Message-ID: <2f3da309-df26-78e8-0d5b-d62f71b529cd@linux.intel.com>
Subject: Re: [oe] meta-openembedded patchwork git hook
References: <4717571.f7GXZOAcRz@peggleto-mobl.ger.corp.intel.com>
 <20161129204327.GG2546@bill-the-cat>
 <d93f4841-0154-2232-1802-2b8fcc85a81c@linux.intel.com>
 <19E9BF3F-664F-42A4-A170-5B7BB473ED80@gmail.com>
 <53ca2ead-1b75-ff6d-30c1-abb16330bad3@linux.intel.com>
 <20161202083009.GB3721@jama> <20161202122923.GI2546@bill-the-cat>
 <3a262190-a720-7901-5ab0-8023ecf2521f@linux.intel.com>
In-Reply-To: <3a262190-a720-7901-5ab0-8023ecf2521f@linux.intel.com>

--6swn80pTSrPr5LhQio8uRXAFbV2d18fjo
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 12/02/2016 09:45 AM, Jose Lamego wrote:
> I'm looking into this right now. I've filed a bug for tracking:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10759
>=20
>=20
> On 12/02/2016 06:29 AM, Tom Rini wrote:
>> On Fri, Dec 02, 2016 at 09:30:09AM +0100, Martin Jansa wrote:
>>> On Wed, Nov 30, 2016 at 12:41:20PM -0600, Jose Lamego wrote:
>>>>
>>>>
>>>> On 11/29/2016 07:50 PM, Khem Raj wrote:
>>>>>
>>>>>> On Nov 29, 2016, at 2:34 PM, Jose Lamego <jose.a.lamego@linux.inte=
l.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 11/29/2016 02:43 PM, Tom Rini wrote:
>>>>>>> On Wed, Nov 30, 2016 at 06:52:46AM +1300, Paul Eggleton wrote:
>>>>>>>
>>>>>>>> Hi folks,
>>>>>>>>
>>>>>>>> Martin just brought to my attention that the git hook for the=20
>>>>>>>> meta-openembedded repository that's supposed to update patchwork=
 still isn't=20
>>>>>>>> working and hasn't done so for a very long time. I thought we'd =
fixed this so=20
>>>>>>>> that merged patches get marked as "Accepted", but at least for m=
eta-
>>>>>>>> openembedded it seems like that's not the case.
>>>>>>>>
>>>>>>>> Jose / Michael - can you look into this if you haven't already? =
Please let me=20
>>>>>>>> know if you need any help.
>>>>>>
>>>>>> The git hook was configured to update OE-core only, Michael will h=
elp us
>>>>>> to include meta-openembedded.
>>>>>>
>>>>>
>>>>> There are more repos using patchwork beyond OE-core and meta-opemeb=
edded
>>>>> please enable it for all of them  as well.
>>>>>
>>>>
>>>> Now all of the projects are enabled to receive automatic updates fro=
m
>>>> the git-hook (Thanks Michael). Please let me know if any undesired
>>>> behavior is detected.
>>>
>>> Still doesn't mark anything as accepted:
>>>
>>> OE @ ~/meta-openembedded $ git push origin master
>>> Counting objects: 293, done.
>>> Delta compression using up to 8 threads.
>>> Compressing objects: 100% (257/257), done.
>>> Writing objects: 100% (293/293), 48.83 KiB | 0 bytes/s, done.
>>> Total 293 (delta 179), reused 68 (delta 18)
>>> remote: E: failed to find patch for rev efd3696e70a6603f1a45faa4a1724=
33514f0a487.
>>> remote: E: failed to find patch for rev 8c720146b718aae3bc194621f3e09=
5cf11ecb2ed.
>>> remote: E: failed to find patch for rev fc2fc9097b2fa437d4af0338e4186=
92b4dd6c989.
>>> remote: E: failed to find patch for rev 533826b7652a2cf86ca7b665c25b9=
8c89afc266e.
>>> remote: E: failed to find patch for rev 6afb85d29286aaa4cdd892460f6ad=
f68912917a5.
>>> remote: E: failed to find patch for rev a7f3ec87f957ff35b8a853cd0e04c=
6b18bac0ece.
>>> remote: E: failed to find patch for rev 877e52fd75c7d3b88add94691df3b=
eb5e0c54529.
>>> remote: E: failed to find patch for rev 2f6e45baba961629bfe023599144b=
e6cfcd45728.
>>> remote: E: failed to find patch for rev 86fed80d80bc33f0a3cdbf719c00e=
e5f05ed4d19.
>>> remote: E: failed to find patch for rev 41d7bac5d50091cab835eac0a5eaa=
6c431fb2023.
>>> remote: E: failed to find patch for rev a85e12928131fce057f777daa76a7=
f0c75cffa14.
>>> remote: E: failed to find patch for rev 45837e6c567b1b9ff9d152a7e2a75=
2488d313455.
>>> remote: E: failed to find patch for rev 119e75e48dbf0539b4e4404179014=
58ffff79b38.
>>> remote: E: failed to find patch for rev a4251575f41fa5aafe5072e562497=
b05c11b6702.
>>> remote: E: failed to find patch for rev b6ea2c0bacb21b83bae3605ef4da0=
80de0cad15e.
>>> remote: E: failed to find patch for rev 4580e5ae201b320ed407eae26f586=
55b8768b387.
>>> remote: E: failed to find patch for rev c476219e845934f767927e81fe60d=
baa157df9ee.
>>> remote: E: failed to find patch for rev 0288b204f3c12af1561218fa0cfcd=
fb9a5508b47.
>>> remote: E: failed to find patch for rev 5596b52d64c30d8e66ec6e379cf69=
a9fc9407fb1.
>>> remote: E: failed to find patch for rev 24e51a6a106bc10a8838b23e4bf9e=
a6304314bca.
>>> remote: E: failed to find patch for rev aac6bf8bf911c3f14ff9dce08f0f0=
11838f5a426.
>>> remote: I: 0 patch(es) updated to state Accepted.
>>> remote: Sending notification emails to: openembedded-commits@lists.op=
enembedded.org.
>>> To git.openembedded.org:meta-openembedded
>>>    761639b..aac6bf8  master -> master
>>
>> I don't know how far apart the freedesktop.org one is from ozlabs but
>> when I was seeing that problem locally as part of what I was working o=
n
>> it was because of some missing host deps (that are now not required).
>> FWIW you can pretty easily turn the hook into a script to run manually=

>> and sh -x it to see _why_ it's not hashing out those patches.
>>
Now all of the patchwork projects/repositories are using the
asynchronous githook that was previously only used by oe-core. This hook
version features some response time improvements (maintainers will
regain control of their machines sooner) but mainly it should solve the
automatic updating issue. We are waiting for pushes to confirm.
>=20
>=20
>=20

--=20
Jose Lamego | OTC Embedded Platforms & Tools | GDC


--6swn80pTSrPr5LhQio8uRXAFbV2d18fjo--

--GXO7nWgu5GTJesWMMSq9QcG2htvmO9eFa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJYUas/AAoJEFJAtowlSEbnMy0H+wY/uKuHra5FaoGNXxC/pjfv
rxyPoXXQUWNMVqhMZxbye8ZvwWJg74KE7/1dCJ/MoA51aaRBk8UvP8QK0gmBVjNY
3ujwMzFNg4Zm9WN5tqC0sdba2y2inhHeKVvXlAjdD3iyeRDcG//4A2pqx/4Y+cAV
k1Eo+cWAF1oy0q4F7kfspxrBA04VMq6AgHSp930VWJmEG1TllrpaCjEU+mMSjoyc
O4Anenl9iWzQ/x7+g5erz0fjsUb9lMcyAU+Ek91kHpb/vUtHsaT8x0ouGh4J5nhO
7aF7d7PbM6160IKzj+J0lU9IQ838NxEg0TQeIyime1IcNch5HE9f6XQtcdzx8qE=
=Y5x5
-----END PGP SIGNATURE-----

--GXO7nWgu5GTJesWMMSq9QcG2htvmO9eFa--
