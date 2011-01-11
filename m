Received: from host4.kei.pl ([94.152.8.4] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1PcjJq-0004y7-T5
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jan 2011 19:51:46 +0100
Received: (qmail 18719 invoked by uid 2404007); 11 Jan 2011 18:51:18 -0000
X-clamdmail: clamdmail 0.18a
Received: from unknown (HELO lucek.localnet)
	(marcin@juszkiewicz.com.pl@63.133.153.66)
	by host4.kei.pl with ESMTPA; 11 Jan 2011 18:51:17 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jan 2011 12:51:14 -0600
User-Agent: KMail/1.13.5 (Linux/2.6.37-12-generic; KDE/4.5.95; x86_64; ; )
References: <1293810428-31078-1-git-send-email-fransmeulenbroeks@gmail.com>
	<4D2C22A3.3030602@xora.org.uk> <4D2C2456.9050000@eukrea.com>
In-Reply-To: <4D2C2456.9050000@eukrea.com>
MIME-Version: 1.0
Message-Id: <201101111251.15050.marcin@juszkiewicz.com.pl>
Subject: Re: [PATCH 2/2] omap4430-panda: fix u-boot
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
X-List-Received-Date: Tue, 11 Jan 2011 18:51:47 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia wtorek, 11 stycznia 2011 o 03:35:18 Eric B=C3=A9nard napisa=C5=82(a):
> On 11/01/2011 10:28, Graeme Gregory wrote:
> > If some distro does not have the sources in its fetchable list can
> > the source archive not be copied to a more general source mirror?
>=20
> more globally, shouldn't OE provide a source mirror for everything
> which can  be fetched by the project. This would avoid problems like
> handhelds.org's vanishing.

OpenEmbedded project provided metadata. It is distributions which should=20
provide sources. They select which SRCREVs are used...


