Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OQfkm-0004a2-Ow
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jun 2010 14:05:29 +0200
Received: (qmail 10102 invoked by uid 503); 21 Jun 2010 12:13:38 -0000
Received: from b7.ovh.net (HELO mail241.ha.ovh.net) (213.186.33.57)
	by 63.mail-out.ovh.net with SMTP; 21 Jun 2010 12:13:38 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 21 Jun 2010 14:00:54 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 21 Jun 2010 14:00:53 +0200
Message-ID: <4C1F5474.6050907@eukrea.com>
Date: Mon, 21 Jun 2010 14:00:52 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.1.10) Gecko/20100512 Thunderbird/3.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTilowvawMUeG_uqEzSyvsM2HwSFiKYxu5g5izYXt@mail.gmail.com>
In-Reply-To: <AANLkTilowvawMUeG_uqEzSyvsM2HwSFiKYxu5g5izYXt@mail.gmail.com>
X-Ovh-Tracer-Id: 6085770472838114633
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.56
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Bitbaking for i.MX27
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
X-List-Received-Date: Mon, 21 Jun 2010 12:05:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Le 21/06/2010 13:17, Dr. Ahmed Al-Alousi a écrit :
> I'm trying to get an image compiled for my Armadeus APF27 board, which is
> i.MX27-based.
>
> Can anyone give me any hints along the route ? Has anyone actually done this
> ?
>
you can start from machine tx27 or mx27ads which are also i.MX27 based 
and then create your own machine with these ones as an example.

Eric


