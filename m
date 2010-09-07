Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1Oswym-0002CD-8X
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 14:08:50 +0200
Received: (qmail 31781 invoked by uid 503); 7 Sep 2010 12:19:17 -0000
Received: from 30.mail-out.ovh.net (213.186.62.213)
	by 68.mail-out.ovh.net with SMTP; 7 Sep 2010 12:19:17 -0000
Received: (qmail 11246 invoked by uid 503); 7 Sep 2010 11:52:22 -0000
Received: from b9.ovh.net (HELO mail431.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 7 Sep 2010 11:52:21 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 7 Sep 2010 14:08:09 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 7 Sep 2010 14:08:08 +0200
Message-ID: <4C862B28.9090309@eukrea.com>
Date: Tue, 07 Sep 2010 14:08:08 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.8) Gecko/20100802 Thunderbird/3.1.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C862985.9050205@mlbassoc.com>
In-Reply-To: <4C862985.9050205@mlbassoc.com>
X-Ovh-Tracer-Id: 3109735544623050057
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.69
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: opkg install without feed
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
X-List-Received-Date: Tue, 07 Sep 2010 12:08:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Le 07/09/2010 14:01, Gary Thomas a écrit :
> Is there any way to install a .ipk file, without loading it
> from one of the defined feeds? This would be akin to the
> yum localinstall operation?
>
> Sometimes I have a locally created .ipk file and it's cumbersome
> to get it into my feed setup. It would be nice to be able to
> just install it directly.
>
I think you can run
opkg install file.ipk

Eric


