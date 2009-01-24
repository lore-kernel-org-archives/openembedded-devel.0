Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1LQqfb-0000dp-Rl
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Jan 2009 23:08:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 24DDB2C8A6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Jan 2009 22:00:27 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IQFbyZ0RQiae
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Jan 2009 22:00:25 +0000 (UTC)
Received: from [10.1.10.2] (host61-87-static.14-79-b.business.telecomitalia.it
	[79.14.87.61]) by wiki.koala.it (Postfix) with ESMTP id 8699D2C8A2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Jan 2009 22:00:25 +0000 (UTC)
Message-ID: <497B8F8D.2090205@gmail.com>
Date: Sat, 24 Jan 2009 23:00:45 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: KOAN sas - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4976D10A.9050000@gmx.net>
	<497B1685.20504@gmail.com>	<glf66f$p9u$1@ger.gmane.org>
	<200901241845.44831.openembedded@haerwu.biz>
In-Reply-To: <200901241845.44831.openembedded@haerwu.biz>
Subject: Re: FOSDEM OE stand
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
X-List-Received-Date: Sat, 24 Jan 2009 22:08:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Marcin Juszkiewicz ha scritto:
> On Saturday 24 of January 2009 14:47:58 Koen Kooi wrote:
>> On 24-01-09 14:24, Marco Cavallini wrote:
>>> Florian Boor ha scritto:
>>>> Just apart from the fact that I'd like to
>>>> see some other architectures than ARM at our stand.
>>> What about this Vortex86SX ?
> 
>>> If someone could help me creating a configuration for this machine,
>>> we could show it FOSDEM OE stand :-)
> 
>> Try making a copy of qemux86.conf, that builds and works.
> 
> Vortex86sx is i486 based non-FPU device so rather base on x86 + proper 
> kernel config.

x86 is broken, I was only able to build i586-generic :-(

--
Marco



