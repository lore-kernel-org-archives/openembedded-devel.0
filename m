Received: from host4.kei.pl ([94.152.8.4] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Ppdjf-0003qp-LU
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 10:31:47 +0100
Received: (qmail 17069 invoked by uid 2404007); 16 Feb 2011 09:30:36 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89-73-120-20.dynamic.chello.pl (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@89.73.120.20)
	by host4.kei.pl with ESMTPA; 16 Feb 2011 09:30:36 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Feb 2011 10:30:42 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-1-generic; KDE/4.6.0; x86_64; ; )
References: <1297825404-20674-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1297825404-20674-1-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
Message-Id: <201102161030.43048.marcin@juszkiewicz.com.pl>
Subject: Re: [PATCH] wpa-supplicant-0.7.3: use MACHINE_ARCH
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
X-List-Received-Date: Wed, 16 Feb 2011 09:31:47 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia =C5=9Broda, 16 lutego 2011 o 04:03:24 Andreas Oberritter napisa=C5=82(=
a):
> * Because of madwifi, wpa-supplicant depends on COMBINED_FEATURES.
>   Thus, PACKAGE_ARCH must be set to MACHINE_ARCH.
> * Use INC_PR and bump it.

What about setting PACKAGE_ARCH=3DMACHINE_ARCH only for machines with madwi=
fi?=20
Most of out targets does not support madwifi.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz


