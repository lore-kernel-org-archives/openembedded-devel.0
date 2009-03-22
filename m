Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1LlTL4-0007RK-NP
	for openembedded-devel@openembedded.org; Sun, 22 Mar 2009 20:28:06 +0100
Received: (qmail 14708 invoked by uid 813007); 22 Mar 2009 19:26:49 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 22 Mar 2009 19:26:49 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Mar 2009 20:26:35 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.29-rc7-00188-gebdcc81-dirty; KDE/4.2.1;
	x86_64; ; )
References: <1237731142-8136-1-git-send-email-matthieu.poullet@gmail.com>
	<200903221929.57400.marcin@juszkiewicz.com.pl>
In-Reply-To: <200903221929.57400.marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
Message-Id: <200903222026.36373.marcin@juszkiewicz.com.pl>
Subject: Re: [PATCH] Alsa-state: Wildcard removed and all *.state put back in the recipes
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
X-List-Received-Date: Sun, 22 Mar 2009 19:28:06 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia niedziela, 22 marca 2009 o 19:29:47 Marcin Juszkiewicz napisa=C5=82(a):
> > The wildcard doesn't work properly.
> > So either the wildcard support must be fixed or all the *.state
> > files must be added in the SRC_URI.
>
> NACK

fix pushed in dc6fc903acadd55c5fc5156f6997e0c055028a76

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




