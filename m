Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1QHfQg-0001Yd-2K
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 May 2011 19:00:02 +0200
Received: (qmail 20863 invoked by uid 503); 4 May 2011 17:49:43 -0000
Received: from b9.ovh.net (HELO mail185.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 4 May 2011 17:49:43 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 4 May 2011 18:57:24 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 4 May 2011 18:57:22 +0200
Message-ID: <4DC18572.7010203@eukrea.com>
Date: Wed, 04 May 2011 18:57:22 +0200
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc14
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1304358039-20934-1-git-send-email-christian.charreyre@cioinfoindus.fr>	<1304499401.4127.53.camel@mattotaupa>
	<4DC17203.607@eukrea.com> <1304527727.20079.6.camel@mattotaupa>
In-Reply-To: <1304527727.20079.6.camel@mattotaupa>
X-Ovh-Tracer-Id: 9615748155228400969
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: [PATCH v4] mypaint: new recipe for version 0.9.1
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
X-List-Received-Date: Wed, 04 May 2011 17:00:02 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Paul,

On 04/05/2011 18:48, Paul Menzel wrote:
> Am Mittwoch, den 04.05.2011, 17:34 +0200 schrieb Eric Bénard:
>> On 04/05/2011 10:56, Paul Menzel wrote:
>>> Please remember to add what build configuration you used. (You can just
>>> paste it from the BitBake output.)
>>
>> You asked this several times on the list but this part is not in the commit
>> log policy : http://wiki.openembedded.org/index.php/Commit_log_example
>
> I know and therefore I do *not* NACK patches and even commit them if the
> build configuration is not in the commit message. Still I think it
> belongs to useful commit messages to be able to reproduce something and
> therefore I am asking for it.
>
maybe this information could go under the commit log, between two --- lines as 
this makes git log more difficult to read and this information in mostly 
useful for patch review.

Eric


