Return-Path: <Daniel.MONDON@lpgsystems.com>
Received: from antispam.lpg.priv (mail.lpgsystems.com [46.18.228.1])
	by mail.openembedded.org (Postfix) with ESMTP id 299746F730
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Mar 2014 14:25:07 +0000 (UTC)
Received: from SEXCHANGE0100.lpg.priv (unknown [10.1.1.25])
	by antispam.lpg.priv (mail.lpgsystems.com) with ESMTP id 3197B3300D6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Mar 2014 15:25:07 +0100 (CET)
Received: from SEXCHANGE0100.lpg.priv ([::1]) by SEXCHANGE0100.lpg.priv
	([::1]) with mapi id 14.03.0174.001; Mon, 17 Mar 2014 15:25:00 +0100
From: MONDON Daniel <Daniel.MONDON@lpgsystems.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] Meta java
Thread-Index: Ac85K1ou8F/UCLIgTuOpKrpmTJ/BpQAAM8KAADf7MaAABOYVAACGPlnQANmebkAAJ16MgABeobCAAAXUYAAABe7jAA==
Date: Mon, 17 Mar 2014 14:24:59 +0000
Message-ID: <F48900D76F0D8349918584FEEFEB4BCA060AF021@SEXCHANGE0100.lpg.priv>
References: <F48900D76F0D8349918584FEEFEB4BCA060AD0D0@SEXCHANGE0100.lpg.priv>
	<20140306120645.GB4680@mail.itconsulting-heinold.de>
	<F48900D76F0D8349918584FEEFEB4BCA060AD4C2@SEXCHANGE0100.lpg.priv>
	<20140307170947.GB25806@mail.itconsulting-heinold.de>
	<F48900D76F0D8349918584FEEFEB4BCA060AD8AC@SEXCHANGE0100.lpg.priv>
	<F48900D76F0D8349918584FEEFEB4BCA060AE963@SEXCHANGE0100.lpg.priv>
	<20140315115207.GA31191@mail.itconsulting-heinold.de>
	<F48900D76F0D8349918584FEEFEB4BCA060AEE84@SEXCHANGE0100.lpg.priv>
	<20140317114838.GA6946@mail.itconsulting-heinold.de>
In-Reply-To: <20140317114838.GA6946@mail.itconsulting-heinold.de>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.5.36]
MIME-Version: 1.0
X-DRWEB-SCAN: ok
X-VRSPAM-SCORE: 0
X-VRSPAM-STATE: legit
X-VRSPAM-CAUSE: gggruggvucftvghtrhhoucdtuddrfeejuddrvdejucetufdoteggodetrfcurfhrohhfihhlvgemuceonhhonhgvqeenuceurghilhhouhhtmecufedttdenuc
Subject: Re: Meta java
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
X-List-Received-Date: Mon, 17 Mar 2014 14:25:08 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>On Mon, Mar 17, 2014 at 08:54:18AM +0000, MONDON Daniel wrote:
>> >The configuration looks good so far. Do you still have the libffi error=
?
>> >What is your hostbuildsystem?
>> >
>> >Bye Henning
>>=20
>> Waiting for 0 running tasks to finish:
>>=20
>> Summary: 1 task failed:
>>  =20
>> virtual:native:/home/Test/Test2/oe-core/meta-java/recipes-core/jamvm/j
>> amvm_git.bb, do_configure
>> Summary: There were 5 WARNING messages shown.
>> Summary: There was 1 ERROR message shown, returning a non-zero exit code=
.
>>=20
>>=20
>>=20
>>=20
>>=20
>> LogFile 28410 joined.
>> I have a look and i see 1.6 configuration ... am i right ?
>>=20
>> Thanks
>> Bye
>> Daniel.
>>=20
>
>I maybe could help you, when you anwser my second question about your buil=
dhost system(Ubuntu fedora homebrew).
>
>All I now see is, that your host gcc is version 4.6 with linaro patches an=
d that this gcc tries to use his own version of pkgconf, instead of the oe-=
build one and than fails to find the libffi.pc installed by the libffi-nati=
ve recipe.
>
>Bye Henning


Do i have to use : git://git.linaro.org/openembedded/meta-linaro.git rev 4.=
8-2013.08 ?

Or is there another Ubuntu repository to use ?

Thanks
Bye
Daniel.

