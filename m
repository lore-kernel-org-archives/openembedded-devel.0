Received: from [213.186.62.213] (helo=30.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1Mld9c-0003hs-7j
	for openembedded-devel@openembedded.org; Thu, 10 Sep 2009 08:29:15 +0200
Received: (qmail 31136 invoked by uid 503); 10 Sep 2009 06:28:56 -0000
Received: from b6.ovh.net (HELO mail30.ha.ovh.net) (213.186.33.56)
	by 30.mail-out.ovh.net with SMTP; 10 Sep 2009 06:28:56 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 10 Sep 2009 06:26:37 -0000
Received: from tal33-2-82-228-175-43.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.228.175.43)
	by ns0.ovh.net with SMTP; 10 Sep 2009 06:26:36 -0000
Message-ID: <4AA89C9C.5080207@eukrea.com>
Date: Thu, 10 Sep 2009 08:28:44 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4AA3ABA8.304@eukrea.com>
	<4AA74FEE.8060809@eukrea.com>	<4AA825DF.70003@4d-electronics.co.nz>	<200909100412.56615.holger+oe@freyther.de>
	<4AA87037.3030708@4d-electronics.co.nz>
In-Reply-To: <4AA87037.3030708@4d-electronics.co.nz>
X-Ovh-Tracer-Id: 11248865969866779977
X-Ovh-Remote: 82.228.175.43 (tal33-2-82-228-175-43.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 213.186.62.213
X-SA-Exim-Mail-From: eric@eukrea.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: qt4-embedded & tslib
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
X-List-Received-Date: Thu, 10 Sep 2009 06:29:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Matthew Dombroski a écrit :
> On 10/09/09 14:12, Holger Hans Peter Freyther wrote:
>> Can you provide us with the output of the failure?
>>    
> 
> runtime failure:
> 
> # app  -qws
> Couldnt load module pthres
> QWSTslibMouseHandlerPrivate: ts_config() failed with error: 'No such 
> file or directory'
> Please check your tslib installation!
> 
same thing here. I'll send you the strace later.

Eric


