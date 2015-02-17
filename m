Return-Path: <Daniel.MONDON@lpgsystems.com>
Received: from antispam.lpg.priv (mail.lpgsystems.com [46.18.228.1])
	by mail.openembedded.org (Postfix) with ESMTP id 8D70665C85
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2015 13:03:48 +0000 (UTC)
Received: from SEXCHANGE0100.lpg.priv (unknown [10.1.1.25])
	by antispam.lpg.priv (mail.lpgsystems.com) with ESMTP id 931A31A7399
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2015 14:03:48 +0100 (CET)
Received: from SEXCHANGE0100.lpg.priv ([::1]) by SEXCHANGE0100.lpg.priv
	([::1]) with mapi id 14.03.0224.002; Tue, 17 Feb 2015 14:03:48 +0100
From: MONDON Daniel <Daniel.MONDON@lpgsystems.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] package icedtea6-native-1.8.11-r5.3: task do_compile: Failed
Thread-Index: AQHQR5gFwt00XHhMS0mBcZDB7GWe7Zz0w3KAgAARaZA=
Date: Tue, 17 Feb 2015 13:03:48 +0000
Message-ID: <F48900D76F0D8349918584FEEFEB4BCA062A02C5@SEXCHANGE0100.lpg.priv>
References: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
	<1423810919-9857-19-git-send-email-schnitzeltony@googlemail.com>
	<F48900D76F0D8349918584FEEFEB4BCA0629F403@SEXCHANGE0100.lpg.priv>
	<20150213094951.GA14290@mail.itconsulting-heinold.de>
	<F48900D76F0D8349918584FEEFEB4BCA0629F481@SEXCHANGE0100.lpg.priv>
	<1423823635.2285.5.camel@Saturn.local.all>
	<20150213142036.GC7116@saldanha.aker.com.br>
	<CAP9ODKopq=3zswceRwSDisfaS1WXiJBg8-MT+8rARQ_ncu3QZQ@mail.gmail.com>
In-Reply-To: <CAP9ODKopq=3zswceRwSDisfaS1WXiJBg8-MT+8rARQ_ncu3QZQ@mail.gmail.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.5.31]
MIME-Version: 1.0
X-DRWEB-SCAN: ok
X-VRSPAM-SCORE: 0
X-VRSPAM-STATE: legit
X-VRSPAM-CAUSE: gggruggvucftvghtrhhoucdtuddrfeejkedrleeigdegvdcutefuodetggdotefrucfrrhhofhhilhgvmecuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvffuthffkfhfjghitgfgggesthhqtddttddtudenucfhrhhomhepoffqpfffqffpucffrghnihgvlhcuoeffrghnihgvlhdroffqpfffqffpsehlphhgshihshhtvghmshdrtghomheqnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpohhsshihshhtvghmshdrtghomhdrsghrpdihohgtthhophhrohhjvggtthdrohhrgh
X-VRSPAM-EXTCAUSE: mhhouggvpehsmhhtphhouhht
Subject: Re: package icedtea6-native-1.8.11-r5.3: task do_compile:	Failed
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
X-List-Received-Date: Tue, 17 Feb 2015 13:03:51 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

In may case, it is icedtea6-native (for java 6)
:)

Thanks
Daniel.

-----Message d'origine-----
De=A0: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedd=
ed-devel-bounces@lists.openembedded.org] De la part de Otavio Salvador
Envoy=E9=A0: mardi 17 f=E9vrier 2015 14:00
=C0=A0: OpenEmbedded Devel List
Objet=A0: Re: [oe] package icedtea6-native-1.8.11-r5.3: task do_compile: Fa=
iled

On Fri, Feb 13, 2015 at 12:20 PM, Hugo Vasconcelos Saldanha <hugo.saldanha@=
aker.com.br> wrote:
> On Fri, Feb 13, 2015 at 08:33:55AM -0200, Max Krummenacher wrote:
>> Am Freitag, den 13.02.2015, 10:08 +0000 schrieb MONDON Daniel:
>> > Ok, but my problem is I must not change distribution.
>> > The system is installed on many machines, and moving to and other repo=
 will generate too many work (dev and validation)!
>> In order to fix an error you will have to change something.
>>
>> > I have not enough time to pass on this problem : It was so complicated=
 to build, install and configure Java on angstromv2012.05 environment!
>> >
>> > Is it because Ubuntu 12.04 java was updated ?
>> No.
>>
>> The error you see is because some sources test if now is more than 10 ye=
ars from 2015 and refuse to compile (and maybe execute later?) if this is t=
he case.
>>
>> This is fixed in meta-java, but as Henning said you have to get the=20
>> meta-java layer from git://git.yoctoproject.org/meta-java and update=20
>> to HEAD.
>
> It seems that icedtea7-native was not fixed.

Patches are welcome :-)

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

