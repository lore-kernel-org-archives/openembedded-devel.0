Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Paa0q-0001Gz-QV
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 21:31:16 +0100
Received: (qmail 21019 invoked by uid 503); 5 Jan 2011 21:08:24 -0000
Received: from b9.ovh.net (HELO mail241.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 5 Jan 2011 21:08:24 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 5 Jan 2011 22:30:54 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 5 Jan 2011 22:30:51 +0200
Message-ID: <4D24D4FB.50603@eukrea.com>
Date: Wed, 05 Jan 2011 21:30:51 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTink9h1dkjww1+Vi3arnTagSF2yCwygSHnPLcTdU@mail.gmail.com>
In-Reply-To: <AANLkTink9h1dkjww1+Vi3arnTagSF2yCwygSHnPLcTdU@mail.gmail.com>
X-Ovh-Tracer-Id: 15346860156689624393
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: [RFC] linux 2.6.36: upgrade to 2.6.36.2
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
X-List-Received-Date: Wed, 05 Jan 2011 20:31:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Frans,

On 04/01/2011 22:12, Frans Meulenbroeks wrote:
> I'm in the process of upgrading the sheevaplug kernel to 2.6.36. I
> noticed the current version of 2.6.36 is at patch 1 but 2.6.36.2 is
> already out.
> Guess this needs some coordination with the other users. Currently the
> recipe says:
>
> DEFAULT_PREFERENCE = "-1"
> DEFAULT_PREFERENCE_mx31ads = "1"
> DEFAULT_PREFERENCE_ts72xx = "1"
>
> Seems Petr, Eric and Robert are involved in these two machines.
> Care to comment on moving to 2.6.36.2 (or give it a stab)?
>
no problem for me, (I only use mx31ads for compile testing for armv6 so I will 
tell you if that still compiles next week ;-)).

Eric


