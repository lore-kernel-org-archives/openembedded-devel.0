Return-Path: <philip@balister.org>
X-Greylist: delayed 400 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 07 May 2014 18:39:20 UTC
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id E8638601A2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 18:39:20 +0000 (UTC)
Received: (qmail 848 invoked by uid 1003); 7 May 2014 18:32:41 -0000
Received: from unknown (HELO ?10.16.32.157?)
	(philip@opensdr.com@64.186.172.226)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	7 May 2014 18:32:40 -0000
Message-ID: <536A7C42.6030502@balister.org>
Date: Wed, 07 May 2014 11:32:34 -0700
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Adam Lee <adam.yh.lee@gmail.com>
References: <20140430143741.GL2486@jama>	<CAFeBWL5HuWex48xB_JZX_C7RMhzgfH93=AVJAkO7Qk7DUToFxg@mail.gmail.com>
	<20140505164514.GM2486@jama>
In-Reply-To: <20140505164514.GM2486@jama>
X-Enigmail-Version: 1.6
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: daisy branch for meta-openembedded, meta-qt5 / maintainer wanted
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
X-List-Received-Date: Wed, 07 May 2014 18:39:24 -0000
X-Groupsio-MsgNum: 49784
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="1Aj9JUNSlr1Cf26XbqOFGoBqaRkNdcjvj"

--1Aj9JUNSlr1Cf26XbqOFGoBqaRkNdcjvj
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 05/05/2014 09:45 AM, Martin Jansa wrote:
> On Mon, May 05, 2014 at 09:32:04AM -0700, Adam Lee wrote:
>> Hi JaMa, what does it take to be a maintainer?
>>
>> Do I need to build check all the packages everyday?
>=20
> Definitely no everyday, there are more patches coming in just after the=

> release, but later it's something like 1-5 patches in month.
>=20
> So it doesn't need much time, but it's always good when it's done by
> someone else then master maintainer (to setup separate builds etc).
>=20
> Possibly more time is spent on watching the ML, because many people
> don't read README file and instead of following the proper procedure fo=
r
> backports to relase branches they just say somewhere in ML "BTW: also
> merge this to dora".
>=20
> You can also have some co-maintainer if you find way to split the work
> without duplicating it.

Adam,

I'd be glad to help scan the list for backport requests.

Philip

>=20
> I'm fine with scheme where maintainer sends me consolidated pull-reques=
t
> and I'll merge it for him to actual branch (so that he doesn't even nee=
d
> R/W to main repo).
>=20
> BTW: If you don't mind, then I'll forward this to oe-devel as well for
> other possible volunteers.
>=20
> Cheers,
>=20
>> Please let me know!
>>
>> Adam
>>
>> On Wed, Apr 30, 2014 at 7:37 AM, Martin Jansa <martin.jansa@gmail.com>=
 wrote:
>>> Hi,
>>>
>>> few people asked me when there will be daisy branch in meta-openembed=
ded
>>> repository.
>>>
>>> My current plan is at the end of next week.
>>>
>>> There are some pending fixes I need to finish testing (please review,=

>>> test and reply on them).
>>>
>>> I was hoping for few more fixes for
>>> http://lists.openembedded.org/pipermail/openembedded-devel/2014-March=
/094893.html
>>>
>>> and especially for incorrect dependencies:
>>> http://lists.openembedded.org/pipermail/openembedded-devel/2014-April=
/095268.html
>>> http://lists.openembedded.org/pipermail/openembedded-devel/2014-April=
/095464.html
>>>
>>> There is only one change on ML which really cannot go to daisy branch=

>>> (http://patchwork.openembedded.org/patch/71107/), the B!=3DS fixes ar=
e on
>>> edge, but they shouldn't harm to be in daisy.
>>>
>>> I hope to get few more fixes from OEDAM and then I'll run final build=

>>> test on jenkins (3days, possibly needed twice).
>>>
>>> If you want to maintain daisy release in meta-oe, reply in this threa=
d
>>> and send patch to update README files.
>>>
>>> Regards,
>>> --
>>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>=20
>=20
>=20


--1Aj9JUNSlr1Cf26XbqOFGoBqaRkNdcjvj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBAgAGBQJTanxGAAoJEMDJd4rr0mer34cIAMI7ExhD3uKZvM72Qq8xDOYe
S9hXRoBDGV2hTpbOEtcnVtLwg7Vy9QsbDR6XuSPndj5duTYIXrlHwUu4IgjnothZ
jsetdQXoWdGzCTQfDyEVZfz3jmC5kBwKg2qSz4qgiJfuXouGFlvUQkCnq/nmdRqA
Qu5N2jPJfwSsc5MVeVJA2I2G/e1NMhdK8YcYqw5Xb0PXAI64oBZkvp8OwuqhnqH8
LixbVhKLOnILpVJj2Pgud1sipj/weVhEYadu/plaX3IaJAbinJENTObO0L7ifLOF
ij/3ylPUgzb80ls4w8K7KQfQP4icOxNRtb1jICQaMeTJ5Xq2/6B5jevDCURDqlU=
=Bszb
-----END PGP SIGNATURE-----

--1Aj9JUNSlr1Cf26XbqOFGoBqaRkNdcjvj--
