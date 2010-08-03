Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OgEkd-0002Fg-1C
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Aug 2010 12:29:40 +0200
Received: by qyk11 with SMTP id 11so569331qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 03:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=iKxIcG+8eTQ7LXw1Jyl/QJAfVg317faCoA5HXqabuAc=;
	b=dVmFBWHCzUfaSWrFLTPwDw+6auGg+soU4h4oI7rBbnG9LWXInMvByqElC8vWSNDxAr
	AfkFtlZJQViCX/lPAbaHL9SiUzhSxaUL/9IbdAR3aTdR/AdfchO3L72+ldDCBKX3rS9Q
	HeiIFOlW+SZ9DhKf946vtzlFm3Zr1JPHqs2jk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=DmD1LIu5e7k3HNx3751maXn+o8ICY8dDBQ50+AbEpXwz4odpO7vhBm1RBvt9rDDZdr
	oTt8mAGJqoh1+JZ8Eiq2DCV1lk6ZcYJux0uyqhU0IS6xuftq267f8QCpoXsq5sDLxr8n
	gAsmFoikmoaYDYfM6cRHtRzJWA9igYMZKXFgM=
MIME-Version: 1.0
Received: by 10.229.225.10 with SMTP id iq10mr967078qcb.85.1280831369798; Tue, 
	03 Aug 2010 03:29:29 -0700 (PDT)
Received: by 10.229.185.213 with HTTP; Tue, 3 Aug 2010 03:29:29 -0700 (PDT)
In-Reply-To: <20100803102119.GB12134@jama>
References: <1280554451-27780-1-git-send-email-raj.khem@gmail.com>
	<i30rie$8aq$1@dough.gmane.org> <i318p1$ec3$1@dough.gmane.org>
	<i31rhg$4a8$1@dough.gmane.org> <i363dm$17p$1@dough.gmane.org>
	<AANLkTinE0=x74yBxHsGCpRLFoQfDF+gHeuHFMG=D+rY_@mail.gmail.com>
	<i38q56$4hq$1@dough.gmane.org> <20100803102119.GB12134@jama>
Date: Tue, 3 Aug 2010 12:29:29 +0200
Message-ID: <AANLkTi=QHeChjK2twtf99E=Z8c4aco6jNnG76E637rqj@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.175
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/5][v4] Make multi-machine toolchains to co-exist (Alternate approach)
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
X-List-Received-Date: Tue, 03 Aug 2010 10:29:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

Yes, seems working here (Angstrom armv5te + armv4 builds)

There is just a small glitch (broken symlink g77->gfortran).
Khem will solve it.

http://pastebin.com/BcjUTa9g

Regards

Andrea


