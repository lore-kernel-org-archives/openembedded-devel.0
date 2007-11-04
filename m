Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@haerwu.biz>) id 1IoafM-00025X-4A
	for openembedded-devel@openembedded.org; Sun, 04 Nov 2007 09:17:08 +0100
Received: (qmail 14281 invoked by uid 813007); 4 Nov 2007 08:16:34 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 4 Nov 2007 08:16:34 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 4 Nov 2007 09:16:31 +0100
User-Agent: KMail/1.9.7
References: <472D296B.5020506@gmx.net>
In-Reply-To: <472D296B.5020506@gmx.net>
MIME-Version: 1.0
Message-Id: <200711040916.32545.openembedded@haerwu.biz>
Subject: Re: debian package names with deb packaging
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 04 Nov 2007 08:17:08 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia niedziela, 4 listopada 2007, Robert Schuster napisa=B3:
> Hi,
> when I build a recipe whose package needs gtk+ at runtime I would
> expect that the depends line in the control file says libgtk2.0-0 when
> using the debian.bbclass (as well as package_deb.bbclass). Instead the
> line contains an entry saying "gtk+ (>=3D some version)".
>
> Is this a known issue? File a bug? More info needed?

If package contain ONLY library then it is named libNAME - if it contain=20
anything else then it is not renamed.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

We were talking about everything. It's called friendship. It's like=20
therapy
for poor people [WaT 2x18]




