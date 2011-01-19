Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PfeAl-0006qP-Oa
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 20:58:27 +0100
Received: (qmail 23509 invoked by uid 503); 19 Jan 2011 20:01:23 -0000
Received: from b7.ovh.net (HELO mail406.ha.ovh.net) (213.186.33.57)
	by 26.mail-out.ovh.net with SMTP; 19 Jan 2011 20:01:23 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 19 Jan 2011 21:57:49 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 19 Jan 2011 21:57:48 +0200
Message-ID: <4D374239.8070001@eukrea.com>
Date: Wed, 19 Jan 2011 20:57:45 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295452649-28081-1-git-send-email-eric@eukrea.com>	<AANLkTi=sg0AdyJQgmvim794R17JZ5zyM67mD-Xy43vaP@mail.gmail.com>
	<AANLkTikHRUGO7i3pVvcJ+46gVQUOXnOo3KXgkszY-AGT@mail.gmail.com>
In-Reply-To: <AANLkTikHRUGO7i3pVvcJ+46gVQUOXnOo3KXgkszY-AGT@mail.gmail.com>
X-Ovh-Tracer-Id: 4772689705173167433
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: [PATCH 1/2] busybox: enable CONFIG_RUN_PARTS if default.script is to be installed
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
X-List-Received-Date: Wed, 19 Jan 2011 19:58:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 19/01/2011 19:56, Frans Meulenbroeks wrote:
> 2011/1/19 Khem Raj<raj.khem@gmail.com>:
>> On Wed, Jan 19, 2011 at 7:57 AM, Eric Bénard<eric@eukrea.com>  wrote:
>>> Signed-off-by: Eric Bénard<eric@eukrea.com>
>>
>> Looks ok.
>>
>> Acked-by: Khem Raj<raj.khem@gmail.com>
>
> Would this need an INC_PR bump?
defconfig in the tree already have CONFIG_RUN_PARTS=y so existing packages 
won't get any change with that patch.

Eric


