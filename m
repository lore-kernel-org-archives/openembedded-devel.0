Received: from 2.26.mail-out.ovh.net ([178.33.107.8] helo=26.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Pp1Vi-0004nL-9h
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 17:42:50 +0100
Received: (qmail 2687 invoked by uid 503); 14 Feb 2011 15:42:44 -0000
Received: from b9.ovh.net (HELO mail611.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 14 Feb 2011 15:42:43 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 14 Feb 2011 18:15:01 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 14 Feb 2011 18:15:00 +0200
Message-ID: <4D595503.20409@eukrea.com>
Date: Mon, 14 Feb 2011 17:14:59 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D59535A.1010602@mentor.com>
In-Reply-To: <4D59535A.1010602@mentor.com>
X-Ovh-Tracer-Id: 6126021394224229705
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: testing-release-2011.1 failure: at91sam9263ek
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
X-List-Received-Date: Mon, 14 Feb 2011 16:42:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Tom,

On 14/02/2011 17:07, Tom Rini wrote:
> Here are the failures I see building for at91sam9263ek:
> angstrom-2010.x (all images): http://pastebin.com/7g7wNWQj
>
> Perhaps this will be fixed when Ulf pushes updates for a newer version of
> u-boot? The error itself is easily fixable but there may be run-time problems
> still.
>
there is a patch in 2009.08 which fix this error, maybe it can apply to 2009.01 :
recipes/u-boot/u-boot-2009.08/dont-inline-weak-symbols.patch

Eric


