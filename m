Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1MDxAG-0000wt-IA
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Jun 2009 10:58:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 19B5E2C81A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jun 2009 08:47:40 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n1DOsdwb+APx
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jun 2009 08:47:38 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTP id 6B4282C814
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jun 2009 08:47:38 +0000 (UTC)
Message-ID: <4A2E2208.3050608@gmail.com>
Date: Tue, 09 Jun 2009 10:49:12 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A1C4DB6.6080005@gremlin.it>
In-Reply-To: <4A1C4DB6.6080005@gremlin.it>
Subject: Re: [PATCH] kaeilos.conf and SPLASH
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
X-List-Received-Date: Tue, 09 Jun 2009 08:58:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Alessandro GARDICH ha scritto:
> Hi
> 
> Make kaeilos.conf be aware of the new SPASH variable used in images
> recipes.
> 
> At least it make bitbake start work, as soon as build the x11-image I'll
> check if also the image is working proper
> 
> Alessandro
> 
> 

Thank you for the patch.

Acked-by: Marco Cavallini  <m.cavallini@koansoftware.com>




