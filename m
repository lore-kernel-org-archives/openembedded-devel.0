Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UWoet-0000EQ-E2
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Apr 2013 16:02:38 +0200
Message-ID: <517E7938.1000200@communistcode.co.uk>
Date: Mon, 29 Apr 2013 14:44:24 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130403 Thunderbird/17.0.5
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1367241822-9111-1-git-send-email-ml@communistcode.co.uk>
	<20130429134047.GI3199@jama>
In-Reply-To: <20130429134047.GI3199@jama>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 0/3] php: further clean-ups
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
X-List-Received-Date: Mon, 29 Apr 2013 14:02:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 29/04/13 14:40, Martin Jansa wrote:
> On Mon, Apr 29, 2013 at 02:23:39PM +0100, Jack Mitchell wrote:
>> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>>
>> Few more PHP clean-up patches, some testing on more esoteric hardware would
>> be nice, but I don't forsee any problems (famous last words...).
> Thanks for cleanup patches, are you also using modphp? In last jenkins
> builds I've noticed that php and modphp recipes are trying to install
> conflicting files in sysroot (and only first one successfully) can you
> check if they can be altered to install them correctly or even better,
> there was some thread about building cgi and fpm together, what about
> building all 4 +cli +modphp in one recipe with few PACKAGECONFIGs?
>
> Cheers,
>
>

I think that would be a fantastic idea, I don't really understand why 
modphp and php are different recipes really.

However, I don't use modphp and I'm not sure I have the skills to merge 
them properly. I will have a look and see if I can do anything.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



