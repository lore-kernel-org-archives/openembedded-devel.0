Received: from [91.198.206.2] (helo=mail.smartlink.ee)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kalev@smartlink.ee>) id 1KlNiu-0007AP-Gr
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Oct 2008 14:56:04 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.smartlink.ee (Postfix) with ESMTP id E189B30E07
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Oct 2008 15:51:52 +0300 (EEST)
Received: from mail.smartlink.ee ([127.0.0.1])
	by localhost (mail.smartlink.ee [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cP+90BGOolv5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Oct 2008 15:51:52 +0300 (EEST)
Received: from [192.168.2.59] (wumpus.smartlink [192.168.2.245])
	by mail.smartlink.ee (Postfix) with ESMTP id 0FCC030D3A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Oct 2008 15:51:52 +0300 (EEST)
Message-ID: <48E4C3E1.9040302@smartlink.ee>
Date: Thu, 02 Oct 2008 15:51:45 +0300
From: Kalev Lember <kalev@smartlink.ee>
User-Agent: Thunderbird 2.0.0.17 (X11/20080926)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <48E36C18.4090504@smartlink.ee>
	<gc017m$gq4$1@ger.gmane.org>	<48E4082D.9030000@whitby.id.au>
	<200810020243.50896.zecke@selfish.org>
	<f96d234e0810020449p5f175b2ek8f3c46e321cdeb19@mail.gmail.com>
In-Reply-To: <f96d234e0810020449p5f175b2ek8f3c46e321cdeb19@mail.gmail.com>
Subject: Re: I'm sick of that Was Re: git master not updating
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
X-List-Received-Date: Thu, 02 Oct 2008 12:56:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Cliff Brake wrote:
> I would like to extend a big thank you, RP, and others for setting
> this up and keeping this going.  Having the git mirror has made
> supporting new OE users a _lot_ easier, and I am very dependent on it.
>  It is my opinion that keeping this migration moving is fairly
> important.  While monotone has served the active OE developers well,
> it is fairly tedious explaining how it works to new users, and is
> somewhat of a barrier to confidence in the project.
>   

I'd like to thank everyone who has kept git conversion going too.

I've personally been using monotone, mostly because it was the only way
to access OE repository a few years ago and it's still needed to get my
patches into OE tree. However, I also think that git might make it
easier to get new people to the project.

And thanks for getting rid of the master branch, the git tree layout is
now much easier to understand.

Thanks,
Kalev


