Received: from [91.121.26.226] (helo=2.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1N8uDC-0003Za-AR
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 12:21:09 +0100
Received: (qmail 17613 invoked by uid 503); 13 Nov 2009 11:59:38 -0000
Received: from b6.ovh.net (HELO mail606.ha.ovh.net) (213.186.33.56)
	by 2.mail-out.ovh.net with SMTP; 13 Nov 2009 11:59:38 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 13 Nov 2009 11:13:20 -0000
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 13 Nov 2009 11:13:18 -0000
Message-ID: <4AFD3F42.5010309@eukrea.com>
Date: Fri, 13 Nov 2009 12:13:06 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <alpine.LFD.2.00.0911130555020.3622@localhost>
In-Reply-To: <alpine.LFD.2.00.0911130555020.3622@localhost>
X-Ovh-Tracer-Id: 4561583473705135433
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.26.226
X-SA-Exim-Mail-From: eric@eukrea.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: how to remove all traces of a previous package build?
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
X-List-Received-Date: Fri, 13 Nov 2009 11:21:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi Robert,

Robert P. J. Day a écrit :
>   surely a dumb question, but what's the recipe for deleting every
> trace of a single previous package build, so i know i'm rebuilding it
> absolutely from step one?  i'll use that to test a rebuild of the
> packages that are failing for me.
> 
I think bitbake -c clean package does what you want.

Eric


