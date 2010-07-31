Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1Of997-0005XY-1V
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jul 2010 12:18:25 +0200
Received: (qmail 17839 invoked by uid 503); 31 Jul 2010 10:35:51 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 31 Jul 2010 10:35:50 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 31 Jul 2010 12:18:05 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 31 Jul 2010 12:18:04 +0200
Message-ID: <4C53F85C.7080301@eukrea.com>
Date: Sat, 31 Jul 2010 12:18:04 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.7) Gecko/20100713 Thunderbird/3.1.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <A806EA3C-FD29-40A7-82E7-9391241EF930@mac.com>
	<C3A2B5D3-75D5-4A5A-843A-631916635440@mac.com>
In-Reply-To: <C3A2B5D3-75D5-4A5A-843A-631916635440@mac.com>
X-Ovh-Tracer-Id: 17896179020704361801
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
Subject: Re: Is bitbake 1.10 the latest stable version?
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
X-List-Received-Date: Sat, 31 Jul 2010 10:18:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Le 31/07/2010 09:43, Elvis Dowson a écrit :
>
> On Jul 31, 2010, at 11:07 AM, Elvis Dowson wrote:
>
>> I was wondering if bitbake-1.10 is the latest stable version?
>
> When trying to build a recipe, e.g. omap3-console-image, with the bitbake-1.10 and the current org.openembedded.dev, the display progress format looks pretty ugly  ..
>
this may be because you have several BBTHREADS and thus several fetch 
running and outputing log at the same time.

Eric


