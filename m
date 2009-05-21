Received: from [209.85.132.248] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1M78tZ-0002JK-QX
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2009 16:05:17 +0200
Received: by an-out-0708.google.com with SMTP id b6so636764ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2009 06:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=eewQyeqMO8qIuGGtDXb8jQ5jcbKPu8SDnLNNz96Jmjw=;
	b=Fs2V3rh7NQrXrrsaqBgmTEQVZ/Mbu6kS+nBKglamo/IbdYmuT0PlQqfMORRmlWtfy4
	M1doRAagai0bd9a8anR5AnMyNGSlFFpy0Pv9LmtixB6WT+KGqDbp44BGznODj4JTKLfS
	UL72HnSp/jChN1KmCEhSplREbxJmb9BRqb8MQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=jUM47JiSf9+uG9stUeMZsR4eKuM4iqy9oQ/ozWC767o2J24uJB+lNr2ZvGRjxDBO83
	evq6NkA92PAvlrxXdrkMmz9EfKvFthG7PeTZVwZ6fSuwZChCgdzpoXOD3M7JO9c06iK9
	bKk2a2Fj7rKQGbbuTZQa+njYsdsELgsr+HU8g=
MIME-Version: 1.0
Received: by 10.100.151.8 with SMTP id y8mr4792601and.147.1242914262892; Thu, 
	21 May 2009 06:57:42 -0700 (PDT)
In-Reply-To: <4A143640.3040606@mta.it>
References: <4A143640.3040606@mta.it>
Date: Thu, 21 May 2009 15:57:42 +0200
Message-ID: <c384c5ea0905210657k1dea4d73ncfd51c50b74e29c9@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: rrdtool fails to build
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
X-List-Received-Date: Thu, 21 May 2009 14:05:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

On Wed, May 20, 2009 at 6:56 PM, Matteo Fortini <matteo.fortini@mta.it> wrote:
> Hi all,
> I'm trying to build rrdtool on Angstrom on a powerpc target, and it
> mysteriously fails even before unpacking the sources.
>
> If I try to build it manually, I get some ./configure errors about missing
> ieee math support.
>
Could you be a bit more specific?

Machine, distro?

Regards,
-- 
Leon


