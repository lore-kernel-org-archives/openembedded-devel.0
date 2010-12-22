Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PVVuo-0007uJ-8z
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 22:08:06 +0100
Received: (qmail 30157 invoked by uid 503); 22 Dec 2010 21:05:17 -0000
Received: from b9.ovh.net (HELO mail611.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 22 Dec 2010 21:05:17 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 22 Dec 2010 23:01:18 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 22 Dec 2010 23:01:17 +0200
Message-ID: <4D12671D.1050008@eukrea.com>
Date: Wed, 22 Dec 2010 22:01:17 +0100
From: =?windows-1252?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <ABD557DA-5595-4CD8-AE87-C5FCC45F41BF@mac.com>
In-Reply-To: <ABD557DA-5595-4CD8-AE87-C5FCC45F41BF@mac.com>
X-Ovh-Tracer-Id: 7430094960780619081
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: compat-wireless recipe
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
X-List-Received-Date: Wed, 22 Dec 2010 21:08:06 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 22/12/2010 20:51, Elvis Dowson wrote:
>        Is there a recipe for compat-wireless?
>
> http://linuxwireless.org/en/users/Download/stable/
>
> Support for the TI wl1271 wlan module is only available in mainline kernel 2.6.37-rc6 onwards, and the compat-wireless package provides backports of the wl1271 driver for android-kernel-2.6.32.
>
> http://linuxwireless.org/en/users/Drivers/wl12xx
>
> I just need a recipe to incorporate it into my root file system build.
>
> Here is the full logical flow to replicating the process, if someone could help me write a recipe for this, it would be great. I can write simple recipes based off git and local file repos, but I don't know how to handle and process the compat-wireless ways of dealing with things.
>
I did one which worked on x86 but didn't have time to update/test it for 
integration. You can find it here :
http://patchwork.openembedded.org/patch/2013/

Eric


