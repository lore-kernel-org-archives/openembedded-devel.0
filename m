Received: from [209.85.218.228] (helo=mail-bw0-f228.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MMKW0-0005Uj-3w
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jul 2009 13:31:44 +0200
Received: by bwz28 with SMTP id 28so896245bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jul 2009 04:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=oFGSfTnKR0okoczibv7MoUmm3Z8PWuKZIjE23mCNuf4=;
	b=Jv+wpVvcMU07ieL8r2LHKBnxGUE87OK2plFr+NEtKUP7eTieeb3xrxp9PB/eLJBPkx
	Lzdggaa46ZYsULGoVNaUqlGuBjg9a9lJMPf4MAVh8MwXFhLVIzkuUZKYWpEUq/J+RMRD
	m6FPH16vkyST3izNZlctUAKlO3Cb+zzYVN3IQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=gdXOGwSI+EqjHNyYqkt5TfI0NqRBPTWmhElUUH57ocjp/NS51OCxNXpJupCwgSw7Kr
	njHImKWPXWUmky3J/z4z//Ll0T+j2a7iSBUFlufxmwyoiOr8qfIpL+6E1AUJo3dkSTLn
	Rf7GilEpLQ+UdF/7+e1BwEvCCwJeydNT/A57o=
MIME-Version: 1.0
Received: by 10.103.240.15 with SMTP id s15mr6247908mur.93.1246533581319; Thu, 
	02 Jul 2009 04:19:41 -0700 (PDT)
In-Reply-To: <200907021307.40519.holger+oe@freyther.de>
References: <1246522458-18500-1-git-send-email-ihar.hrachyshka@gmail.com>
	<200907021307.40519.holger+oe@freyther.de>
Date: Thu, 2 Jul 2009 14:19:41 +0300
Message-ID: <fce2a370907020419u72355948ne46c2de6350511b4@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] qt4: updated version to 4.5.2.
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
X-List-Received-Date: Thu, 02 Jul 2009 11:31:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Just git mv + checksums. If there is a flag, I don't know about it.
Can you provide me with its name?

On Thu, Jul 2, 2009 at 2:07 PM, Holger Hans Peter
Freyther<holger+oe@freyther.de> wrote:
> On Thursday 02 July 2009 10:14:18 Ihar Hrachyshka wrote:
>> Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
>
> Is there any actual change besides the git mv? Did git fail to record this
> move or is there a flag to git format patch?
>
> z.
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


