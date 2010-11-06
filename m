Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PEh1F-0005tp-43
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 12:33:15 +0100
Received: (qmail 20674 invoked by uid 503); 6 Nov 2010 12:02:17 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 6 Nov 2010 12:02:17 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 6 Nov 2010 13:32:20 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 6 Nov 2010 13:32:18 +0200
Message-ID: <4CD53CC1.10208@eukrea.com>
Date: Sat, 06 Nov 2010 12:32:17 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.12) Gecko/20101027 Thunderbird/3.1.6
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
References: <1288387543-1277-1-git-send-email-eric@eukrea.com>
	<1288387543-1277-2-git-send-email-eric@eukrea.com>
	<1288387543-1277-3-git-send-email-eric@eukrea.com>
	<1288387543-1277-4-git-send-email-eric@eukrea.com>
	<1288387543-1277-5-git-send-email-eric@eukrea.com>
	<1288387543-1277-6-git-send-email-eric@eukrea.com>
	<1288387543-1277-7-git-send-email-eric@eukrea.com>
	<AANLkTik=_ONqFN=OnALnzoUK6kmdFNfoybCBqQ728JwM@mail.gmail.com>
In-Reply-To: <AANLkTik=_ONqFN=OnALnzoUK6kmdFNfoybCBqQ728JwM@mail.gmail.com>
X-Ovh-Tracer-Id: 4378061788828446196
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.56
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 7/7] qwt: add qwt 5.2.1
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
X-List-Received-Date: Sat, 06 Nov 2010 11:33:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Le 06/11/2010 12:26, Sylvain Paré a écrit :
> Thanks for the update.
> But am I the only having issue building it?
>
> http://tinderbox.openembedded.org/public/logs/task/9693587.txt
>
are you using the patch which was pushed ?
If yes, it's tested using qt-embedded 4.7 on armv5 & armv6 with angstrom 
2010-x distro.

Eric


