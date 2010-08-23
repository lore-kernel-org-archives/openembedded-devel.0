Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OnQVa-0007ES-EY
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 08:27:51 +0200
Received: by wyb33 with SMTP id 33so5963212wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Aug 2010 23:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=gD9l3fSCxsrOdkH7aOiRZAEf3pwqhwhFyICvRs0pL4I=;
	b=TxbPqyLrk5Mv88VWFRIbORzUjddKHkVz45mip3cfLWzogcNPU5PoU8j/TFJU/7t8wc
	3jeNXfpWu0s/Ezt67BK3zkEZawJn2VxXKDqHT5aE/DwU0Lb3tr+DdX1g3SnuwHJ0+0zK
	E9e9PTXO6T7Q/cGlG1w5dGZ2+FXCI+dRofpJc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=YZwsgfL9kRyQN0XmUia6MGAU7b3kabZVvWKGz7X6uPNCgUSygHGsOj+DA4OXWlu9pd
	yiizzx1ejYQb17vOPH6m5aSlL7gloE9+cWQ4Hah6OoeAJT2OTCrtxjRWOblUfxBPc6xz
	w4gK4kYj1Prp2D0c6gJkeSGaeQ1x/DmVsFcXc=
MIME-Version: 1.0
Received: by 10.227.134.85 with SMTP id i21mr3958069wbt.127.1282544841283;
	Sun, 22 Aug 2010 23:27:21 -0700 (PDT)
Received: by 10.227.69.82 with HTTP; Sun, 22 Aug 2010 23:27:21 -0700 (PDT)
In-Reply-To: <1282537594-18263-1-git-send-email-raj.khem@gmail.com>
References: <1282537594-18263-1-git-send-email-raj.khem@gmail.com>
Date: Mon, 23 Aug 2010 08:27:21 +0200
Message-ID: <AANLkTim6ZrUFLWNzGAfPF5f9BJZvFM2h+Cj50Zac7bRV@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH, v2] ncurses_5.7.bb, recipes: Make DEFAULT_PREFERENCE
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
X-List-Received-Date: Mon, 23 Aug 2010 06:27:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Aug 23, 2010 at 6:26 AM, Khem Raj <raj.khem@gmail.com> wrote:
> * Select 5.7 if none pinned.
> * Bump PR for recipes which have ncurses dependency.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>


