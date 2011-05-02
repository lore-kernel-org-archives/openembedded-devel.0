Received: from 7.27.mail-out.ovh.net ([46.105.34.120] helo=27.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1QGqlQ-0001Sn-1M
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 May 2011 12:54:04 +0200
Received: (qmail 17218 invoked by uid 503); 2 May 2011 11:46:50 -0000
Received: from b9.ovh.net (HELO mail621.ha.ovh.net) (213.186.33.59)
	by 27.mail-out.ovh.net with SMTP; 2 May 2011 11:46:45 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 2 May 2011 12:51:24 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 2 May 2011 12:51:23 +0200
Message-ID: <4DBE8CAA.3050500@eukrea.com>
Date: Mon, 02 May 2011 12:51:22 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc14
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Radoslav Kolev <radoslav@kolev.info>
References: <BANLkTik1xhYidSX6QugYpYv5BmXCL78JUA@mail.gmail.com>
In-Reply-To: <BANLkTik1xhYidSX6QugYpYv5BmXCL78JUA@mail.gmail.com>
X-Ovh-Tracer-Id: 10136195388393762264
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: buildindex is always 0, using BB_GIT_CLONE_FOR_SRCREV = "1"
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
X-List-Received-Date: Mon, 02 May 2011 10:54:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Radoslav,

On 02/05/2011 12:18, Radoslav Kolev wrote:
> In the recipe I have
>
> SRCREV = "${AUTOREV}"
> PV = "0.4+gitr-${SRCPV}"
>
replace SRCPV with SRVREV in PV and you will the the rev instead of O.

Eric


