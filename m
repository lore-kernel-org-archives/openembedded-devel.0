Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1LpOB4-0006FH-Vt
	for openembedded-devel@openembedded.org; Thu, 02 Apr 2009 16:46:39 +0200
Received: (qmail 10507 invoked by uid 813007); 2 Apr 2009 14:43:33 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 2 Apr 2009 14:43:33 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 2 Apr 2009 16:43:28 +0200
User-Agent: KMail/1.11.0 (Linux/2.6.29; KDE/4.2.1; x86_64; ; )
References: <1238678587.27664.36.camel@hammer.suse.cz>
In-Reply-To: <1238678587.27664.36.camel@hammer.suse.cz>
MIME-Version: 1.0
Message-Id: <200904021643.32367.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] introduction of virtual/gail
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
X-List-Received-Date: Thu, 02 Apr 2009 14:46:48 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia czwartek, 2 kwietnia 2009 o 15:23:07 Stanislav Brabec napisa=C5=82(a):
> gtk+ >=3D 2.13.0 already includes gail. However build of gail package
> may be still triggered by a number of package that require it
> explicitly. It causes runtime problems having two different packages
> providing the same library.
>
> This patch introduces virtual/gail, which can be satisfied by gtk+ >=3D
> 2.13.0 or gail, depending on preferred version of gtk+ of a
> particular distro.

Please bump PR of affected GTK+ recipes and I will Ack it.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




