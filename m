Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Pnukd-0002H0-Dw
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 16:17:39 +0100
Received: (qmail 6860 invoked by uid 503); 11 Feb 2011 15:58:41 -0000
Received: from b6.ovh.net (HELO mail408.ha.ovh.net) (213.186.33.56)
	by 63.mail-out.ovh.net with SMTP; 11 Feb 2011 15:58:40 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 11 Feb 2011 17:16:35 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 11 Feb 2011 17:16:34 +0200
Message-ID: <4D5552D1.6040805@eukrea.com>
Date: Fri, 11 Feb 2011 16:16:33 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: Andreas Oberritter <obi@opendreambox.org>
References: <1297428596-27694-1-git-send-email-obi@opendreambox.org>
	<1297428596-27694-2-git-send-email-obi@opendreambox.org>
In-Reply-To: <1297428596-27694-2-git-send-email-obi@opendreambox.org>
X-Ovh-Tracer-Id: 5967832458332974485
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] busybox: create busybox-inetd package
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
X-List-Received-Date: Fri, 11 Feb 2011 15:17:39 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andreas,

On 11/02/2011 13:49, Andreas Oberritter wrote:
> * Create package if CONFIG_INETD=y.
> * Use update-alternatives with priority 50.
> * Install initscript and inetd.conf.
> * RPROVIDE inetd
>
> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> CC: Eric Bénard<eric@eukrea.com>
> ---
Acked-by: Eric Bénard <eric@eukrea.com>

Not tested yet, can you push it as I'm preparing busybox 1.18.3 update so I 
would like to test it with your patch ?

Thanks,
Eric


