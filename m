Received: from 64.mail-out.ovh.net ([91.121.185.65])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PqPzt-00039p-4H
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 14:03:45 +0100
Received: (qmail 17660 invoked by uid 503); 18 Feb 2011 12:40:14 -0000
Received: from b6.ovh.net (HELO mail240.ha.ovh.net) (213.186.33.56)
	by 64.mail-out.ovh.net with SMTP; 18 Feb 2011 12:40:14 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 18 Feb 2011 15:02:31 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 18 Feb 2011 15:02:29 +0200
Message-ID: <4D5E6DE5.5070206@eukrea.com>
Date: Fri, 18 Feb 2011 14:02:29 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <201102170226.53460.schnitzeltony@gmx.de>	<201102171808.51219.schnitzeltony@gmx.de>	<4D5E5568.5020308@eukrea.com>
	<201102181351.06282.schnitzeltony@gmx.de>
In-Reply-To: <201102181351.06282.schnitzeltony@gmx.de>
X-Ovh-Tracer-Id: 7918735520705064265
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.500001/N
Subject: Re: QA RPATH error for c++ packages?
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
X-List-Received-Date: Fri, 18 Feb 2011 13:03:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 18/02/2011 13:51, Andreas Mueller wrote:
> On Friday 18 February 2011 12:18:00 Eric Bénard wrote:
>
>> I confirm this also works for angstrom 2008.1 where I met a qa problem in
>> gnutlsxx.
> yes another victim...
>
> I think this issue is fixed by removing ${STAGING_DIR_TARGET} at the end of
> cross.bbclass.
>
can't that come from the sed at line 43 of gcc-package-cross.inc ?

Eric


