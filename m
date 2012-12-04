Received: from 18.mo4.mail-out.ovh.net ([188.165.54.143]
	helo=mo4.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1TfwWb-00019d-G4
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 18:43:17 +0100
Received: from mail643.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo4.mail-out.ovh.net (Postfix) with SMTP id 67618104DDAE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Dec 2012 18:22:09 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 4 Dec 2012 19:13:39 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO eb-e6520)
	(eric%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 4 Dec 2012 19:13:38 +0200
Date: Tue, 4 Dec 2012 18:13:55 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.4 (mo4.mail-out.ovh.net)
Message-ID: <20121204181355.29f2633f@eb-e6520>
In-Reply-To: <50BDF27F.2030804@linaro.org>
References: <50BDECAC.5070805@communistcode.co.uk>
	<50BDF27F.2030804@linaro.org>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.1 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 3405284268496956745
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehiedrtdejucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecujfgurhepfffhvffukfgjfhhoofggtgfgsehtqhertdertddu
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehiedruddtucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecujfgurhepfffhvffukfgjfhhoofggtgfgsehtqhertdertddu
Subject: Re: php-cgi cannot install package
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
X-List-Received-Date: Tue, 04 Dec 2012 17:43:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le Tue, 04 Dec 2012 13:54:23 +0100,
Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org> a =E9crit :

> W dniu 04.12.2012 13:29, Jack Mitchell pisze:
> > I tried to build the recently commited PHP changes today and received
> > this error at do_rootfs, any ideas?
> >=20
> > The only package I select is php-cgi through IMAGE_INSTALL.
>=20
> Good catch. Looks like enabling FPM disabled CGI interface.
>=20
oops I missed that during the addition of php-fpm.
I will look if both can be generated at the same time.

Eric


