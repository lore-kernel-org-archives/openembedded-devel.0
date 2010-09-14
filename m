Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OvbeU-0000GN-6t
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Sep 2010 21:58:56 +0200
Received: (qmail 1198 invoked by uid 503); 14 Sep 2010 20:21:24 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 14 Sep 2010 20:21:23 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 14 Sep 2010 21:58:01 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 14 Sep 2010 21:58:00 +0200
Message-ID: <4C8FD3C7.8080006@eukrea.com>
Date: Tue, 14 Sep 2010 21:57:59 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.9) Gecko/20100825 Thunderbird/3.1.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C8E07CD.2000809@eukrea.com>	<1284376645-11610-1-git-send-email-eric@eukrea.com>	<1284376645-11610-2-git-send-email-eric@eukrea.com>	<AANLkTim4hXBoB-gbUT09rWHrF7ENA1v4ix3-fMwp4y+8@mail.gmail.com>
	<4C8F1077.8040105@dresearch.de>
In-Reply-To: <4C8F1077.8040105@dresearch.de>
X-Ovh-Tracer-Id: 15260447337597021513
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.56
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] util-linux-ng: remove reset
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
X-List-Received-Date: Tue, 14 Sep 2010 19:58:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Le 14/09/2010 08:04, Steffen Sledz a écrit :
> Am 13.09.2010 18:41, schrieb Frans Meulenbroeks:
>> 2010/9/13 Eric Bénard<eric@eukrea.com>:
>>> * reset is a script using tput so it rdepends on ncurses-tools
>>>   which also provided reset
>>> * prefer using the original and remove util-linux-ng's reset
>>>
>>> Signed-off-by: Eric Bénard<eric@eukrea.com>
>>
>> If they are functionally identical I have a slight preference for
>> removing it and use the original.
>> No strong feelings on it though.
>
> What about update-alternatives?

is it an ack for the first patch ?
http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-September/024167.html

Thanks,
Eric


