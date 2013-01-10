Received: from 7.mo2.mail-out.ovh.net ([188.165.48.182]
	helo=mo2.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1TtLG6-0004jG-5e
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 17:45:46 +0100
Received: from mail606.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo2.mail-out.ovh.net (Postfix) with SMTP id 35B10DC65CF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2013 17:39:48 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 10 Jan 2013 18:29:57 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO e6520eb)
	(eric%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 10 Jan 2013 18:29:55 +0200
Date: Thu, 10 Jan 2013 17:30:23 +0100
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: Fahad Usman <fahad_usman@mentor.com>
X-Ovh-Mailout: 178.32.228.2 (mo2.mail-out.ovh.net)
Message-ID: <20130110173023.7cafe23b@e6520eb>
In-Reply-To: <1357834959-9937-2-git-send-email-fahad_usman@mentor.com>
References: <1357834959-9937-1-git-send-email-fahad_usman@mentor.com>
	<1357834959-9937-2-git-send-email-fahad_usman@mentor.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.13; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 17042465416849829210
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: -100
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledrgeejucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledrgeejucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Cc: openembedded-devel@lists.openembedded.org,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-browser][PATCH 2/2] chromium: fix dependencies
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
X-List-Received-Date: Thu, 10 Jan 2013 16:45:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Fahad,

Le Thu, 10 Jan 2013 21:22:39 +0500,
Fahad Usman <fahad_usman@mentor.com> a =C3=A9crit :

> * fix dependencies to build chromium package successfully with current st=
ate
>   of OE
>=20
OK so we need to create a danny branch and apply this one only on
master.

May you please tell for which targets you tested chromium with these
patches ?

Thanks
Eric


