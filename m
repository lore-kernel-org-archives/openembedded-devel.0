Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MPIJz-0001gD-CI
	for openembedded-devel@openembedded.org; Fri, 10 Jul 2009 17:47:35 +0200
Received: (qmail 13268 invoked by uid 813007); 10 Jul 2009 15:34:42 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 10 Jul 2009 15:34:42 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Jul 2009 17:33:56 +0200
User-Agent: KMail/1.11.4 (Linux/2.6.31-rc1-00272-g404d6df; KDE/4.2.4; x86_64; ;
	)
References: <200907091522.22285.marcin@juszkiewicz.com.pl>
	<200907091711.27475.marcin@juszkiewicz.com.pl>
	<4A56F55E.8010000@gmail.com>
In-Reply-To: <4A56F55E.8010000@gmail.com>
MIME-Version: 1.0
Message-Id: <200907101733.59059.marcin@juszkiewicz.com.pl>
Subject: Re: [RFC] Updating stable patches in linux recipes
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
X-List-Received-Date: Fri, 10 Jul 2009 15:47:35 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia pi=C4=85tek, 10 lipca 2009 o 10:01:34 Marco Cavallini napisa=C5=82(a):

> I still have some doubts
>
> 1. how do you know who is responsible for each recipe, considering
> that many of them haven't a proper header showing that.

recipes/linux/linux_* recipes are generic ones and can be used by any=20
machine basically. They are also suggested to be used for any new=20
device.

> 2. many recipes are often used by other recipes, how can you check
> all possibilities?

recipes/linux/linux_*.bb are not used by other recipes as far as I know.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




