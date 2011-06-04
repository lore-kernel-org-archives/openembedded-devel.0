Received: from 64.mail-out.ovh.net ([91.121.185.65])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1QSy2M-0002Wa-Ot
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Jun 2011 23:05:38 +0200
Received: (qmail 9293 invoked by uid 503); 4 Jun 2011 20:22:10 -0000
Received: from b9.ovh.net (HELO mail26.ha.ovh.net) (213.186.33.59)
	by 64.mail-out.ovh.net with SMTP; 4 Jun 2011 20:22:10 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 4 Jun 2011 22:54:50 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 4 Jun 2011 22:54:49 +0200
Message-ID: <4DEA9B99.1000507@eukrea.com>
Date: Sat, 04 Jun 2011 22:54:49 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc14
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1307209126.4456.21.camel@mattotaupa>	<1307210460.4456.24.camel@mattotaupa>
	<isds66$5r3$1@dough.gmane.org>
In-Reply-To: <isds66$5r3$1@dough.gmane.org>
X-Ovh-Tracer-Id: 11211992748930280777
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: [PATCH] Revert "busybox_1.18.4.bb: Fix checksums of	busybox-1.18.4-hush.patch"
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
X-List-Received-Date: Sat, 04 Jun 2011 21:05:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/06/2011 20:05, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 04-06-11 20:01, Paul Menzel wrote:
>
>> Another solution would be to handle all patches in OpenEmbedded
>> directly.
>
> That is what I have been saying for a while now...

that's what was initially done but I was asked to change to remotely fetched 
patches which can create this trouble if busybox's patches are updated.

Eric


