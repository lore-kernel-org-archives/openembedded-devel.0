Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@rkmorris.us>) id 1QvG6Q-0000O3-0r
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Aug 2011 00:02:46 +0200
Received: from server ([unknown] [173.74.34.213]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LQA00JFCT0CQW00@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sun,
	21 Aug 2011 16:57:51 -0500 (CDT)
Received: from server (127.0.0.1) by server (Axigen)
	with ESMTPSA id 18602C; Sun, 21 Aug 2011 16:57:45 -0500
Received: from [192.168.254.252] by rkmorris.us with HTTP; Sun,
	21 Aug 2011 16:57:44 -0500
From: Russell Morris <openembedded@rkmorris.us>
Date: Sun, 21 Aug 2011 16:57:44 -0500
X-Mailer: Axigen WebMail
To: openembedded-devel@lists.openembedded.org
Message-id: <1313963864481038500@rkmorris.us>
In-reply-to: <1312936952840869500@rkmorris.us>
References: <1312858153686306500@rkmorris.us> <4E40AF8B.4080103@gmail.com>
	<1312936952840869500@rkmorris.us>
Importance: Normal
MIME-version: 1.0
X-AxigenVirus-Level: 1
X-AxigenSpam-Level: 1
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: ISO-Codes Build Failing
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
X-List-Received-Date: Sun, 21 Aug 2011 22:02:46 -0000
X-Groupsio-MsgNum: 33750
Content-type: multipart/mixed;
	boundary="===axigen=5304494647412630120572599974113219895573=axigen==="

--===axigen=5304494647412630120572599974113219895573=axigen===
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

Sorry, I still can't figure out the new structure (and there doesn't seem t=
o be any info on the website / Wiki of how to use the new structure), but a=
t least here's the recipe I used with "old" OE (attached) - and it seems to=
 work.

If someone could add this to the new structure it will hopefully help folks=
 out.

Thanks
... Russell


On Tue, 08/09/2011 07:42 PM, Russell Morris <openembedded@rkmorris.us> wrot=
e:
> Hi,
> I'd be more than happy to - but I admit, I'm a bit lost in meta-openembed=
ded. I'm working off OpenEmbedded ... and don't understand the new meta- it=
ems, and also can't find this recipe there ... :-(.
> Thanks,... Russell
>=20
>=20
> On Mon, 08/08/2011 10:54 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 08/08/2011 07:49 PM, Russell Morris wrote:
> > Hi,
> >=20
> > I have been trying to build angstrom-x-image, but it fails - at
> > iso-codes. The issue may be because Verizon FIOS is now blocking FTP
> > (as more and more ISP's are), but in any case I created a new recipe
> > to correct this (and it works). How do I get this change in to the
> > official OpenEmbedded build (or can I even?)?
> >=20
> > Also ... what is the official OE path? I admit, now with
> > OpenEmbedded, core, etc. - it's getting a bit confusing ... :-(. It
> > really seems like (base?) OpenEmbedded is getting quite out of date,
> > but I could be wrong.
> >=20
>=20
> send patches for meta-openembedded to add the recipe that will make it
> into the new layered metadata based distros.
>=20
>=20
> > On to gs next (which seems to be failing during the do_configure
> > stage).
> >=20
> > Thanks, ... Russell
> >=20
> > _______________________________________________ Openembedded-devel
> > mailing list Openembedded-devel@lists.openembedded.org=20
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
>=20
> - --
> >=20
> - -Khem
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (GNU/Linux)
>=20
> iEYEARECAAYFAk5Ar4sACgkQuwUzVZGdMxQEYgCffYNw/R3mvw8XZQ8NkOxqKKgO
> Nv0An0g0n9S6r/vW/vKG0HrZ5ktvEgQu
> =3DHSTm
> -----END PGP SIGNATURE-----
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 

--===axigen=5304494647412630120572599974113219895573=axigen===
Content-Type: application/octet-stream;
	name="=?utf-8?Q?iso-codes=5F3.27.1.bb?="
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="=?utf-8?Q?iso-codes=5F3.27.1.bb?="

TElDRU5TRSA9ICJMR1BMIgpQQUNLQUdFX0FSQ0ggPSAiYWxsIgpTUkNfVVJJID0gImh0dHA6Ly9m
dHAuZGUuZGViaWFuLm9yZy9kZWJpYW4vcG9vbC9tYWluL2kvaXNvLWNvZGVzL2lzby1jb2Rlc18k
e1BWfS5vcmlnLnRhci5iejIiClBSID0gInIxIgoKaW5oZXJpdCBhdXRvdG9vbHMKCkZJTEVTXyR7
UE59ICs9ICIke2RhdGFkaXJ9L3htbC8iCgpTUkNfVVJJW21kNXN1bV0gPSAiMDZmMGI3YWVkNzll
ZDBmNDEyOWI2N2QxZmVhOWNhZTMiClNSQ19VUklbc2hhMjU2c3VtXSA9ICI4N2U1MGMxMmQwYjYw
OGM1Nzk2YWMyZTI0YTFhMjhjODU3NzkwMTRkZTgwMzczMzAxMGI2MjUzM2YzMDYwZDdiIgo=

--===axigen=5304494647412630120572599974113219895573=axigen===--
