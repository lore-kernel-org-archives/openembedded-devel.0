Received: from [64.233.182.190] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1GaH14-0001Ri-2q
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Oct 2006 21:23:50 +0200
Received: by nf-out-0910.google.com with SMTP id l23so768131nfc
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Oct 2006 12:16:51 -0700 (PDT)
Received: by 10.48.202.19 with SMTP id z19mr4380284nff;
	Wed, 18 Oct 2006 12:16:50 -0700 (PDT)
Received: from CUBE ( [82.193.96.234])
	by mx.google.com with ESMTP id m15sm2098140nfc.2006.10.18.12.16.49;
	Wed, 18 Oct 2006 12:16:50 -0700 (PDT)
Date: Wed, 18 Oct 2006 22:16:54 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1578527834.20061018221654@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <b9481e140610181119h27e8c720u69c20fad5e9de06@mail.gmail.com>
References: <b9481e140610180154r5a3c5c0do543863a9b0b4c059@mail.gmail.com>
	<200610181240.31042.openembedded@hrw.one.pl>
	<b9481e140610181119h27e8c720u69c20fad5e9de06@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: Bitbake: say who you are cooking
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Oct 2006 19:23:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Nicolas,

Wednesday, October 18, 2006, 9:19:37 PM, you wrote:

> This is more verbose, but still it will tell me what version of the
> package it will build only after having built all the dependencies. It
> should tell the version it will compile before going with the
> dependencies.

  Well, there're pretty many things which bitbake really should do,
including many small good things like this ;-).

  From a quick look, it would be relatively easy to do this, at least
PV is kept in BB's cache. So, if you can grok Python, patches are
welcome (or if you don't, there're yet few weeks before the OE bugday
;-) ).

[]

-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



