Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1Opogf-0004g9-DA
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 22:41:11 +0200
Received: (qmail 10563 invoked by uid 503); 29 Aug 2010 21:02:03 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 29 Aug 2010 21:02:03 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 29 Aug 2010 22:40:39 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 29 Aug 2010 22:40:37 +0200
Message-ID: <4C7AC5BF.9030502@eukrea.com>
Date: Sun, 29 Aug 2010 22:40:31 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.8) Gecko/20100802 Thunderbird/3.1.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1283078750-25729-1-git-send-email-eric@eukrea.com>	<1283080970-2494-1-git-send-email-eric@eukrea.com>	<lywrr95ys7.fsf@ensc-virt.intern.sigma-chemnitz.de>	<4C7A6EFD.5010803@eukrea.com>
	<lylj7pmbbz.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lylj7pmbbz.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Ovh-Tracer-Id: 14250796596701015369
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.56
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] ncurses-5.7 : fix sdk build + add libtermcap link
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
X-List-Received-Date: Sun, 29 Aug 2010 20:41:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi Enrico,

Le 29/08/2010 22:08, Enrico Scholz a écrit :
> I do not see a reason, not to apply '--with-ticlib' to widec.  I changed
> this in git.
>
>
> Thanks for noticing it

well if the meaning of noticing is spending 2 days on this recipe trying 
to fix it, yes I noticed it :-)
Thanks for finishing the work, I'm currently rebuilding from scratch to 
test.

Eric


