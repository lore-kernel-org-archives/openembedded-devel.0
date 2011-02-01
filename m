Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PkAkB-000884-1F
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Feb 2011 08:33:43 +0100
Received: (qmail 21438 invoked by uid 503); 1 Feb 2011 08:13:39 -0000
Received: from b9.ovh.net (HELO mail607.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 1 Feb 2011 08:13:38 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 1 Feb 2011 09:32:50 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 1 Feb 2011 09:32:49 +0200
Message-ID: <4D47B720.90008@eukrea.com>
Date: Tue, 01 Feb 2011 08:32:48 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1296220046-14636-1-git-send-email-sujak.marek@gmail.com>	<20110129140758.GM2466@ibawizard.net>	<AANLkTikMy0Hw9Yi3B1fHoDbF5jq_J8DaS3vPT+bGs=6h@mail.gmail.com>	<20110131212130.GB10042@ibawizard.net>
	<AANLkTi=b8QHFgH9Bp4gEBa=rrJt9hQpaxKqdtHa7iAdt@mail.gmail.com>
In-Reply-To: <AANLkTi=b8QHFgH9Bp4gEBa=rrJt9hQpaxKqdtHa7iAdt@mail.gmail.com>
X-Ovh-Tracer-Id: 13195828385133276489
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: [PATCH v2] barebox: added recipe for barebox v 2010.10
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
X-List-Received-Date: Tue, 01 Feb 2011 07:33:43 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 01/02/2011 07:38, Marek Sujak wrote:
>> Yes i did that, i forgot to merge machine support patches. And after first
> commit it was to late for me to fix it.
>   At least "[Patch v3] barebox: added recipe for barebox v 2010.10" should be
> ok.
> Just machine support are divided to (1=patches + 2=recipe update)
> [PATCH v3] barebox: patches for barebox 2010.10 to support vmx25
> [PATCH v3] barebox: update barebox 2010.10 to support vmx25
>
> It is partially acceptable or should i rework it again?
>
I pushed your patches yesterday :
http://cgit.openembedded.net/cgit.cgi/openembedded/log/

Eric


