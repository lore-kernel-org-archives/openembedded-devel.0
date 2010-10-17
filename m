Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1P7XgM-0001XK-0V
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Oct 2010 20:10:06 +0200
Received: (qmail 25488 invoked by uid 503); 17 Oct 2010 18:36:59 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 17 Oct 2010 18:36:59 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 17 Oct 2010 20:09:30 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 17 Oct 2010 20:09:29 +0200
Message-ID: <4CBB3BD7.7030909@eukrea.com>
Date: Sun, 17 Oct 2010 20:09:27 +0200
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.9) Gecko/20100915 Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <FD3ED125-4701-4F36-88EA-E70AAB057103@chumby.com>	<4CBB3187.6010100@eukrea.com>
	<1287337043.3748.16.camel@mattotaupa>
In-Reply-To: <1287337043.3748.16.camel@mattotaupa>
X-Ovh-Tracer-Id: 4312478120141040969
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.56
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] live555: Add version 20101015 and remove older versions
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
X-List-Received-Date: Sun, 17 Oct 2010 18:10:06 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Le 17/10/2010 19:37, Paul Menzel a écrit :
> Am Sonntag, den 17.10.2010, 19:25 +0200 schrieb Eric Bénard:
>> 2010.05.29&  2010.04.09&  2009.06.02 are mirrored on angstrom's sources mirror :
>> http://www.angstrom-distribution.org/unstable/sources/
>
> Do you need the recipes for the old versions?
>
as it's difficult to follow live555's recipes because they always remove the 
previous source archive, we put the one we are using in an overlay with its 
source archive and are using this one and not those of OE so no I actually 
don't need them.

Eric


