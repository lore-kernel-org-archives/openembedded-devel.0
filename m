Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1GhPs0-000495-Cx
	for openembedded-devel@openembedded.org; Tue, 07 Nov 2006 13:16:00 +0100
Received: (qmail 22770 invoked by uid 813007); 7 Nov 2006 12:14:33 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO ?192.168.1.90?)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 7 Nov 2006 12:14:33 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
Organization: OpenEmbedded
To: openembedded-devel@lists.openembedded.org
Date: Tue, 7 Nov 2006 13:14:17 +0100
User-Agent: KMail/1.9.5
References: <454EEA21.7050108@dominion.kabel.utwente.nl>
	<1162850089.5544.18.camel@localhost.localdomain>
	<455069C5.10807@dominion.kabel.utwente.nl>
In-Reply-To: <455069C5.10807@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Message-Id: <200611071314.17986.openembedded@hrw.one.pl>
Subject: Re: [RFC] New MACHINE_FEATURE: 'screen'
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
X-List-Received-Date: Tue, 07 Nov 2006 12:16:00 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia wtorek, 7 listopada 2006 12:11, Koen Kooi napisa=C5=82:

> I've added 'screen' and 'pci' to MACHINE_FEATURES. I ran into troubles
> with wpa-supplicant 0.5.1, that needs 'pci' for depending on madwifi-ng.
> Both are still unused in the metadata, but at least task-base lists them
> now

'pci' featured machines got pciutils in task-base

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

         You can close your eyes to reality, but not to memories.




