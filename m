Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1St28o-0007Wr-CZ
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Jul 2012 21:48:34 +0200
Received: by weyr6 with SMTP id r6so3605288wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Jul 2012 12:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ry1GHOw4SP/avYDHzu81LnCzEvcyhPDC6bx5SIGCBBo=;
	b=V949IJIQ1Wqtqzm1Z+JhSma15m0gbyY+eD/uusIzPrRdVw4uBKt5A2IHhFYHcKq3BF
	7hMCwsDBanLtXMCKAZe7ekkR++ASwsublNCN5LVrQPe94qn2KWWCu+T6ROlHAb0yC0ck
	p11xq/ZXKkwCocxsanBRTirlfE1TXfJeJJkQC88J2KacIX6FENk8xXA2vQZjRmd/29x9
	wmP7p6AjDM1lmN/YVTk/UAqMkwWdJ9zaCauqThMnXmul5kNogn83P2H8+egg05UiGttk
	JSO7lu1foaK5KVnYkav4KCF7awnDVg9IFuV5FVKDqD6OqoJQ8NV0M1OZ7D1MbFR9hiUd
	p8dw==
Received: by 10.216.69.196 with SMTP id n46mr2131072wed.192.1342985828208;
	Sun, 22 Jul 2012 12:37:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.18.98 with HTTP; Sun, 22 Jul 2012 12:36:38 -0700 (PDT)
In-Reply-To: <36A04E8C-1673-4B9A-BA52-8486937FDD5D@gmail.com>
References: <6CD04095-FB33-40CA-9417-CF4208642BDC@gmail.com>
	<36A04E8C-1673-4B9A-BA52-8486937FDD5D@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 22 Jul 2012 12:36:38 -0700
Message-ID: <CAMKF1soMcO3LS5ngRH916jce1W4ahNPAdzSU++0ok+_qj294+Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yocto Discussion Mailing List <yocto@yoctoproject.org>
Subject: Re: cmake-native-2.8.5-r2.1 compile error
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
X-List-Received-Date: Sun, 22 Jul 2012 19:48:34 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jul 22, 2012 at 6:38 AM, Elvis Dowson <elvis.dowson@gmail.com> wrote:
>
> After updating the cmake and cmake-native recipes to v2.8.8, it compiles cleanly on Ubuntu 12.04 LTS 64-bit. I've sent patches to the openembedded developer mailing list.

if you read mailing lists you can avoid duplicating work. see
http://patchwork.openembedded.org/patch/32759/


