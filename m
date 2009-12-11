Received: from fg-out-1718.google.com ([72.14.220.158])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NJDJZ-0000sh-Nb
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Dec 2009 22:46:20 +0100
Received: by fg-out-1718.google.com with SMTP id 16so307375fgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2009 13:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=PW7CkXa2wRx5kizmO7/7Bob9gf04woqOoSr+GOAPdWk=;
	b=Fnme8zHuDfTz7ULqJ1QlTnGjqXYZJurfw2WBqoDc9kJgjZWUkNFN1Cx/iSDpiTKJm3
	TrtL8hGrUsWwMUmm8Pwng7eSAjh8i6YFa7+g0coJizVYhCqDl807Qwh2O6s6VT1PKtpj
	zU47WIvsANCh5mdY/GhfVJwQr4oPNxxgkZ3W0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=hbByvpBm7s61+Au5mu+JOzM0/2vSSlHgGtPrvC9gkl0Ck/vb3hu0s1EShBkTPIzzAT
	aVraX2wv4qd0RpciaXSEOzPwf0STk20syFFCDj+7kvyI1fme7jzhpP76r8gKflfnfiAy
	dHr7aEx/JiVwodkw6xVpsaIq2l51DBKsUrZN0=
MIME-Version: 1.0
Received: by 10.239.163.208 with SMTP id q16mr194612hbd.102.1260567876676; 
	Fri, 11 Dec 2009 13:44:36 -0800 (PST)
In-Reply-To: <hfilus$osr$2@ger.gmane.org>
References: <1260139496-21442-1-git-send-email-leon@sidebranch.com>
	<1260139496-21442-2-git-send-email-leon@sidebranch.com>
	<1260139496-21442-3-git-send-email-leon@sidebranch.com>
	<1260139496-21442-4-git-send-email-leon@sidebranch.com>
	<1260139496-21442-5-git-send-email-leon@sidebranch.com>
	<1260139496-21442-6-git-send-email-leon@sidebranch.com>
	<1260139496-21442-7-git-send-email-leon@sidebranch.com>
	<1260139496-21442-8-git-send-email-leon@sidebranch.com>
	<1260139496-21442-9-git-send-email-leon@sidebranch.com>
	<hfilus$osr$2@ger.gmane.org>
Date: Fri, 11 Dec 2009 22:44:36 +0100
Message-ID: <c384c5ea0912111344k39ba8188h310d7d6811f93e14@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 72.14.220.158
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] gcc{, -cross}{, -intermediate}_nios2-3.4.6.bb: GCC 	for nios2.
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
X-List-Received-Date: Fri, 11 Dec 2009 21:46:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Koen,

On Mon, Dec 7, 2009 at 11:38 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> On 06-12-09 23:44, Leon Woestenberg wrote:
>
> That's bogus. Change that to 3.4.6-nios2 or put nios2 in PR, but don't screw
> up gcc versioning.

nios2-<version> has been fixed to <version>-nios2 my local branch.

Thanks for the review and remarks,

Regards,
-- 
Leon


