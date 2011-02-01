Received: from 29.mail-out.ovh.net ([87.98.216.213])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PkIKA-0004zm-I7
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Feb 2011 16:39:22 +0100
Received: (qmail 7384 invoked by uid 503); 1 Feb 2011 15:56:50 -0000
Received: from b6.ovh.net (HELO mail96.ha.ovh.net) (213.186.33.56)
	by 29.mail-out.ovh.net with SMTP; 1 Feb 2011 15:56:50 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 1 Feb 2011 17:38:29 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 1 Feb 2011 17:38:27 +0200
Message-ID: <4D4828F2.6080406@eukrea.com>
Date: Tue, 01 Feb 2011 16:38:26 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1296550862-29994-1-git-send-email-sujak.marek@gmail.com>
In-Reply-To: <1296550862-29994-1-git-send-email-sujak.marek@gmail.com>
X-Ovh-Tracer-Id: 2950702182339161417
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: [PATCH v5] barebox: add patch for vmx25
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
X-List-Received-Date: Tue, 01 Feb 2011 15:39:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Marek,

On 01/02/2011 10:01, Marek Sujak wrote:
> * memory timing, custom init scripts, mach id's
> * default config file
> * tested with angstrom 2010.x eglibc compiler
>
> Signed-off-by: Marek Sujak<sujak.marek@gmail.com>

ok I missed this one and it's now pushed.
Btw, I don't know why but this patch (and some of the previous ones) didn't 
appear into patchwork which makes sorting and applying them more complicated.

Eric


