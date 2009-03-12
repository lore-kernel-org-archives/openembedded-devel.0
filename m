Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1LhqZ5-00038Y-1g
	for openembedded-devel@openembedded.org; Thu, 12 Mar 2009 20:27:35 +0100
Received: (qmail 11883 invoked by uid 813007); 12 Mar 2009 19:27:20 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 12 Mar 2009 19:27:20 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Mar 2009 20:27:19 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.29-rc6-00216-g778ef1e; KDE/4.2.1; x86_64; ;
	)
References: <1236875362.11134.22.camel@homestead>
In-Reply-To: <1236875362.11134.22.camel@homestead>
MIME-Version: 1.0
Message-Id: <200903122027.20010.marcin@juszkiewicz.com.pl>
Subject: Re: Working with the Target
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
X-List-Received-Date: Thu, 12 Mar 2009 19:27:35 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia czwartek, 12 marca 2009 o 17:29:22 Shane Dixon napisa=C5=82(a):

> I am curious to know how others are working with their target device.
> My last application would build from OE and I had a public/private
> key on my device and a makefile that automatically scp'd the program,
> uninstall the old, install the new, and ran the program to test it.=20

> I'd like to do something like netboot the device and keep the kernel
> and rootfs on my machine shared over NFS, but I'm not sure if I can
> do that with OE.

> (By the way, my target is an at91sam9263ek)

I used my at91sam9263ek with kernel fetched via TFTP and NFS root for=20
quite long time. It is very useful way to change rootfs contents -=20
especially when you can press 'Reset' any time without risk of=20
unfinished transactions.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




