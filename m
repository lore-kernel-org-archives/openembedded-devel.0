Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1LxI2u-0004SN-KD
	for openembedded-devel@openembedded.org; Fri, 24 Apr 2009 11:50:13 +0200
Received: (qmail 19397 invoked by uid 813007); 24 Apr 2009 09:45:29 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 24 Apr 2009 09:45:28 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Apr 2009 11:45:26 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.30-rc2-00199-g51f1622-dirty; KDE/4.2.2;
	x86_64; ; )
References: <20090424092913.GA8700@fh-wedel.de>
In-Reply-To: <20090424092913.GA8700@fh-wedel.de>
MIME-Version: 1.0
Message-Id: <200904241145.28702.marcin@juszkiewicz.com.pl>
Subject: Re: modprobe: invalid lines in etc/modutils/hostap_cs.conf?
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
X-List-Received-Date: Fri, 24 Apr 2009 09:50:20 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia pi=C4=85tek, 24 kwietnia 2009 o 11:29:13 Martin Dietze napisa=C5=82(a):
> In etc/modutils/hostap_cs.conf from hostap-conf_1.0 find lines like=20
this:
> | pcmcia:m0156c0002f06fn00pfn00pa1CADD3E5pbE697636Cpc7A5BFCF1pd000000
> |00 hostap_cs
>
> /sbin/modprobe.24 does not like lines like this in
> /etc/modules.conf. Forgive me my ignorance, but to my (limited)
> knowledge the above line does not look like a valid entry in
> /etc/modules.conf. Or is this something requireing a 2.6 kernel?

That was done for 2.6 kernel.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




