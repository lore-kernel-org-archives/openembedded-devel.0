Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1PNj1R-0004vT-0S
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 10:30:45 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id A88351D36171; Wed,  1 Dec 2010 10:29:23 +0100 (CET)
Date: Wed, 1 Dec 2010 10:29:23 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101201092923.GN10755@ibawizard.net>
References: <AANLkTinyc8Pnpd3XMnTu=psPPHAmGKi4+DjvgWhSE1jt@mail.gmail.com>
	<20101130082314.GL10755@ibawizard.net>
	<AANLkTikmbUDpw04xqRYE+pwY1_mBUNNOdfL+LdnahUrC@mail.gmail.com>
	<20101201084510.GM10755@ibawizard.net>
	<AANLkTikCDnhP-SoKC+fx-N-Tst3O7-AE_dkNz_g=gCo5@mail.gmail.com>
	<AANLkTik_w9__s=gBQ=YeseiEbVptaPgrjdbwv8c=jbLn@mail.gmail.com>
	<4CF60E25.5070506@xora.org.uk>
MIME-Version: 1.0
In-Reply-To: <4CF60E25.5070506@xora.org.uk>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: release-2010 - last moment hot fixes
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
X-List-Received-Date: Wed, 01 Dec 2010 09:30:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Graeme Gregory <dp@xora.org.uk> [2010-12-01 08:58:13]:

> Wait a minute here, all the reports I keep seeing are a failure to
> compile in 3 non essential tools. I think as Angstrom maintainer Im
> quite happy for that state to exist in a release. I know I wouldnt be
> using OpenGL and h264 video on a uclibc target.

It's not that easy I think, you fix x264 and mesa, then e2fsprogs[1,2]
fails...

1. http://tinderbox.openembedded.net/builds/107805/
2. http://tinderbox.openembedded.net/builds/107761/

-- ynezz


