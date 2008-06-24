Received: from [200.234.205.219] (helo=hm633.locaweb.com.br)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <alainm@pobox.com>) id 1KB97T-0004x8-UK
	for openembedded-devel@openembedded.org; Tue, 24 Jun 2008 16:03:41 +0200
Received: (qmail 8465 invoked from network); 24 Jun 2008 14:01:40 -0000
Received: from unknown (10.1.10.145)
	by hm633.locaweb.com.br with QMQP; 24 Jun 2008 14:01:40 -0000
Received: from unknown (HELO alain.cosmodata.inet)
	(am@cosmodata.com.br@201.20.205.130)
	by hm145.locaweb.com.br with SMTP; 24 Jun 2008 14:01:54 -0000
Message-ID: <4860FE33.5010804@pobox.com>
Date: Tue, 24 Jun 2008 11:01:23 -0300
From: "Alain M." <alainm@pobox.com>
User-Agent: Thunderbird 2.0.0.6 (X11/20070728)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1213345201.13942.3.camel@dax.rpnet.com>
	<20080624095735.GB3500@aquilonia.hyboria>
In-Reply-To: <20080624095735.GB3500@aquilonia.hyboria>
Subject: Re: Switching SCM to git and commit/review policy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 24 Jun 2008 14:03:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi, I am really new here but I have one suggestion:

Graeme Gregory escreveu:
>> We've not made any decisions on what the commit/review policy should be,
> I have been thinking on this and here is my suggestion.
> 
> 1) OE-core - everything needed to get upto a successful glibc build
> completed so gcc, gcc-cross, binutils and support packages. Also most
> stuff in classes/. Breakages in these two areas are what hurts the most
> and the area we have the least manpower in.

I like this

> 2) OE-universe - all the other stuff, the recipes and distro configs.
> The stuff where breakage tends to be less painful we keep as is. With
> people not being afraid to got git-revert on stupid changes. Yes you do
> need to test building all users of a .inc file or patch when you change
> them.

Is it concievable this being divided by packages, or even groups of 
packages? Somewhat like Linux packages... It would surely make reviews 
simpler.

I have been impressed by the huge size of OpenEmbedded. But I don't 
really understand it's inner workings enough to know if this is at all 
possible, but it sounds desirable :)

> Anyway thats my 2p.
2p more...

Alain



