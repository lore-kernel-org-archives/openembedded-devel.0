Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1NxKqa-0004SV-11
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 15:54:12 +0200
Received: (qmail 14973 invoked by uid 503); 1 Apr 2010 13:48:22 -0000
Received: from b7.ovh.net (HELO mail409.ha.ovh.net) (213.186.33.57)
	by 63.mail-out.ovh.net with SMTP; 1 Apr 2010 13:48:22 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 1 Apr 2010 13:44:17 -0000
Received: from cug31-2-82-228-86-110.fbx.proxad.net (HELO ?192.168.0.2?)
	(ebenard%eukrea.com@82.228.86.110)
	by ns0.ovh.net with SMTP; 1 Apr 2010 13:44:16 -0000
Message-ID: <4BB4A32F.8070007@eukrea.com>
Date: Thu, 01 Apr 2010 15:44:15 +0200
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.1.8) Gecko/20100227 Thunderbird/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1269935184-21934-1-git-send-email-mchazaux@adeneo-embedded.com>	<20100331204928.GB14197@gmail.com>
	<o2hbc36f8ed1004010253k464e88d7j99e74a4fa1104bac@mail.gmail.com>
In-Reply-To: <o2hbc36f8ed1004010253k464e88d7j99e74a4fa1104bac@mail.gmail.com>
X-Ovh-Tracer-Id: 11758617152308948297
X-Ovh-Remote: 82.228.86.110 (cug31-2-82-228-86-110.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.56
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add Freescale i.MX25 3stack support
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
X-List-Received-Date: Thu, 01 Apr 2010 13:54:12 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 01/04/2010 11:53, Mickael Chazaux a écrit :
> Using the patch command, the LTIB patches did not apply on top of 2.6.28.10.
> That is why I used 2.6.28. But I just tested and the patches seems to
> apply cleanly using git. I'll test
> this a bit more and let you know.
>
you just need to use git am to apply all the LTIB patch serie and this 
works fine.

Eric


