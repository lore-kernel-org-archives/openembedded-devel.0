Received: from 9.77.mail-out.ovh.net ([87.98.189.41] helo=77.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PcjAD-0004mq-R3
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jan 2011 19:41:49 +0100
Received: (qmail 24091 invoked by uid 503); 11 Jan 2011 09:50:49 -0000
Received: from 64.mail-out.ovh.net (91.121.185.65)
	by 77.mail-out.ovh.net with SMTP; 11 Jan 2011 09:50:49 -0000
Received: (qmail 22802 invoked by uid 503); 11 Jan 2011 09:16:44 -0000
Received: from b6.ovh.net (HELO mail240.ha.ovh.net) (213.186.33.56)
	by 64.mail-out.ovh.net with SMTP; 11 Jan 2011 09:16:44 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 11 Jan 2011 11:35:20 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 11 Jan 2011 11:35:18 +0200
Message-ID: <4D2C2456.9050000@eukrea.com>
Date: Tue, 11 Jan 2011 10:35:18 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1293810428-31078-1-git-send-email-fransmeulenbroeks@gmail.com>	<1293810428-31078-2-git-send-email-fransmeulenbroeks@gmail.com>	<ifl85e$ets$1@dough.gmane.org>	<AANLkTikBC4nhO1ZSkuYcyoEPNonS4YeXCP6vzKJ3d3Fr@mail.gmail.com>	<4D1E32AF.70203@balister.org>	<AANLkTinDNZbGuuXj4rkkphC5bdN+zaLfc+TYYD5gQS+j@mail.gmail.com>	<1294680282.4307.7639.camel@mill.internal.reciva.com>	<AANLkTimXV8BGQf8DQ7rNqu42d2E-RFaEUYkfMEOLPh+6@mail.gmail.com>
	<4D2C22A3.3030602@xora.org.uk>
In-Reply-To: <4D2C22A3.3030602@xora.org.uk>
X-Ovh-Tracer-Id: 2618280234747276617
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
X-Ovh-Tracer-Id: 2880333438258621769
Subject: Re: [PATCH 2/2] omap4430-panda: fix u-boot
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
X-List-Received-Date: Tue, 11 Jan 2011 18:41:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/01/2011 10:28, Graeme Gregory wrote:
> If some distro does not have the sources in its fetchable list can the
> source archive not be copied to a more general source mirror?
>
more globally, shouldn't OE provide a source mirror for _everything_ which can 
be fetched by the project. This would avoid problems like handhelds.org's 
vanishing.

Eric


