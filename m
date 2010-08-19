Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1OlyPm-0004Nd-2o
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 08:16:19 +0200
Received: by fxm6 with SMTP id 6so839674fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Aug 2010 23:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=/y0w7PSjJZEZnceZgU28IYm044MK9YJubHyHyza/G0Y=;
	b=R6EqTmcaJxDA5lN3Y2AFsOoPz2UGzTr4/TTSpYo/8pI/O0prOybLJAWbCo5FYd/DTq
	qU0SBEuHXd4FkPHRBMi/HPVc2FHCFJqL7faBN0NC6geHCIuDZ4q1nwN7jFs+buoPzXgE
	uEWiOsDkU8XaKu9nOUT/UKiXVBHW1yBpr1BJs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=f2EGhtATV4P7D8X7X5v9+34nBlnnTb8HUyyl64RUXVSAZQiUP15Um+HXJe5sAg7rXL
	6Ig355mLiAPMmruKJxIsK1XAtP5LNh4GOgtHhWYhqRKZEfmGJsnlfUfGhc+wfoiUfT+1
	AH2cv/coEVhb1jZvSErGWYV9UA3KXU+FRjee4=
Received: by 10.223.104.136 with SMTP id p8mr8687638fao.105.1282198530173;
	Wed, 18 Aug 2010 23:15:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.125.209 with HTTP; Wed, 18 Aug 2010 23:15:10 -0700 (PDT)
In-Reply-To: <1282198068-25415-1-git-send-email-coolaj86@gmail.com>
References: <1282198068-25415-1-git-send-email-coolaj86@gmail.com>
From: AJ ONeal <coolaj86@gmail.com>
Date: Thu, 19 Aug 2010 00:15:10 -0600
Message-ID: <AANLkTi=bCxyXU+mubbmFcrtUsHiVsmtsDw0235E69XRd@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	"General mailing list for gumstix users."
	<gumstix-users@lists.sourceforge.net>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] added a .bb for node.js
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
X-List-Received-Date: Thu, 19 Aug 2010 06:16:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

P.S. Is this correct way for me to add a recipe? I didn't notice a
particular document for it on the website.

AJ ONeal

