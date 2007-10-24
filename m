Received: from [89.96.204.112] (helo=www-zirak-new.zirak.it)
	by linuxtogo.org with smtp (Exim 4.67) (envelope-from <phy@linux.it>)
	id 1Ikm71-0002nB-OZ
	for openembedded-devel@openembedded.org; Wed, 24 Oct 2007 21:41:55 +0200
Received: (qmail 15858 invoked by uid 64017); 24 Oct 2007 19:01:36 -0000
Received: from 82.58.178.124 (filippo@zirak.it@82.58.178.124) by www-zirak-new
	(envelope-from <phy@linux.it>, uid 64011) with qmail-scanner-2.01 
	(uvscan: v5.1.00/v5052. bogofilter: 0.92.0. spamassassin: 3.0.4.  
	Clear:RC:1(82.58.178.124):. 
	Processed in 0.011691 secs); 24 Oct 2007 19:01:36 -0000
Received: from unknown (HELO ?192.168.1.6?) (filippo@zirak.it@82.58.178.124)
	by www-zirak-new.zirak.it with SMTP; 24 Oct 2007 19:01:36 -0000
Message-ID: <471F981E.30909@linux.it>
Date: Wed, 24 Oct 2007 21:08:14 +0200
From: Filippo Basso <phy@linux.it>
User-Agent: IceDove 1.5.0.12 (X11/20070730)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <470B9D9D.5080501@linux.it> <470D6A2C.1000909@linux.it>
In-Reply-To: <470D6A2C.1000909@linux.it>
Subject: Re: different hosts, different OE images
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Oct 2007 19:41:56 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Hi,
    can someone tell me if this is an important point, or if I'm just
missing something ?!?
I've seen that 3 host machines (with different linux distros) gave me 3
different OE results (for i586), one is okay, one is not compiling, one
the image has a big problem at login...

I want to investigate a bit, some hints ? Just a starting point.....
I think that one of the most important points of OE is that is largely
independent of host machine, right?!?
    thank you, phy





>> I understood that the results should be highly independent from host
>> system, so I begun debugging a bit.
>>   
>>     
> Hi everybody,
>     my investigation is going ahead...
> The main point is: an image should be highly independent from the host
> system, but seems that I've some problem in this regards... maybe my
> mistake, but should be understood.
>
> Another machine (Ubuntu) gave even another different runtime result... :-(


