Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OR2dU-0004hX-Ff
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jun 2010 14:31:39 +0200
Received: (qmail 19646 invoked by uid 503); 22 Jun 2010 12:33:21 -0000
Received: from b9.ovh.net (HELO mail425.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 22 Jun 2010 12:33:21 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 22 Jun 2010 14:26:51 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 22 Jun 2010 14:26:49 +0200
Message-ID: <4C20AC08.6050104@eukrea.com>
Date: Tue, 22 Jun 2010 14:26:48 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.1.10) Gecko/20100512 Thunderbird/3.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTilowvawMUeG_uqEzSyvsM2HwSFiKYxu5g5izYXt@mail.gmail.com>	<4C1F5474.6050907@eukrea.com>
	<AANLkTilg_f1-6wpQQTCcWgiFdcIxEQApGhHBTx8NuF-1@mail.gmail.com>
In-Reply-To: <AANLkTilg_f1-6wpQQTCcWgiFdcIxEQApGhHBTx8NuF-1@mail.gmail.com>
X-Ovh-Tracer-Id: 12396439450405809481
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.27.225
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
X-List-Received-Date: Tue, 22 Jun 2010 12:31:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Le 22/06/2010 14:15, Dr. Ahmed Al-Alousi a écrit :
> Strangely enough, I could not find niether tx27 nor mx27ads under my
> conf/machine directory.
>
they should be there :
http://cgit.openembedded.org/cgit.cgi/openembedded/tree/conf/machine/mx27ads.conf
http://cgit.openembedded.org/cgit.cgi/openembedded/tree/conf/machine/tx27.conf

Eric


