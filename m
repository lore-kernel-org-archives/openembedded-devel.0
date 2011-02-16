Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Ppg1T-00047u-MQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 12:58:19 +0100
Received: (qmail 12303 invoked by uid 503); 16 Feb 2011 12:39:52 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 16 Feb 2011 12:39:52 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 16 Feb 2011 13:57:10 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 16 Feb 2011 13:57:08 +0200
Message-ID: <4D5BBB94.3010904@eukrea.com>
Date: Wed, 16 Feb 2011 12:57:08 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1297852433-31160-1-git-send-email-eric@eukrea.com>	<1297852433-31160-8-git-send-email-eric@eukrea.com>
	<AANLkTikiF9jz+OcGkDFwh1aNHK=HzhO0=bYMBhka9vxF@mail.gmail.com>
In-Reply-To: <AANLkTikiF9jz+OcGkDFwh1aNHK=HzhO0=bYMBhka9vxF@mail.gmail.com>
X-Ovh-Tracer-Id: 13516428383225294153
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 08/10] angstrom-2010: prefer busybox-1.18.3
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
X-List-Received-Date: Wed, 16 Feb 2011 11:58:19 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/02/2011 12:49, Koen Kooi wrote:
> Acked-by: Koen Kooi <koen@openembedded.org <mailto:koen@openembedded.org>>
>
> I must admit the busybox churn is getting a bit much, how many days till .4?
>
for 1.18 :
22/11/2010 : 1.18.0 (unstable)
21/12/2010 : 1.18.1
16/01/2011 : 1.18.2
08/02/2011 : 1.18.3

for 1.17 :
06/07/2010 : 1.17.0 (unstable)
25/07/2010 : 1.17.1
25/08/2010 : 1.17.2
09/10/2010 : 1.17.3
22/11/2010 : 1.17.4

so we can expect at least a 1.18.4 (as there are fixes for 1.18.3)

For 1.19, I think I'll wait .2 or .3 before annoying distro maintainers :-)

Eric


