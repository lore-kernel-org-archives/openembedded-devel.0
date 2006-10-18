Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1Ga50S-0004Wo-U6
	for openembedded-devel@openembedded.org; Wed, 18 Oct 2006 08:34:25 +0200
Received: (qmail 16052 invoked by uid 813007); 18 Oct 2006 06:27:27 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 18 Oct 2006 06:27:27 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Oct 2006 08:27:45 +0200
User-Agent: KMail/1.9.5
References: <427d64720610172317t1e89518bx16ffbdae70fdbfb4@mail.gmail.com>
In-Reply-To: <427d64720610172317t1e89518bx16ffbdae70fdbfb4@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200610180827.46349.openembedded@hrw.one.pl>
Subject: Re: Fail to start dropbear
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Oct 2006 06:34:25 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia =B6roda, 18 pa=BCdziernika 2006 08:17, axel lin napisa=B3:

> I got below messages when start dropbear... ( config is
> angstrom/mainstone) how to fix this?

> root@mainstone:/$ /etc/init.d/dropbear start
> Starting Dropbear SSH server: Will output 1024 bit rsa secret key to
> '/etc/dropbear/dropbear_rsa_host_key'
> Generating key, this may take a while...
> Exited: couldn't open random device

Looks like your machine system lack /dev/(u)random

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

               Heavy, adj.:
               	Seduced by the chocolate side of the Force.




