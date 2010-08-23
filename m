Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1OnLOT-0004dU-5t
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 03:00:17 +0200
Received: by fxm6 with SMTP id 6so2804481fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Aug 2010 17:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=DY3iZGC21IJ2P2nv8sTn+REQ2phtgPLVYfvt0tYTDpc=;
	b=BVh19URCWe0sBi+oFYjsVr5FhZESq5bvu4nAOuRzP317zPxbK50VqVPJSCJ6I7lxMS
	8kGodGmG5RLiB1JGpyGnOZX4vVDIngK5ExWIhDxT0VsqSQ5Zp9yDHhVqoPdj3cqzlWmq
	8MyU8G9SHI32DQ3XCtaONdJY1NHgV0kzUsBpg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=wcwprqSQ5k8jOPe3lYHrvGJqwA5meMuJJ2+odhJrj39FiH4pRV1AImHXXIwLzXn8GX
	3tr09g9VCScc+HdGs8MrxQ75+2ePLFaIlAT8uPlrWD+SXj17xiVJlq6cGfJ1F5SCT9wc
	qD8Miuedc+1hjkQ7YJsYgoRWYbR/FgWXK5r5g=
Received: by 10.223.124.145 with SMTP id u17mr3443840far.92.1282525185239;
	Sun, 22 Aug 2010 17:59:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.125.209 with HTTP; Sun, 22 Aug 2010 17:59:25 -0700 (PDT)
In-Reply-To: <AANLkTikoa8bZuk-xbkbtbym2ST=zsy+_Ro9qGA5S7_Xp@mail.gmail.com>
References: <1282198068-25415-1-git-send-email-coolaj86@gmail.com>
	<i4iqg8$g6i$2@dough.gmane.org>
	<AANLkTim2hsYd7ya-SZ6hRpjU2_MHRAQAeczkTnQVuRD3@mail.gmail.com>
	<AANLkTikoa8bZuk-xbkbtbym2ST=zsy+_Ro9qGA5S7_Xp@mail.gmail.com>
From: AJ ONeal <coolaj86@gmail.com>
Date: Sun, 22 Aug 2010 18:59:25 -0600
Message-ID: <AANLkTinYmjwS13hGmRf6yq1iQjq=0bAmNtAXxra3to7d@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Mon, 23 Aug 2010 01:00:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

I did

git commit -m "[v2] blah blah blah"
git format-patch -1
git send-email *blah*

AJ ONeal


On Sun, Aug 22, 2010 at 1:55 AM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> 2010/8/22 AJ ONeal <coolaj86@gmail.com>:
> >>
>
> > I don't know how to add the [v2] onto a patch, but I'm going to submit
> again
> > with what I have working.
> >
> There is an option with git format-patch, which I always forget.
> The alternative is to edit the file format-patch gave you and change
> the subeject line before doing a git send-mail
>
> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

