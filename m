Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OY6NV-00086w-HE
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Jul 2010 01:56:10 +0200
Received: by iwn34 with SMTP id 34so4147808iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jul 2010 16:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=ewIP/bpINKGiGov1xOPKG09Dm+nqmzVvN1+cCz9xUd4=;
	b=jeMEe4GYw74wOhcjI9o899wM5VrXGiyJdmUeAUXUbdHRVVWj8YBXYSliy9BM29o7iO
	Xy7gSmGo1Ttg2jK/sQbEETiutlgGn2sYbAbLt438sX8WRMApiyGLSnBYy/KAbiB1k6Gj
	em3vfRivNT7rY9RNQrismPNeVz1RC5NK0YBnw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=kNmTdT+TuO+fbsLEFBWvLMHQgdFG92FQmDQQGqQGO8WfzsT9woquA01yOzhFUOYhgs
	U2t2rfu8ZBBwQxbYHMHlfCyzm+rvlCIvwWSiSNpIWfu5h7LT1laN38o3xJVxixdzfPT6
	ssA/B7RqbqNuq9+hCxuGnccPUlQhsVXgd/TUM=
Received: by 10.231.201.83 with SMTP id ez19mr12495305ibb.172.1278892273320; 
	Sun, 11 Jul 2010 16:51:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.17.132 with HTTP; Sun, 11 Jul 2010 16:50:53 -0700 (PDT)
In-Reply-To: <1278886424.2928.41.camel@mattotaupa>
References: <1278886424.2928.41.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 11 Jul 2010 16:50:53 -0700
Message-ID: <AANLkTilBYYLzhG4YYhLryx_ZBqYvhRbQWA_l-zHfoFt6@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: script for removing old archives in download folder anyone?
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
X-List-Received-Date: Sun, 11 Jul 2010 23:56:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Jul 11, 2010 at 3:13 PM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Dear OE folks,
>
>
> my $DL_DIR is getting pretty big. There are a lot of archives of old
> releases in there. How do you guys handle that? Does anyone have a
> script, do you just download everything from scratch or do you have
> enough space? If you have a script, could you share it please?

move it out and download all fresh. and if you see something not being
fetchable then submit the tar file from your stash to Koen or Cliff
so they can put it on angstrom or oe mirrors for future fetching.

>
>
> Thanks,
>
> Paul
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


