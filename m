Received: from 2.27.mail-out.ovh.net ([46.105.37.238] helo=27.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PrwRO-0000u7-3x
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Feb 2011 18:54:26 +0100
Received: (qmail 22077 invoked by uid 503); 22 Feb 2011 18:46:02 -0000
Received: from b9.ovh.net (HELO mail194.ha.ovh.net) (213.186.33.59)
	by 27.mail-out.ovh.net with SMTP; 22 Feb 2011 18:45:56 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 22 Feb 2011 19:53:02 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 22 Feb 2011 19:53:00 +0200
Message-ID: <4D63F7F9.7000804@eukrea.com>
Date: Tue, 22 Feb 2011 18:52:57 +0100
From: Eric Benard <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTimy_TtONvPFjaGCUV0qxaM7qF0ENBx7A6wzRnPZ@mail.gmail.com>
In-Reply-To: <AANLkTimy_TtONvPFjaGCUV0qxaM7qF0ENBx7A6wzRnPZ@mail.gmail.com>
X-Ovh-Tracer-Id: 17869157423459118409
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: Weird behaviour with PPP
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
X-List-Received-Date: Tue, 22 Feb 2011 17:54:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 22/02/2011 18:22, Mickael Chazaux wrote:
> I have a hard time figuring out why bitbake seems to mix versions of
> ppp... Any ideas?
>
strange, which distro, git tag, bitbake version are you using ?

Both bitbake ppp-2.4.5 & bitbake -b openembedded/recipes/ppp/ppp_2.4.5.bb work 
fine here (angstrom 2008.1, armv5 target, bitbake 1.12.0).

Eric


