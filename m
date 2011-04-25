Received: from 1.26.mail-out.ovh.net ([46.105.43.121] helo=26.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1QET0E-0007Es-3J
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 23:07:30 +0200
Received: (qmail 16909 invoked by uid 503); 25 Apr 2011 18:45:01 -0000
Received: from b6.ovh.net (HELO mail94.ha.ovh.net) (213.186.33.56)
	by 26.mail-out.ovh.net with SMTP; 25 Apr 2011 18:45:00 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 25 Apr 2011 21:18:18 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 25 Apr 2011 21:18:17 +0200
Message-ID: <4DB5C8F8.9070406@eukrea.com>
Date: Mon, 25 Apr 2011 21:18:16 +0200
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.15) Gecko/20110307 Fedora/3.1.9-0.39.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1303756273-22385-1-git-send-email-tom_rini@mentor.com>	<1303756273-22385-4-git-send-email-tom_rini@mentor.com>	<1303757678.15311.113.camel@mattotaupa>
	<4DB5C602.60703@mentor.com>
In-Reply-To: <4DB5C602.60703@mentor.com>
X-Ovh-Tracer-Id: 14481606077285641545
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: [PATCH 3/3] bluez4: Add 4.91 and make it default for	Angstrom
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
X-List-Received-Date: Mon, 25 Apr 2011 21:07:30 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

On 25/04/2011 21:05, Tom Rini wrote:
>> Please create the patch next time adding `-M -C -C` to `git
>> format-patch`.
>
> Is there a way to shove that into ~/.gitconfig?  Otherwise I'm sure to
> forget.
>
http://www.kernel.org/pub/software/scm/git/docs/git-config.html :
diff.renames

     Tells git to detect renames. If set to any boolean value, it will enable 
basic rename detection. If set to "copies" or "copy", it will detect copies, 
as well.

Eric


