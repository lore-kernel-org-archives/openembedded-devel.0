Received: from mail-fx0-f225.google.com ([209.85.220.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NJD7Q-0002Xk-Lb
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Dec 2009 22:33:47 +0100
Received: by fxm25 with SMTP id 25so1456695fxm.26
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2009 13:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=sUYRl9Na/JVvUWV4LQ1P1QIfPdpAcyYZj3toWyFzz10=;
	b=XuCivr5eUWTYZiX22XmUmco5/kSK3oF36MHnBw2DSXvxneDh06XnpA25laomMSroNY
	b3EJhYe8RSpIFYXFhh/uRoc+XwsL0UP/GlJCMEkmG8ZF7uZGxVLbWyA7wEYpUQp1P0MI
	qmjaB/HqO3AuRE60+hAbghWnzsA40ilUfVCUA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=tawRb438VlotCRo2lXKZY9gNmyUpfsJBxbWc2o6XnBZqJ3jhQbkYcBSTYTgazAdk5v
	3mQz7R4MS0l4KO/+xuhImrX+k7Jbw+P9vX3F1q7P0kcYi2cHhUbfPQ4QV5y0WjZfEgAs
	xm2q+RNvOKV61abuyPzmEuU8KHWRNlmhGkp4I=
MIME-Version: 1.0
Received: by 10.239.163.208 with SMTP id q16mr193334hbd.102.1260567121595; 
	Fri, 11 Dec 2009 13:32:01 -0800 (PST)
In-Reply-To: <hfim7g$osr$6@ger.gmane.org>
References: <1260139496-21442-1-git-send-email-leon@sidebranch.com>
	<1260139496-21442-6-git-send-email-leon@sidebranch.com>
	<1260139496-21442-7-git-send-email-leon@sidebranch.com>
	<1260139496-21442-8-git-send-email-leon@sidebranch.com>
	<1260139496-21442-9-git-send-email-leon@sidebranch.com>
	<1260139496-21442-10-git-send-email-leon@sidebranch.com>
	<1260139496-21442-11-git-send-email-leon@sidebranch.com>
	<1260139496-21442-12-git-send-email-leon@sidebranch.com>
	<1260139496-21442-13-git-send-email-leon@sidebranch.com>
	<hfim7g$osr$6@ger.gmane.org>
Date: Fri, 11 Dec 2009 22:32:01 +0100
Message-ID: <c384c5ea0912111332y4e8d3e40j4cdbb4edf913e9b2@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.225
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] sane-srcrevs.inc: Add PREFERRED_VERSION_linux-libc-headers for nios2.
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
X-List-Received-Date: Fri, 11 Dec 2009 21:33:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Koen,

On Mon, Dec 7, 2009 at 11:42 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> On 06-12-09 23:44, Leon Woestenberg wrote:
>
>> +SRCREV_pn-linux-libs-headers_nios2 =
>> "d01303a1035a39e445007c7522d89ad985c4153c"
>
> Using a machine override make it non-generic. Anyway, since the cabal said
> checksums belong in the recipe, SRCREVs should be in there as well.
>
Removed from sane-srcrev. I leave it in the non-generic recipe.

Thanks,
-- 
Leon


