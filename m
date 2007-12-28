Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <openembedded@haerwu.biz>) id 1J8FQB-0003pZ-K7
	for openembedded-devel@openembedded.org; Fri, 28 Dec 2007 14:38:43 +0100
Received: (qmail 11813 invoked by uid 813007); 28 Dec 2007 13:32:49 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 28 Dec 2007 13:32:49 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: angstrom-distro-devel@linuxtogo.org
Date: Fri, 28 Dec 2007 14:32:41 +0100
User-Agent: KMail/1.9.7
References: <4774C182.20501@gmail.com> <4774C9AA.8050705@student.utwente.nl>
	<4774F459.5010100@laposte.net>
In-Reply-To: <4774F459.5010100@laposte.net>
MIME-Version: 1.0
Message-Id: <200712281432.44034.openembedded@haerwu.biz>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [Angstrom-devel] Tosa kernel bloat
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
X-List-Received-Date: Fri, 28 Dec 2007 13:38:44 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia pi=B1tek, 28 grudnia 2007, cyril Romain napisa=B3:

> To cut the kernel size down, some of the following built-in features
> may be set as modules instead:

> -------8<---------8<---------
> CONFIG_USB_ETH_RNDIS=3Dy

thats option not module

> CONFIG_MSDOS_PARTITION=3Dy

thats option not module

> CONFIG_USB_GADGET_SELECTED=3Dy

thats auto option

> CONFIG_USB_GADGET_PXA2XX=3Dy

thats option not module

CONFIG_USB_GADGET would be good choice instead

> CONFIG_USB_EZUSB=3Dy

> CONFIG_USB_HIDINPUT=3Dy

thats option not module

> CONFIG_VIDEO_V4L1=3Dy

thats option not module

> CONFIG_VIDEO_V4L1_COMPAT=3Dy

thats option not module

> CONFIG_VIDEO_V4L2=3Dy

thats option not module

> CONFIG_NET_RADIO=3Dy

thats option not module

> CONFIG_SCSI_MULTI_LUN=3Dy

thats option not module

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

   Gdyby cz=B3owiek musia=B3 zezwala=E6 innym na to, co toleruje u siebie,
   =BFycie by=B3oby nie do wytrzymania.             [Georges Courteline]




