Received: from 29.mail-out.ovh.net ([87.98.216.213])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PTu40-0005N7-FI
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Dec 2010 11:30:56 +0100
Received: (qmail 19983 invoked by uid 503); 18 Dec 2010 10:39:52 -0000
Received: from b6.ovh.net (HELO mail642.ha.ovh.net) (213.186.33.56)
	by 29.mail-out.ovh.net with SMTP; 18 Dec 2010 10:39:52 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 18 Dec 2010 12:25:01 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 18 Dec 2010 12:24:59 +0200
Message-ID: <4D0C8BCC.9050800@eukrea.com>
Date: Sat, 18 Dec 2010 11:24:12 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1292667009.12094.13.camel@mattotaupa>
In-Reply-To: <1292667009.12094.13.camel@mattotaupa>
X-Ovh-Tracer-Id: 10086655791303667017
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: minimal{, -uclibc}: linux-omap-psp_2.6.32: task `do_compileconfigs` fails
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
X-List-Received-Date: Sat, 18 Dec 2010 10:30:56 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 18/12/2010 11:10, Paul Menzel wrote:
> Error: selected processor does not support ARM mode `smc #0'

this seems to be a known problem with gcc 4.5 :
https://bugs.launchpad.net/ubuntu/+source/gcc-4.5/+bug/669912

Eric


