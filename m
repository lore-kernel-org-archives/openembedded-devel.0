Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P5C00-0007ws-Qf
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 08:36:41 +0200
Received: by iwn7 with SMTP id 7so2289211iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Oct 2010 23:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=9XYcM7VOO98sL+iKZ9j/ddYrLP5c/xyRm6xFw9F1JXo=;
	b=sKP8rNFp6Iu0V8kyiIBO57cK+0lYCZPrPklAlNT+LKalZU3djmw6NLCjFWRHxLRrL0
	jwODkzxbxBVvxHLOT6SaeTYr1Jzdj2Ju6Q80dp2LXI/JcYDi183Cr567Oeyg0LhC3/QT
	wjnEnLuWXM/Ol+KbSZied58a07KqlXQWyHWWY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=lEpjGxcXfUpLGN55GalMhAyr3JkSSTQVD14sC0hajWIut2b/I8rIr7nUeX+A9hfe1M
	XbYlVOwqUcK8MI5F/S19iwdrJ/9gmwA/EBHNwVdoiCMRTFCM6NqlYhCGsl7MU+Bx8rJO
	KwbHokqdjF1Q9tm3z6zbVwp5b9P8IlLtjdKO8=
MIME-Version: 1.0
Received: by 10.42.1.6 with SMTP id 6mr1592988ice.100.1286778976591; Sun, 10
	Oct 2010 23:36:16 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sun, 10 Oct 2010 23:36:16 -0700 (PDT)
In-Reply-To: <4CB2AD43.5000102@gmail.com>
References: <4CB2AD43.5000102@gmail.com>
Date: Mon, 11 Oct 2010 08:36:16 +0200
Message-ID: <AANLkTikq-Ty5rosoAhQ=ot8J3U5F1LR6QGfnDGkigMt=@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] galago: move to obsolete.
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
X-List-Received-Date: Mon, 11 Oct 2010 06:36:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/11 Graham Gower <graham.gower@gmail.com>:
> libgalago doesn't build, and presumably hasn't since dbus 0.92 was in the tree.
>
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


