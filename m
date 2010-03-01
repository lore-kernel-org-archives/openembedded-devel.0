Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1NmDLa-0006Bg-U7
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 22:40:15 +0100
Received: by pwi5 with SMTP id 5so1916290pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Mar 2010 13:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=2SFKtWIbXWQP0oGfcDf7FahswSVby3XIKQok2huVDuU=;
	b=HpQT33nfDqJ0+0btsVFrnVrLOzEZQiUUrPQVCwBCYkycZxXjFS9YmuWj98WLGvj9/I
	2F22ZNQkHeulii8pydH6to3K7UXKsyd2nDos1BExrvbPa3ucTrVAJ+MGrL733SElAq7l
	9BoLJpmyTkWLAlgnz3XzqiJfKg6JnTw1JhgDw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=LSgb8f+oK5WYd6LcdApbaOWvWrbjAGffe7Bgj9/92kKrP6roiZyOprucyquRau0Ugx
	/UP3jnxuN9vaRHpcMPkfIStYVfe4HaasWxazUyyy2Ja3kNaDhQdBU3OEGCQQ3eSbxmnE
	pQbt7Lw9Uq1Vci2HfYYmIvkXqfAl/hWXm3HQ4=
MIME-Version: 1.0
Received: by 10.141.2.4 with SMTP id e4mr2810289rvi.192.1267479444027; Mon, 01 
	Mar 2010 13:37:24 -0800 (PST)
In-Reply-To: <E1Nm0HI-0004Qt-Pn@melo.openembedded.org>
References: <E1Nm0HI-0004Qt-Pn@melo.openembedded.org>
Date: Mon, 1 Mar 2010 22:37:23 +0100
Message-ID: <d1b08f941003011337i15e21dcx340cef502c2ea151@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Koen Kooi : angstrom: sync pango and pango-native versions
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
X-List-Received-Date: Mon, 01 Mar 2010 21:40:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

Thx, but after this patch I see

NOTE: preferred version 1.24.4 of pango-native not available (for item
pango-module-basic-x)
NOTE: preferred version 1.24.4 of pango-native not available (for item
pango-module-basic-fc)
NOTE: preferred version 1.24.4 of pango-native not available (for item
pango-native)

Andrea


