Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PNJle-00041F-5n
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Nov 2010 07:32:46 +0100
Received: (qmail 22959 invoked by uid 503); 30 Nov 2010 06:56:03 -0000
Received: from 63.mail-out.ovh.net (91.121.185.56)
	by 68.mail-out.ovh.net with SMTP; 30 Nov 2010 06:56:03 -0000
Received: (qmail 4843 invoked by uid 503); 30 Nov 2010 07:04:21 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 30 Nov 2010 07:04:21 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 30 Nov 2010 08:31:25 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 30 Nov 2010 08:31:24 +0200
Message-ID: <4CF49A3B.400@eukrea.com>
Date: Tue, 30 Nov 2010 07:31:23 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.12) Gecko/20101103 Fedora/1.0-0.33.b2pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <ico541$f8$1@dough.gmane.org>	<1290952831-12085-1-git-send-email-eric@eukrea.com>	<icvtl2$4pb$1@dough.gmane.org>
	<AANLkTimOybgRmUYFmJXQEaZMDx9vbf=b3KzxLgv10WPu@mail.gmail.com>
In-Reply-To: <AANLkTimOybgRmUYFmJXQEaZMDx9vbf=b3KzxLgv10WPu@mail.gmail.com>
X-Ovh-Tracer-Id: 11113757981632736585
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Ovh-Tracer-Id: 11530059472502893897
X-SA-Exim-Connect-IP: 91.121.185.69
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] add task-qt4-x11 and qt4-x11 base & demo images
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
X-List-Received-Date: Tue, 30 Nov 2010 06:32:47 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Khem,

On 29/11/2010 22:25, Khem Raj wrote:
> On Mon, Nov 29, 2010 at 2:01 AM, Koen Kooi<k.kooi@student.utwente.nl>  wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 28-11-10 15:00, Eric Bénard wrote:
>>> these are images integrating qt4-x11-free librarie and its demo
>>> applications running using Xorg.
>>>
>>> Signed-off-by: Eric Bénard<eric@eukrea.com>
>>
>> Looks good enough to me:
>>
>> Acked-by: Koen Kooi<k-kooi@ti.com>
>
> Ditto.
>
> Acked-by: Khem Raj<raj.khem@gmail.com>

can you please cherry pick
cb0419cc5fbf3ddf147d689e027a3fe83d368a3e
3bd272a80f647987f0dff52b842da93773bf3903

to have the qt4-x11 images in the release ?

Thanks,
Eric


