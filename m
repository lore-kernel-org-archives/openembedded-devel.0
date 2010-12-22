Received: from 30.mail-out.ovh.net ([213.186.62.213])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PVP4H-00052a-Ok
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 14:49:25 +0100
Received: (qmail 12958 invoked by uid 503); 22 Dec 2010 13:23:02 -0000
Received: from b6.ovh.net (HELO mail420.ha.ovh.net) (213.186.33.56)
	by 30.mail-out.ovh.net with SMTP; 22 Dec 2010 13:23:02 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 22 Dec 2010 15:49:19 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 22 Dec 2010 15:49:18 +0200
Message-ID: <4D1201DE.4030905@eukrea.com>
Date: Wed, 22 Dec 2010 14:49:18 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1292911102-13199-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1292911102-13199-1-git-send-email-raj.khem@gmail.com>
X-Ovh-Tracer-Id: 134545039947509065
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: [PATCH] gcc-4.5: Apply patches upto 2010.12 release of linaro gcc
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
X-List-Received-Date: Wed, 22 Dec 2010 13:49:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi Khem,

On 21/12/2010 06:58, Khem Raj wrote:
> This patch brings in more Linaro patches. So far I have built a x11-image
> for qemuarm and it has shown no issues. I plan to test it more thoroughly
> in coming days on different arches and different images and also run gcc
> regression testsuite for them. But while I do this I wanted to bring it to
> everyone who would be interested to try and test the patch out and report
> any issues one sees and we could weed them out before installing this patch
>
> -Khem
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>

Acked-by: Eric Bénard <eric@eukrea.com>

Tested for armv4, armv5, armv6 targets

Eric


