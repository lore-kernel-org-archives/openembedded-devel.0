Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OtOfO-0000Vn-C2
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 19:42:41 +0200
Received: by iwn2 with SMTP id 2so195308iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Sep 2010 10:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=BUMcYTdtTF1ZGcUqq2wwknmo2bkYGoM5MZfb0nkF+uE=;
	b=PrlyXmC0JBjVqwu6H7bCU4zUjF88H0CPU9n9Uvso5VEFNvEkNh30BDWi0aCFpsw4RM
	HWhzvhqnNlSl2vOpXecvKSkUm/XVJ2OEAvxatYSbTLQRR9M20aWoEFk2d9Q0lh97HVuG
	uUZyt3IxUvi3GcPK2eNq9TSizlTOjT4mPSxIQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=cWYW0fHl66d3pR8ERT2LzV2KqTer8AiGY554MS7jxby4Z3am2iRMxO9ICRVA4pGiDZ
	q3pHve8eTVZp2xghaZPmGHxDBtTj4J2Ec0tT6QVtK5yQDMpILd6Ga8iGNxEGz7jrM54X
	yB3DDa9VkFhPOyNY43dqD7s8cl6/4zuysyXIU=
Received: by 10.231.148.85 with SMTP id o21mr10065643ibv.26.1283967717740;
	Wed, 08 Sep 2010 10:41:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.205.134 with HTTP; Wed, 8 Sep 2010 10:41:37 -0700 (PDT)
In-Reply-To: <4C87A071.9020908@dresearch.de>
References: <4C86151D.50801@dresearch.de>
	<1283947246-30457-1-git-send-email-sledz@dresearch.de>
	<4C877B47.8020609@xora.org.uk> <4C87A071.9020908@dresearch.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Sep 2010 10:41:37 -0700
Message-ID: <AANLkTimG9OBesBqC_0Y4JnPZjAVcxbvmurojfZDOpOOw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gtk+: fix configure problem for native build
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
X-List-Received-Date: Wed, 08 Sep 2010 17:42:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Sep 8, 2010 at 7:40 AM, Steffen Sledz <sledz@dresearch.de> wrote:
> Patch pushed to the testing-next branch by mistake. :(
>

Well you should push it to org.openembedded.dev as well. or may be we
could merge back testing-next into org.openembedded.dev
after this cycle.

> Big problem?
>
> Sorry,
> Steffen
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


