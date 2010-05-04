Received: from 27.mail-out.ovh.net ([91.121.30.210])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1O9PA4-0007sz-Ea
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 May 2010 22:56:14 +0200
Received: (qmail 16729 invoked by uid 503); 4 May 2010 20:56:56 -0000
Received: from b7.ovh.net (HELO mail606.ha.ovh.net) (213.186.33.57)
	by 27.mail-out.ovh.net with SMTP; 4 May 2010 20:56:56 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 4 May 2010 20:52:27 -0000
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 4 May 2010 20:52:25 -0000
Message-ID: <4BE08908.5080707@eukrea.com>
Date: Tue, 04 May 2010 22:52:24 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.1.9) Gecko/20100317 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1273004809-24230-1-git-send-email-eric@eukrea.com>
	<1273005248.2533.33.camel@trini-m4400>
In-Reply-To: <1273005248.2533.33.camel@trini-m4400>
X-Ovh-Tracer-Id: 9874423658161352009
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.30.210
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] python-m2crypto-native: Add recipe
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
X-List-Received-Date: Tue, 04 May 2010 20:56:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Le 04/05/2010 22:34, Tom Rini a écrit :
> On Tue, 2010-05-04 at 22:26 +0200, Eric Benard wrote:
>> - this package is needed to compile crda
>>
>> Signed-off-by: Eric Benard<eric@eukrea.com>
>
> Any reason we can't use BBCLASSEXTENDS?
>
no good reason found, actually testing and patch should follow.

Thanks
Eric


