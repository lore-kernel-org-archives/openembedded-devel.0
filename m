Received: from [209.85.220.167] (helo=mail-fx0-f167.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <methril@gmail.com>) id 1LeU3p-0003vD-5r
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Mar 2009 13:49:25 +0100
Received: by fxm11 with SMTP id 11so2355927fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2009 04:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=s7ddvRJhyrPeECmCb5dQnqm/yzsCv9mzlHsC8+P1L0A=;
	b=xxYcwayZCRCUMM3MiaJf26ykoYjRWs+CxKCOpJmP0zMy3vlc2wx+TPqnChiq5FZlxE
	zaucr+YjtrWUGDc3S0JxNQAOlPiGD84J5cvYdV4lhLfZLeqddnoTWCmDohSvv7PxWee3
	jClHvye6gED14QrqzhEEvU1i3RhQKK4HNXbIU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=xIBdWr4HDkCjD+6e4fPB4/JfRHEzisoTiNS8U8oDG5HkhDOzcVASgMbySUuqUjAu85
	Lfiyg/qpSrCMmPdvg+9LMQepTzbl1hwbGQYRgQ6cyYyM82exva7UL/GrUhSF2/KoZQJX
	WNOiVIIg927tZClbELW59Dv3PHSDiT3I3Qcno=
MIME-Version: 1.0
Received: by 10.180.205.1 with SMTP id c1mr2509403bkg.143.1236079968365; Tue, 
	03 Mar 2009 03:32:48 -0800 (PST)
In-Reply-To: <20090303045845.GC26643@denix.org>
References: <1236002244-14497-1-git-send-email-methril@gmail.com>
	<20090303045845.GC26643@denix.org>
Date: Tue, 3 Mar 2009 12:32:48 +0100
Message-ID: <b84dee3a0903030332q539c5fe4vdc9840766f0af008@mail.gmail.com>
From: Rafael Campos <methril@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Update the qemu svn revision to svnr6477.
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
X-List-Received-Date: Tue, 03 Mar 2009 12:49:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Tue, Mar 3, 2009 at 5:58 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> Anybody brave enough to actually review the patch? :)
>

Let's see if someone on the list is brave enough ;)
The changes come from pokylinux, and works in both environments.

> BTW, sorry for such a non-informative email...
>
> --
> Denys
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
I've more patches (smaller) related to latest qemu svn revision. I'm
testing it in x86_64 and arm. If someone want's to test it in other
environment different to Ubuntu 8.10 .. it could be helpful :)

Best Regards
-- 
___________
Rafael Campos
o0 Methril 0o
http://openblog.methril.net/


