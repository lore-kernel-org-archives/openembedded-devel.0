Received: from [213.39.232.198] (helo=mail.fh-wedel.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <di@fh-wedel.de>) id 1LxHnC-0003y0-Jl
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Apr 2009 11:34:03 +0200
Received: by mail.fh-wedel.de (Postfix, from userid 959)
	id E9B56547D5; Fri, 24 Apr 2009 11:29:13 +0200 (CEST)
Date: Fri, 24 Apr 2009 11:29:13 +0200
From: Martin Dietze <di@fh-wedel.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090424092913.GA8700@fh-wedel.de>
MIME-Version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: modprobe: invalid lines in etc/modutils/hostap_cs.conf?
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
X-List-Received-Date: Fri, 24 Apr 2009 09:34:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

In etc/modutils/hostap_cs.conf from hostap-conf_1.0 find lines like this:

| pcmcia:m0156c0002f06fn00pfn00pa1CADD3E5pbE697636Cpc7A5BFCF1pd00000000 h=
ostap_cs

/sbin/modprobe.24 does not like lines like this in
/etc/modules.conf. Forgive me my ignorance, but to my (limited)
knowledge the above line does not look like a valid entry in
/etc/modules.conf. Or is this something requireing a 2.6 kernel?

Cheers,

Martin

--=20
----------- / http://herbert.the-little-red-haired-girl.org / -----------=
--
=3D+=3D=20
Wenn es Dir gut geht, mach Dir keine Sorgen, es wird vor=FCbergehen.


