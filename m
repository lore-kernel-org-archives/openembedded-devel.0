Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MHH3K-0003Im-Lp
	for openembedded-devel@openembedded.org; Thu, 18 Jun 2009 14:49:14 +0200
Received: (qmail 17573 invoked by uid 813007); 18 Jun 2009 12:38:42 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 18 Jun 2009 12:38:42 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Jun 2009 14:38:26 +0200
User-Agent: KMail/1.11.4 (Linux/2.6.30-00002-g9396b7b; KDE/4.2.4; x86_64; ; )
References: <37367b3a0906180511n7ed19782j28fcf902cb9077fd@mail.gmail.com>
In-Reply-To: <37367b3a0906180511n7ed19782j28fcf902cb9077fd@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200906181438.27000.marcin@juszkiewicz.com.pl>
Subject: Re: [PATCH v2] Add basic support for i.MX27ADS board
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
X-List-Received-Date: Thu, 18 Jun 2009 12:49:15 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia czwartek, 18 czerwca 2009 o 14:11:58 Alan Carvalho de Assis=20
napisa=C5=82(a):
> +CONFIG_SYSFS_DEPRECATED=3Dy
> +CONFIG_SYSFS_DEPRECATED_V2=3Dy

Removal of those two would be handly but linux.inc takes care of it=20
anyway.

Acked-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




