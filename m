Received: from 30.mail-out.ovh.net ([213.186.62.213])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PbKed-0008UQ-PU
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 23:19:27 +0100
Received: (qmail 25806 invoked by uid 503); 7 Jan 2011 21:51:09 -0000
Received: from b9.ovh.net (HELO mail631.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 7 Jan 2011 21:51:08 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 8 Jan 2011 00:19:02 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 8 Jan 2011 00:19:01 +0200
Message-ID: <4D279154.9000608@eukrea.com>
Date: Fri, 07 Jan 2011 23:19:00 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294435710-2622-1-git-send-email-eric@eukrea.com>
	<AANLkTi=4WsYzkEMbY+861QseH9XQGsr=3nN4p36ynko6@mail.gmail.com>
In-Reply-To: <AANLkTi=4WsYzkEMbY+861QseH9XQGsr=3nN4p36ynko6@mail.gmail.com>
X-Ovh-Tracer-Id: 10472276509026725193
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: [PATCH] busybox-1.8.1 : add latest fixes
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
X-List-Received-Date: Fri, 07 Jan 2011 22:19:27 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/01/2011 23:15, Khem Raj wrote:
> On Fri, Jan 7, 2011 at 1:28 PM, Eric Bénard<eric@eukrea.com>  wrote:
>> patches from : http://busybox.net/downloads/fixes-1.18.1/
>> * hush : fix wrong prompt problem on empty interactive commants
>> http://git.busybox.net/busybox/commit/?id=642e71a789156a96bcb18e6c5a0f52416c49d3b5
>> * mkswap : selinux build fix
>> http://git.busybox.net/busybox/commit/?id=e66a212081bcca521760ccff3a2da0deccd99340
>> * suppress "'fast_strtol_10' defined but not used" warning
>> http://git.busybox.net/busybox/commit/?id=f42c7b8fc161f5b3eb4e9c13f392daf7a11760c8
>>
>
>> Signed-off-by: Eric Bénard<eric@eukrea.com>
>
>
> looks ok you have a typo in the commit message though
>
it's the typo from the busybox's git commit that I copied ;-)

Eric


