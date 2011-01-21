Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PgCqD-0005TF-Th
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Jan 2011 09:59:34 +0100
Received: (qmail 14110 invoked by uid 503); 21 Jan 2011 09:02:18 -0000
Received: from b9.ovh.net (HELO mail95.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 21 Jan 2011 09:02:18 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 21 Jan 2011 10:58:46 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 21 Jan 2011 10:58:44 +0200
Message-ID: <4D394AC0.90300@eukrea.com>
Date: Fri, 21 Jan 2011 09:58:40 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295598581-12927-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1295598581-12927-1-git-send-email-raj.khem@gmail.com>
X-Ovh-Tracer-Id: 5387431054748593481
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: [PATCH 3/3] busybox_1.18.2.bb: slugos needs a modified version of usb.sh script
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
X-List-Received-Date: Fri, 21 Jan 2011 08:59:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Khem,

On 21/01/2011 09:29, Khem Raj wrote:
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   recipes/busybox/busybox-1.18.2/slugos/usb.sh |   33 ++++++++++++++++++++++++++

Can't it become the generic script ? What makes it slugos specific ? (I didn't 
make a diff vs the other one so the question may be stupid ;-)

Thanks,
Eric


