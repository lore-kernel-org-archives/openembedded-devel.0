Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PB8Ud-0005Lj-RA
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Oct 2010 18:04:52 +0200
Received: by fxm3 with SMTP id 3so907711fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Oct 2010 09:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=8K4e2JnVqFp17+pWY9mmWR4prUEcf5CVPykKD1YZWao=;
	b=c2JrMGZm2Q4vDfoEccVKMKCIIDE6fYtqKKJMbIUq7RBgdZr1BQEWXPVDud5jVqHj4U
	MFyTGduln2PBxP3aoregFackGm6gUa8fHr2hQDVPBdM5OsLPxVljFiiatswpPwQB1/f6
	BmurF8TV6UQQ+PQqvRXuCH0H2z7eFdzsmGdM8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=TsM1igHVAXKzjXmwCmFJERh9+jFZrE38hyl4o3lzl8gOOq5yURyG5kueGSYNr/7WLE
	jfIuDx+v55K818T8bA3I04Q7vDHqVj8EEj+tlb1Dd8e1l4S2pc9RUSLd0x9TlDmtW2ze
	SFm+N08RukkKTbPEeKiD54ibx48LRjofgE5LI=
Received: by 10.216.154.131 with SMTP id h3mr1051577wek.74.1288195444553; Wed,
	27 Oct 2010 09:04:04 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.139 with HTTP; Wed, 27 Oct 2010 09:03:43 -0700 (PDT)
In-Reply-To: <1288179182.1285.2607.camel@rex>
References: <1288179182.1285.2607.camel@rex>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 27 Oct 2010 09:03:43 -0700
X-Google-Sender-Auth: gAc_wDG7HpR8fMiwGl_3istXFWw
Message-ID: <AANLkTik=onoxNySPh13xTMRtNNuKoxTSuggKkueiKhnQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Poky 4.0 and Yocto 0.9 released
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
X-List-Received-Date: Wed, 27 Oct 2010 16:04:52 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 27, 2010 at 4:33 AM, Richard Purdie <rpurdie@rpsys.net> wrote:

> It gives me pleasure to announce a new Poky release, Poky 'Laverne' 4.0
> and also Yocto 0.9, the first release of the Yocto Project. For more
> information about these, please see the new website:
>
> http://www.yoctoproject.org/
>

Congratulations to all who were involved with this, it's great to see, and I
hope it pans out well.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

