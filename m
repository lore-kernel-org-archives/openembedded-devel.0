Received: from 29.mail-out.ovh.net ([87.98.216.213])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1ONsuP-0001Bx-Ea
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Jun 2010 21:31:54 +0200
Received: (qmail 30651 invoked by uid 503); 13 Jun 2010 19:31:49 -0000
Received: from b6.ovh.net (HELO mail99.ha.ovh.net) (213.186.33.56)
	by 29.mail-out.ovh.net with SMTP; 13 Jun 2010 19:31:49 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 13 Jun 2010 21:27:28 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 13 Jun 2010 21:27:28 +0200
Message-ID: <4C153113.5030503@eukrea.com>
Date: Sun, 13 Jun 2010 21:27:15 +0200
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.1.9) Gecko/20100317 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20100612115448.24640@gmx.net>
In-Reply-To: <20100612115448.24640@gmx.net>
X-Ovh-Tracer-Id: 3539829308785470793
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 87.98.216.213
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: live555_20100529.bb broken
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
X-List-Received-Date: Sun, 13 Jun 2010 19:31:54 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 12/06/2010 13:54, "Andreas Müller" a écrit :
> At http://www.live555.com/liveMedia/public/
>
> live555_20100529.tar.gz seems to have changed to live.2010.06.11.tar.gz.
>
the problem is that they don't keep the previous release so unless they 
are mirrored  somewhere this recipes will always be broken after each 
new release.

Is there a way to force the mirroring of a source archive to one of the 
OpenEmbedded mirrors ?

Eric


