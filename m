Received: from 1.26.mail-out.ovh.net ([46.105.43.121] helo=26.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1QLCs9-0001AR-I5
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 May 2011 13:19:02 +0200
Received: (qmail 13805 invoked by uid 503); 14 May 2011 10:35:58 -0000
Received: from b6.ovh.net (HELO mail426.ha.ovh.net) (213.186.33.56)
	by 26.mail-out.ovh.net with SMTP; 14 May 2011 10:35:58 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 14 May 2011 13:09:31 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 14 May 2011 13:09:30 +0200
Message-ID: <4DCE62E9.8020206@eukrea.com>
Date: Sat, 14 May 2011 13:09:29 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc14
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4DCE5B14.3090106@freyther.de>
In-Reply-To: <4DCE5B14.3090106@freyther.de>
X-Ovh-Tracer-Id: 7127509360706170185
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: perl-native build failures on Ubuntu 11.04 in a Linux Container
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
X-List-Received-Date: Sat, 14 May 2011 11:19:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/05/2011 12:36, Holger Freyther wrote:
> does anyone else see build errors with perl-native? The linker line looks
> innocent but libc and pthread symbols can not be resolved...
>
I think this is the problem reported (with a patch & comments) in this thread 
: http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-May/032371.html

Eric


