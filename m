Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1MOuqx-0004cA-Ss
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Jul 2009 16:44:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 062B52CA01
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jul 2009 14:30:46 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UeWKpIhzanmq
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jul 2009 14:30:44 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id 9D5532C9FF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jul 2009 14:30:43 +0000 (UTC)
Message-ID: <4A55FF61.8020501@gmail.com>
Date: Thu, 09 Jul 2009 16:32:01 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.22 (X11/20090608)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200907091522.22285.marcin@juszkiewicz.com.pl>
In-Reply-To: <200907091522.22285.marcin@juszkiewicz.com.pl>
Subject: Re: [RFC] Updating stable patches in linux recipes
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
X-List-Received-Date: Thu, 09 Jul 2009 14:44:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Marcin Juszkiewicz ha scritto:
> Hi
> 
> We have many Linux recipes in OE. Those which are used for many targets 
> (so mainly linux_2.6.xx ones) are usually using first release of kernel 
> without any stable updates. 
> 
> I would like to know what do you think about updating them to latest 
> stable updates (so 2.6.30.1, 2.6.29.6 etc) when new stable patch gets 
> released.

Hi,
that's a good idea, but could drive to a huge overhead.
What do you mean exactly with latest stable updates?
How frequently would you check the stable patch availability?

/marco


