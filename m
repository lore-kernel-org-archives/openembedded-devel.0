Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 332AD77F69
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jun 2017 14:02:38 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Jun 2017 07:02:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,300,1493708400"; 
	d="asc'?scan'208";a="1178468995"
Received: from jalamego-mobl2.zpn.intel.com (HELO [10.219.128.138])
	([10.219.128.138])
	by fmsmga002.fm.intel.com with ESMTP; 05 Jun 2017 07:02:24 -0700
To: openembedded-devel@lists.openembedded.org
References: <20170518020701.2773-1-Randy.MacLeod@windriver.com>
	<2c4c974d-6831-f5c3-bf9a-a9c801192ccb@windriver.com>
	<545cc9b3-26f9-1a41-1f84-fb6d74a8d097@windriver.com>
	<CA+chaQcxby9yBFVvRqG5ho5RkJyRDre5_Y74+TBF-1PKDn_hkA@mail.gmail.com>
From: Jose Lamego <jose.a.lamego@linux.intel.com>
Message-ID: <f9a29bf1-9b75-85ae-82df-6c7aaaf4b04e@linux.intel.com>
Date: Mon, 5 Jun 2017 09:02:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQcxby9yBFVvRqG5ho5RkJyRDre5_Y74+TBF-1PKDn_hkA@mail.gmail.com>
Subject: Re: [meta-oe][V2 patch] rrdtool: allow configuration to disable nls
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
X-List-Received-Date: Mon, 05 Jun 2017 14:02:40 -0000
X-Groupsio-MsgNum: 67033
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="M4LW0wFXIUPuFpcxTEc8dD3pFh3XvSag7"

--M4LW0wFXIUPuFpcxTEc8dD3pFh3XvSag7
Content-Type: multipart/mixed; boundary="23fT9fVG6Cp4iT8cDXP5LlIGNruvHwQLb";
 protected-headers="v1"
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <f9a29bf1-9b75-85ae-82df-6c7aaaf4b04e@linux.intel.com>
Subject: Re: [oe] [meta-oe][V2 patch] rrdtool: allow configuration to disable
 nls
References: <20170518020701.2773-1-Randy.MacLeod@windriver.com>
 <2c4c974d-6831-f5c3-bf9a-a9c801192ccb@windriver.com>
 <545cc9b3-26f9-1a41-1f84-fb6d74a8d097@windriver.com>
 <CA+chaQcxby9yBFVvRqG5ho5RkJyRDre5_Y74+TBF-1PKDn_hkA@mail.gmail.com>
In-Reply-To: <CA+chaQcxby9yBFVvRqG5ho5RkJyRDre5_Y74+TBF-1PKDn_hkA@mail.gmail.com>

--23fT9fVG6Cp4iT8cDXP5LlIGNruvHwQLb
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 06/05/2017 06:14 AM, Martin Jansa wrote:
> This v2 didn't make it to patchwork and it was too late when I've notic=
ed
> it and found this e-mail.
>=20
> So I've merged v1 to master and immediately reverted it.
>=20
> Resend v2 again, this time patchwork might do its job.

Randy, to ensure patchwork to identify your patch as such, please use
the appropriate prefix (you may use --subject-prefix=3D"meta-oe][PATCH v2=
"
when creating your patch) as described in

  http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

optionally, you can also include

  --in-reply-to=3D20170518020701.2773-1-Randy.MacLeod@windriver.com

which adds your first patch's message id as reference in patch v2,
ensuring patchwork to display it as revision 2 of the series. This is
only required in cases where the patch name changes between revisions to
keep thread continuity.

Regards

>=20
> On Mon, May 29, 2017 at 3:14 AM, Randy MacLeod <randy.macleod@windriver=
=2Ecom>
> wrote:
>=20
>> On 2017-05-28 09:12 PM, Randy MacLeod wrote:
>>
>>>
>>> Martin,
>>>
>>> You've merged v1:
>>>     [oe] [meta-oe][PATCH] rrdtool: add gettext-native dependency
>>>
>>
>> err I mean, you've merged v1 to master-next to be clear.
>> ../Randy
>>
>>
>> Could you drop that for this fix since it's a somewhat better approach=
=2E
>>>
>>> ../Randy
>>>
>>> On 2017-05-17 10:07 PM, Randy MacLeod wrote:
>>>
>>>> When building rrdtool for a 'tiny' distro, that does not have native=

>>>> language support (NLS) in glibc, configure fails with the error:
>>>>     autoreconf: failed to run autopoint: No such file or directory
>>>> Autopoint is part of gettext but without NLS support we populate the=

>>>> sysroot with gettext-minimal-native rather then the full set of
>>>> gettext executables. This version does not install autopoint, nor
>>>> should it.
>>>>
>>>> Tell autoreconf to skip the check for the autopoint script
>>>> regardless of NLS support and use the USE_NLS varible
>>>> to conditionally enable NLS support.
>>>>
>>>> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>>>> ---
>>>>   meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb | 3 ++-
>>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb
>>>> b/meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb
>>>> index db2df28a0..3ccefb995 100644
>>>> --- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb
>>>> +++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb
>>>> @@ -22,7 +22,7 @@ BBCLASSEXTEND =3D "native"
>>>>   SYSTEMD_PACKAGES =3D "rrdcached"
>>>>   SYSTEMD_SERVICE_rrdcached =3D "rrdcached.socket rrdcached.service"=

>>>> -EXTRA_AUTORECONF =3D "-I m4"
>>>> +EXTRA_AUTORECONF =3D "-I m4 --exclude=3Dautopoint"
>>>>   PACKAGECONFIG ??=3D "python perl ${@bb.utils.filter('DISTRO_FEATUR=
ES',
>>>> 'systemd', d)}"
>>>> @@ -49,6 +49,7 @@ EXTRA_OECONF =3D " \
>>>>       --disable-lua \
>>>>       --disable-tcl \
>>>>       --disable-rpath \
>>>> +    --enable-nls=3D${USE_NLS} \
>>>>   "
>>>>   export STAGING_LIBDIR
>>>>
>>>>
>>>
>>>
>>
>> --
>> # Randy MacLeod. SMTS, Linux, Wind River
>> Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON,
>> Canada, K2K 2W5
>>

--=20
Jose Lamego | OTC Embedded Platforms & Tools | GDC


--23fT9fVG6Cp4iT8cDXP5LlIGNruvHwQLb--

--M4LW0wFXIUPuFpcxTEc8dD3pFh3XvSag7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJZNWR7AAoJEFJAtowlSEbnyIoH/Aopp3FYJ0fKKb0lppR1ygXC
Vmtn6r/eePH9bYIJI/peZi3N37WRBKDkLnSrgYHpLOuC3qpGMR1nrfncwyBbYeLX
NmugblEa08b+0nDQdJuoDOdF6ybjJhHnKlGMy+t2qS5p0zosY6SB5zmt5/VDtW+K
bTsiHi78N8PbMup62IkKrk5yp+QoKOR3/JOIAt3wUPY0Z4QtEhr+h9EK0jdyuF5h
D1TlY5dm3ypor7+2lWllG+ziujXY71VUrrdIm5Nd1FN2+TT2OYDVxA8MgKKPyhPR
Wp+ZkNbinTToQHAUZlghiHACPT1/EIsSJC5GMovYuNthoFToCSsMCxr+baZg25Q=
=dGA5
-----END PGP SIGNATURE-----

--M4LW0wFXIUPuFpcxTEc8dD3pFh3XvSag7--
