Received: from 14.mo5.mail-out.ovh.net ([188.165.51.82]
	helo=mo5.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Ti2bZ-0000Dg-FY
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Dec 2012 13:37:05 +0100
Received: from mail188.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo5.mail-out.ovh.net (Postfix) with SMTP id 6ED51100C1CF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Dec 2012 12:52:31 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 10 Dec 2012 13:44:01 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO eb-e6520)
	(eric%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 10 Dec 2012 13:43:59 +0200
Date: Mon, 10 Dec 2012 12:43:59 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.5 (mo5.mail-out.ovh.net)
Message-ID: <20121210124359.15b4543e@eb-e6520>
In-Reply-To: <CAP9ODKp6urgcSXNyfzsQhUnEDXoE_R4G0DhWS5iu7fS5OqW9Rw@mail.gmail.com>
References: <CAP9ODKp6urgcSXNyfzsQhUnEDXoE_R4G0DhWS5iu7fS5OqW9Rw@mail.gmail.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 14627410114909613385
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: -100
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehiedrtdejucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfhrhhomhepgfhrihgtuceurohnrghrugcuoegvrhhitgesvghukhhrvggrrdgtohhmqeenucfjughrpeffhffvuffkjghfohfogggtgfesthhqredtredtud
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehjedrtddtucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfhrhhomhepgfhrihgtuceurohnrghrugcuoegvrhhitgesvghukhhrvggrrdgtohhmqeenucfjughrpeffhffvuffkjghfohfogggtgfesthhqredtredtud
Cc: otavio@ossystems.com.br, Mario Goulart <mario@ossystems.com.br>
Subject: Re: [for-danny] Hashes for backporting to danny
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
X-List-Received-Date: Mon, 10 Dec 2012 12:37:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Otavio and Mario,

Le Tue, 4 Dec 2012 10:11:10 -0200,
Otavio Salvador <otavio@ossystems.com.br> a =E9crit :
> Here goes the list of patches we'd like to have backported to danny so we
> can use danny branch for one product at O.S. Systems:
>=20
>  * freerdp: disable man pages generation
> (638f02695550bee4f941439cc2d1293c599b4a1f)
>=20
>  * freerdp: update to the latest commit (2012-11-20) in the stable-1.0
> branch (e7e3fd797b46a85ffc03cc7c4b2267d686476f93)
>=20
>  * openbox: separate package for configuration files (openbox-config)
> (3becce8504033dfac7c497fa12675f873a5df9e0)
>=20
>  * xinput-calibrator: update to 2012 Aug 2nd's git snapshot
> (3cd0866c28822d08e5817d4d806b8deaa368c711)
>=20
>  * xinput-calibrator: update meta-systemd's bbappend to 2012 Aug 2nd's git
> snapshot (23c9e5d6c4f66df8604c42a19e343d952784fc46)
>=20
pushed to danny-next, please check the result is what you expect.

Thanks,
Eric


