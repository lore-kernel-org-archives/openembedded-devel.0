Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QvfPc-0004Dk-99
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Aug 2011 03:04:25 +0200
Received: by vxj14 with SMTP id 14so4956619vxj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2011 17:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=0URQ3Gu4n9+cN9uf6c4HtCxPaiUOkCqmoFn49CUULJg=;
	b=amAKqB2iwg/zLqdoPdvP1oDcsKTCIqtFNlvsB8SbA6n+w6JbrEt6EOZ1U+4YhIx73y
	ldfOl3AH447GymWFPfH9v836OJsUIJXYqswrBF3IHStDyuwNx/nMhYdMnRCEd5gNo4rB
	SMoug7oxmcuqDIT9eoDKt+64YqewYUjuv8AXM=
Received: by 10.52.95.229 with SMTP id dn5mr2614295vdb.431.1314061171063; Mon,
	22 Aug 2011 17:59:31 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.108.229 with HTTP; Mon, 22 Aug 2011 17:59:11 -0700 (PDT)
In-Reply-To: <j2ucb2$fdd$4@dough.gmane.org>
References: <201101310012.51498.schnitzeltony@gmx.de>
	<1296461709.3922.4.camel@mattotaupa>
	<20110131090826.149890@gmx.net>
	<989A078976CDAD4CB2DC976EEF70E2A5068A53EB@eu2-mail.mgc.mentorg.com>
	<1314003805.12202.14.camel@mattotaupa> <j2ucb2$fdd$4@dough.gmane.org>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 22 Aug 2011 17:59:11 -0700
X-Google-Sender-Auth: 63_WIxXF39zztWNbz262sDAmr0s
Message-ID: <CABcZANne7vwE+OnP4hEkkvCHo=3mo0g8egWe2_S-vPV5PFd-hA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] need to add some verfication package recipes
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
X-List-Received-Date: Tue, 23 Aug 2011 01:04:25 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 22, 2011 at 12:57 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Op 22-08-11 11:03, Paul Menzel schreef:
>
>> It would be nice if the oe-core folks can comment too in case these recipes should go into oe-core some day.
>
> OE-core needs to get smaller, not bigger.

Regarding where recipes go, am I the only one that finds the
recipes-*/ directories just annoying for day to day use? The breakdown
might make sense from a categorical viewpoint, but as someone looking
to modify a recipe, it's a crapshoot trying to find anything. I resort
to shell globbing or find commands, every time.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


