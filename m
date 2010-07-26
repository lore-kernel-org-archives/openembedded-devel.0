Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eblima@gmail.com>) id 1OdSC5-0007ft-A0
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 20:14:29 +0200
Received: by gwb15 with SMTP id 15so179173gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 11:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=WWEb1WV+2AycrINrXCkFcihnZBkTZju/zL1xkGaamls=;
	b=GXTov+5bh041arrmEU8jS/vO9+GIU/AheWS8wTc7tBzvZ5HOkXDkcbn1OoXEkVVrZU
	Ebw5zkoIsGw75+03jWQxuVpVPGnzj2xdTtSpd3QrkhiLTmQHQDamurhoqzJP2KKOLhTx
	tXsazbSo7PZ3Ox3wYEzVsLLmG3BmUr8P3hcIE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=GWC7vDsukoM4P77t95fvxnv1MzL1EAMC+nFKA3nDYMJ39UN70GfwSRkLuyHfFRl9SK
	z+nWe0tKlIz80iNc6XYlobAYkIReG8huB60pcZSZO/KYUIeQz6f7tst+6vn+huCVFO5c
	HuOM4byGxhp1xRYfULoaKhZfAH0oSegNJPsQE=
Received: by 10.100.50.33 with SMTP id x33mr8370118anx.79.1280168052563; Mon, 
	26 Jul 2010 11:14:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.176.77 with HTTP; Mon, 26 Jul 2010 11:13:52 -0700 (PDT)
In-Reply-To: <20100726175620.GA30949@rhein.zuhause.netz>
References: <AANLkTimz9CwgpLeXVJfSpML7Piqh3M53jsx-ALgTJ+ac@mail.gmail.com> 
	<20100726175620.GA30949@rhein.zuhause.netz>
From: "Eduardo Lima (Etrunko)" <eblima@gmail.com>
Date: Mon, 26 Jul 2010 15:13:52 -0300
Message-ID: <AANLkTi=G+LN=nGOpPY-+KEMzRkJZonY-CTDx=jHpxE=g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: eblima@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Recipes for cmake 2.8.2
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
X-List-Received-Date: Mon, 26 Jul 2010 18:14:30 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 26, 2010 at 2:56 PM, Henning Heinold
<heinold@inf.fu-berlin.de> wrote:
> Hi,
>
> no chance to use BBCLASSEXTENDED = "native" ?
>

Well, I'm quite new to the OE world, not very sure of what is the best
way to do things yet. How would it be implemented?

Best regards, Etrunko

-- 
Eduardo de Barros Lima
eblima@gmail.com


