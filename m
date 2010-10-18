Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1P7oYh-0001Fi-JU
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 14:11:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id F32CF8B9739
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 08:10:46 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 28769-05 for <openembedded-devel@lists.openembedded.org>; 
	Mon, 18 Oct 2010 08:10:46 -0400 (EDT)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 92EE48B91D3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 08:10:46 -0400 (EDT)
Date: Mon, 18 Oct 2010 08:10:46 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTikYuii4mEWxWh7HahgFVzYgaUz-DADyUyibqa4d@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1010180809080.5082@juice.ott.cti.com>
References: <1286544852-15635-1-git-send-email-msmith@cbnco.com>
	<AANLkTi=9bQq6q8NBTPgHhGMfmLs6Ae+oiLugNd+RyK=2@mail.gmail.com>
	<AANLkTikYuii4mEWxWh7HahgFVzYgaUz-DADyUyibqa4d@mail.gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] package.bbclass: copy dotfiles in root D to PKGD
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
X-List-Received-Date: Mon, 18 Oct 2010 12:11:21 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sun, 17 Oct 2010, Khem Raj wrote:

> which clarifies it more which means unfortunately we have to keep
> using 'cp' in this case.
> 
> is revert ok ?

Nice catch. I've reverted it and I'll send a new patch later today based 
on the discussion.

Mike


