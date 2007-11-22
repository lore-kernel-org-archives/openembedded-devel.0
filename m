Received: from [62.70.27.18] (helo=esparsett.troll.no)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lpotter@trolltech.com>) id 1Iv3a4-0004eE-MZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2007 05:22:24 +0100
Received: from esparsett.troll.no (localhost [127.0.0.1])
	by localhost (Postfix) with SMTP id 0A70274256
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2007 05:20:06 +0100 (CET)
Received: from mail.trolltech.com.au (unknown [10.1.1.12])
	by esparsett.troll.no (Postfix) with ESMTP id 9F02574246
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2007 05:20:05 +0100 (CET)
Received: from [10.1.1.181] (polarbear-replace.trolltech.com.au [10.1.1.181])
	by mail.trolltech.com.au (Postfix) with ESMTP id 1F1A53AB22B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2007 14:20:04 +1000 (EST)
Message-ID: <47450371.9050005@trolltech.com>
Date: Thu, 22 Nov 2007 14:20:01 +1000
From: Lorn Potter <lpotter@trolltech.com>
User-Agent: Thunderbird 2.0.0.0 (X11/20070326)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20071119120819.GA17788@lenovo>	<47419EA0.4030308@student.utwente.nl>	<4742217C.9060506@whitby.id.au>	<74d0deb30711200112x17ad31fej4b25840a74e05abb@mail.gmail.com>	<4743201F.8000202@am.sony.com>
	<617697824.20071121042405@gmail.com>	<4743C5B8.4030209@whitby.id.au>
	<774364350.20071122023548@vanille-media.de>
In-Reply-To: <774364350.20071122023548@vanille-media.de>
Subject: Re: Getting Started -Makefile
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
X-List-Received-Date: Thu, 22 Nov 2007 04:22:24 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Michael 'Mickey' Lauer wrote:

> Guilty as charged. Lets try not to force these people to use OE -- we
> can do this by releasing prebuilt toolchains. I'm going to start with
> releasing an OpenMoko toolchain next week.


FYI, We have had a toolchain released when we first released Qtopia for 
Neo tech preview, built with CROSS_DIR = "/opt/toolchains/arm920t-eabi". 
I put it there because that is where the greenphone toolchain lived.

It would be nice if we were to use the same location for toolchains. So 
perhaps you could use our location? :)



