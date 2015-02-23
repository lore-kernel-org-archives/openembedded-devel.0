Return-Path: <Daniel.MONDON@lpgsystems.com>
Received: from antispam.lpg.priv (mail.lpgsystems.com [46.18.228.1])
	by mail.openembedded.org (Postfix) with ESMTP id 05FD4706B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Feb 2015 10:49:05 +0000 (UTC)
Received: from SEXCHANGE0100.lpg.priv (unknown [10.1.1.25])
	by antispam.lpg.priv (mail.lpgsystems.com) with ESMTP id 30A521A7390
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Feb 2015 11:49:05 +0100 (CET)
Received: from SEXCHANGE0100.lpg.priv ([::1]) by SEXCHANGE0100.lpg.priv
	([::1]) with mapi id 14.03.0224.002; Mon, 23 Feb 2015 11:49:05 +0100
From: MONDON Daniel <Daniel.MONDON@lpgsystems.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] package icedtea6-native-1.8.11-r5.3: task do_compile:
	Failed : solved!
Thread-Index: AQHQT1ZX8lf9sNQcdEKInyhnj88XGg==
Date: Mon, 23 Feb 2015 10:49:04 +0000
Message-ID: <F48900D76F0D8349918584FEEFEB4BCA062A1370@SEXCHANGE0100.lpg.priv>
References: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
	<1423810919-9857-19-git-send-email-schnitzeltony@googlemail.com>
	<F48900D76F0D8349918584FEEFEB4BCA0629F403@SEXCHANGE0100.lpg.priv>
	<20150213094951.GA14290@mail.itconsulting-heinold.de>
	<F48900D76F0D8349918584FEEFEB4BCA0629F481@SEXCHANGE0100.lpg.priv>
	<1423823635.2285.5.camel@Saturn.local.all>
	<F48900D76F0D8349918584FEEFEB4BCA062A05E9@SEXCHANGE0100.lpg.priv>
	<20150218145609.GD23103@mail.itconsulting-heinold.de>
In-Reply-To: <20150218145609.GD23103@mail.itconsulting-heinold.de>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.5.31]
MIME-Version: 1.0
X-DRWEB-SCAN: ok
X-VRSPAM-SCORE: 0
X-VRSPAM-STATE: legit
X-VRSPAM-CAUSE: gggruggvucftvghtrhhoucdtuddrfeejledrudekgddvudcutefuodetggdotefrucfrrhhofhhilhgvmecuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvffuthffkfhfjghitgfgggesthhqtddttddtudenucfhrhhomhepoffqpfffqffpucffrghnihgvlhcuoeffrghnihgvlhdroffqpfffqffpsehlphhgshihshhtvghmshdrtghomheqnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdphihotghothhophhrohhjvggtthdrohhrghdpohhpvghnvghmsggvugguvggurdhorhhg
X-VRSPAM-EXTCAUSE: mhhouggvpehsmhhtphhouhht
Subject: Re: package icedtea6-native-1.8.11-r5.3: task do_compile:	Failed : solved!
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
X-List-Received-Date: Mon, 23 Feb 2015 10:49:09 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Both cases are running!
:)

- Changing date allow to go to the end of generation (if time is not update=
d during compilation).

- Icedtea6 and openjdk6 patched with today date=20

Thanks
Regards
Daniel.

-----Message d'origine-----
De=A0: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedd=
ed-devel-bounces@lists.openembedded.org] De la part de Henning Heinold
Envoy=E9=A0: mercredi 18 f=E9vrier 2015 15:56
=C0=A0: openembedded-devel@lists.openembedded.org
Objet=A0: Re: [oe] package icedtea6-native-1.8.11-r5.3: task do_compile: Fa=
iled

On Wed, Feb 18, 2015 at 02:14:10PM +0000, MONDON Daniel wrote:
> Hi,
>=20
> I've got same problem compiling my old openembedded Angstromv2012.05 with=
 changing server date.
> Not on icedtea6-native-1.8.11, but openjdk-6-native.
> I'm checking actually for a date change solution : full compilation is st=
ill running (restarted from scratch : more than 12h)
>=20
>=20
> Checking the new git://git.yoctoproject.org/meta-java as said Henning !
> Impossible to move to dependencies due to distribution customisation (too=
 many work and no success guaranty!).
>=20
>=20
> Can't I just have a patch, or simply changing sources where this test is =
done (changing test or dates values) ?
>=20
> Thanks,
> Daniel.
>=20

git.yocotoproject.org has web frontend so have a look at

http://git.yoctoproject.org/cgit/cgit.cgi/meta-java/commit/?id=3D58c5f41799=
bec30a5576137d5477e8ba14a0a802

Bye Henning
--=20
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

