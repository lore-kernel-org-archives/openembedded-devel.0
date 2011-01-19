Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dp@xora.org.uk>) id 1PfTt0-0004kO-7a
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 09:59:26 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 1175BA452B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 08:58:48 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 6sYf0KPHlloV
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 08:58:47 +0000 (GMT)
Received: from [192.168.1.10] (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 694D0A4522
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 08:58:47 +0000 (GMT)
Message-ID: <4D36A7C6.1050308@xora.org.uk>
Date: Wed, 19 Jan 2011 08:58:46 +0000
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295027350.14388.6527.camel@rex>	<AANLkTi=QXykmerKTJJgCNDbqSE18_3Jhqj1utKmf1Ynw@mail.gmail.com>	<4D353F81.50301@xora.org.uk>	<AANLkTi=WOr_395Tya3GOhyLpg1oj9stLxSWdgo--uAhz@mail.gmail.com>	<4D35C5C3.60205@mentor.com>
	<ih4s84$gbj$1@dough.gmane.org>	<4D35FC8B.1090404@mentor.com>
	<ih52qr$l1v$1@dough.gmane.org>
	<AANLkTi=A2kgqgkhfw4p_Og8k9y1MBMrZLDvgwuq5Mxfj@mail.gmail.com>
In-Reply-To: <AANLkTi=A2kgqgkhfw4p_Og8k9y1MBMrZLDvgwuq5Mxfj@mail.gmail.com>
X-Enigmail-Version: 1.1.1
Subject: Re: Yocto Project and OE - Where now?
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
X-List-Received-Date: Wed, 19 Jan 2011 08:59:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 19/01/2011 08:45, Frans Meulenbroeks wrote:
>
>> * The maintainer can have as many versions as he wants to.
> my preference: not in the main layer.
>

I suspect all that is going to happen with this attitude is the recipes
in the main layer will end up not maintained as the recipe maintainer
will just maintain them in his own layer. Leading to fracturing of OE
which is what we are trying to prevent. Sometimes you are just going to
have to accept that the recipe maintainer knows best and knows what he
is doing.

Graeme



