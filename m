Received: from [209.85.218.15] (helo=mail-bw0-f15.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1LIVFB-0001OX-FD
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jan 2009 22:38:17 +0100
Received: by bwz8 with SMTP id 8so14143106bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jan 2009 13:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=gp6SIJmSbdHrullcGt8b0oy1hNKr1BKOAse640p2GOY=;
	b=xFwHJXy7BiGST8skKeP6rrnYFYyhdaDmcab2NJ8b6T7l1aygoHNzUW9hdg+xR3fLgQ
	4Kvm/z8X/O5F6vW5Orrkapgu1Z8oI0C7OEF4aISsR/JEvMyB12ADmtuiek5DCjo5kwwy
	4JrflZaGa1rBUEvlgh1pwbD81nVlW6DQ/lJOU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=l6Mwnbp1d+9KzGUf0B7v8B0RDgM2KuSRnsd5g3eqLzTLdGadDmR1LDoqCWSMcjjFP+
	l6cmI95zHFS7kZGFl9/IkfvpItcS/2lBV1EduA0MsRjFMOiKtcpz6qNMUOeBTa9JFCjr
	7+XpFwNa1Ac/Spd2wKL81HbLzeaoF3A5TOyeg=
Received: by 10.223.120.197 with SMTP id e5mr12410877far.25.1230845555767;
	Thu, 01 Jan 2009 13:32:35 -0800 (PST)
Received: by 10.223.115.200 with HTTP; Thu, 1 Jan 2009 13:32:35 -0800 (PST)
Message-ID: <c384c5ea0901011332w109a42euec5bfcefb3100ca5@mail.gmail.com>
Date: Thu, 1 Jan 2009 22:32:35 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20081222211049.GB4287@smtp.west.cox.net>
MIME-Version: 1.0
References: <20081222211049.GB4287@smtp.west.cox.net>
Subject: Re: Please review trini/canadian-sdk branch
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
X-List-Received-Date: Thu, 01 Jan 2009 21:38:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Tom,

On Mon, Dec 22, 2008 at 10:10 PM, Tom Rini <trini@kernel.crashing.org> wrote:
> Hey all.  Can people please review the trini/canadian-sdk branch, in
> terms of content?  If things are good at this point content-wise, I'll
> split the commits up roughly along the lines of the original patches in
> http://bugs.openembedded.net/show_bug.cgi?id=4664 but with checksums
> added in each new commit.
>
I noticed your *poke* but I'm new on inspecting branches with GIT.

How could I easily browse through the content? I think I would like to
see the changed and newly added content in an easy way.

Also, do you have any pointers on how to use the canadian sdk stuff?

Maybe a tested build I might reproduce?

Regards,
-- 
Leon


