Received: from 30.mail-out.ovh.net ([213.186.62.213])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1O9KDR-0000D5-8V
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 May 2010 17:39:23 +0200
Received: (qmail 10246 invoked by uid 503); 4 May 2010 15:32:27 -0000
Received: from b6.ovh.net (HELO mail639.ha.ovh.net) (213.186.33.56)
	by 30.mail-out.ovh.net with SMTP; 4 May 2010 15:32:27 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 4 May 2010 15:35:54 -0000
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 4 May 2010 15:35:52 -0000
Message-ID: <4BE03EC5.9010209@eukrea.com>
Date: Tue, 04 May 2010 17:35:33 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.1.9) Gecko/20100317 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1272921755-7414-1-git-send-email-eric@eukrea.com>
	<1272986341-17094-1-git-send-email-GNUtoo@no-log.org>
In-Reply-To: <1272986341-17094-1-git-send-email-GNUtoo@no-log.org>
X-Ovh-Tracer-Id: 4528369426320633161
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 213.186.62.213
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] compat-wireless: Add latest Linux wireless drivers
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
X-List-Received-Date: Tue, 04 May 2010 15:39:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Le 04/05/2010 17:19, Denis 'GNUtoo' Carikli a écrit :
> On Mon, 2010-05-03 at 23:22 +0200, Eric Benard wrote:
> - provides latest (linux-next) drivers for older kernels
>> - ath driver was tested on x86 (on Asus eeetop with Linux 2.6.33)
>> - other drivers were only compile tested for x86
>> Interesting...
> I made a compat-wireless-all,modded the config.mk to make it compile for me but it didn't install.
> I've a fix for that,I've attached the patch.
>
strange, it's working fine here (for x86).

Eric


