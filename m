Received: from [209.85.132.246] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1MEjbE-0003ge-JA
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Jun 2009 14:41:44 +0200
Received: by an-out-0708.google.com with SMTP id b6so755687ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jun 2009 05:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Zr9bR4nA6DJR7P1g6bVL+8JLdj5VqAxeswccIYmD46E=;
	b=CMUf4ZUg9QcBAyjVDQdz9RTAbm5oKULJ5zM/x77lBMbhNQQcIh02TsbDqE8PgbGAa9
	ctUk/xvijgNHqERszzjZDqsEguPkevcI588n03nMnrgfSutia90H2xMtPeeCqMZ6bKmH
	l8vNZHYxGcHHnizfOJCnCDhvfS12vVKAzXDAg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=qeyB9kgzYktdpmQ0c5+IOmE8mAQzGXHwLR9KozhhzIX6l27PVDkh27G3FqizXPzs/1
	PyQGKKpv786G3exfrSPL7z3YnDdgfBW8efKMAM/fgDeDvPFmyU1+NEuFsh+H3kUSZoDP
	guidhFGJd+tYCsPB/SgfQ0roNXR1RO0NXOeAA=
MIME-Version: 1.0
Received: by 10.231.15.6 with SMTP id i6mr1221758iba.12.1244723516820; Thu, 11 
	Jun 2009 05:31:56 -0700 (PDT)
In-Reply-To: <c384c5ea0906110528u105b1a97lc1e86fc3413b3b18@mail.gmail.com>
References: <1244366174.4412.11.camel@daniel-laptop>
	<1244384219.4431.46.camel@utx.utx.cz>
	<1244385233.4151.27.camel@lenovo.internal.reciva.com>
	<1244402010.4463.36.camel@utx.utx.cz>
	<1244402413.4151.36.camel@lenovo.internal.reciva.com>
	<1244721978.28486.107.camel@hammer.suse.cz>
	<c384c5ea0906110528u105b1a97lc1e86fc3413b3b18@mail.gmail.com>
Date: Thu, 11 Jun 2009 14:31:56 +0200
Message-ID: <c384c5ea0906110531r7e47155fp99fa07f32c583e6d@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: e2fsprogs-libs failed on latest org.openembedded.dev branch
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
X-List-Received-Date: Thu, 11 Jun 2009 12:41:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

> Updated http://bugs.openembedded.net/show_bug.cgi?id=5101 on this.
>
Sorry, that should have been #5149 (5101 was linked as possibly
related, I think it is not).

http://bugs.openembedded.net/show_bug.cgi?id=5149
-- 
Leon


