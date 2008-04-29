Received: from [209.85.146.182] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1JqdnR-0008RR-0l
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Apr 2008 02:34:13 +0200
Received: by wa-out-1112.google.com with SMTP id l24so8017841waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Apr 2008 17:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=uoVv9q3on5o80fAt18O8nLw3Lrt89jEmZvt8yKTammA=;
	b=e6ZyRHM+Fq3YEmp313uSrzQ4o3EIrtHG5UMboymCZFZh/l2U9JkyhihCGn/Srqv7jez+ZUk93KzVq3Dz0hih/ITG7SkEfXG49y0TSTJrWDc+tVlBsnRfC59dt8625bIjmj9wgg+p0B6rrMfBOtuYG43NaTj31lpYSfsCMexeJMs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=BzeEaGMhGcYi4otUbsrmvapzw/XVlBuUmx/tPme9phcQ46jU4iT6hPJnMCBCVahrEAL9KDL4bGB5hMV5QTorLz+5/HxQMwwpSfELann7/k8gY+uQoQuW+zf4elRWL9kvCJgUaESiO58GjDWl5JdUpHtYySifxO4Mhc92dAQiRXA=
Received: by 10.114.113.1 with SMTP id l1mr7263512wac.226.1209429224384;
	Mon, 28 Apr 2008 17:33:44 -0700 (PDT)
Received: by 10.114.234.12 with HTTP; Mon, 28 Apr 2008 17:33:44 -0700 (PDT)
Message-ID: <19c1b8a90804281733t10560430pd4a6941b1883256e@mail.gmail.com>
Date: Mon, 28 Apr 2008 17:33:44 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <fv5nfj$3pg$1@ger.gmane.org>
MIME-Version: 1.0
References: <200804281344.32507.zecke@selfish.org>
	<200804281639.04704.zecke@selfish.org> <fv5nfj$3pg$1@ger.gmane.org>
Subject: Re: Summary of an unwanted merge and what I did
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Tue, 29 Apr 2008 00:34:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

hg or git is "egal" for me.

On Mon, Apr 28, 2008 at 4:43 PM, Rolf Leggewie
<no2spam@nospam.arcornews.de> wrote:
> Holger Freyther wrote:
> > it is about time to switch
>
> I believe the discussion has been done.  I agree, action should follow.
>  What are the next steps?  Do we want a vote on which tool to use?  I
> see three contenders.
>
>  a) stick with mtn
>  b) switch to hg
>  c) switch git
>
> I don't recollect anybody advocating anything else.  So, should we have
> a vote on a, b, or is there some technical issue that needs to resolved
> or evaluated first?
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


