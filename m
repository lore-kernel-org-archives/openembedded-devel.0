Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sy6wN-0004FY-A6
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Aug 2012 21:56:43 +0200
Received: by eaad12 with SMTP id d12so644412eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Aug 2012 12:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=DuqOMAHEMojvwVgqOZGYBu3zciakjxcvFob7xiyRUdM=;
	b=t5AoUkr8FN5HRLuALIhcxYinn7V9x3FGMlt2Vhb4Qsotyh3s4c81U2TIVOc0MFvFxN
	Gu79+AhGUOIUXKELmzTNbKKsytyZ1XzNpUIDJz2nIt8/v/GYcw2f84IEHchg3NRgg4zp
	Sceoklq4qeaSg9mwex4RMNEwc/2JOJXyt/BVxMIZhOvmTm8flpWktFhBxvohPHYp8S5s
	FDfXh1oTh62tspYY2O48Uiy7nITtoLm63kxuBZQYjmD6w44iq9XQKQJQm0j8XxW7UZqa
	mbrEwvvfpHwwrtWffIxfX0UDD7bnyyiEHid/5B37b3xJIz2HaprRxKebSF9vGsIq3upc
	JhAg==
Received: by 10.14.219.198 with SMTP id m46mr9981823eep.18.1344195899888; Sun,
	05 Aug 2012 12:44:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.97.141 with HTTP; Sun, 5 Aug 2012 12:44:29 -0700 (PDT)
In-Reply-To: <jvlm56$r75$1@dough.gmane.org>
References: <1343760977-3290-1-git-send-email-raj.khem@gmail.com>
	<1343760977-3290-6-git-send-email-raj.khem@gmail.com>
	<jvk13l$nh$2@dough.gmane.org>
	<CAMKF1sqBGOR=f-e+D8zrguifFbsRzkVLtLsOCf4rxaGKiwPK2Q@mail.gmail.com>
	<jvlm56$r75$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 5 Aug 2012 12:44:29 -0700
Message-ID: <CAMKF1sq4FTsgzkn+z36bHOWVbOgg94gebGLe+Fxkok15aQTq3g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH V2 6/7] blacklist.bbclass: Move to meta-angstrom
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
X-List-Received-Date: Sun, 05 Aug 2012 19:56:43 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Aug 5, 2012 at 4:41 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> No, I want the class deleted. But as I keep saying, the class was moved to
> meta-oe on request because is was most certainly not angstrom specific. And
> as angstrom maintainer I have no intent to add it back to the angstrom
> layer. So your commit message is entirely wrong.

OK I can change the commit message. I will also work on getting angstrom to use
this from OE-Core so even angstrom wont need this feature.  I agree that when
similar features from other layers are added  to OE-Core then all
distros should be informed and helped
out to adopt one good case where it happened nicely is buildhistory


