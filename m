Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SAkeQ-0005Z5-B2
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 17:14:10 +0100
Received: by lagw12 with SMTP id w12so1765769lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 09:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=egTi+qzf7feW8A15/kh7w4C7d/lUfgSyRF26Gcvrm8o=;
	b=cFhzByq2v1xDqDp8eb8C2fUdsqpXmsAieo5Wtn9ME7hQ49jciI3u2+zA0RN/6XOps6
	uwB+HTqzzdsWLEI/u3GIEbSLwOvCSPBCMvMdk+oUY8anIuWQrGlK0CC2q1NBeCYg/kwg
	Rkr2j9/JFFT2FhmPTH8ftSNMKFFaD4lqu8HVEP50haUcAoY1t+fsC7y/SZpBvbvTCTMl
	fjQNIZigPzXGzNeVGHGoZicJZTVCSITwnrfrI3Z8KWxoBI9kE7rE1DWvsI++k9kEb05T
	MUYqSDs1BSo8Vg0EgXuGf8EvbFbr7usGDCwu2uU46uNcPDVNPrgfcLOomyC6f8rdb1n7
	87+A==
Received: by 10.112.84.42 with SMTP id v10mr3157724lby.50.1332432315274; Thu,
	22 Mar 2012 09:05:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.2.71 with HTTP; Thu, 22 Mar 2012 09:04:43 -0700 (PDT)
In-Reply-To: <jkes69$nt2$1@dough.gmane.org>
References: <1332339451-26902-1-git-send-email-s.stirtzel@googlemail.com>
	<jkdg34$om0$1@dough.gmane.org>
	<CAGiJk9cG0mySg454zxYS8VJLc9etr2jAAxxtBSMbN9boq0EnRg@mail.gmail.com>
	<20120322092859.GE4010@jama.jama.net>
	<CAGiJk9ex0qxUQrxyCSjH33dpH_sg40MmLj+Gq5SSgW2AkyoL_w@mail.gmail.com>
	<20120322104009.6a4ed04e@eb-e6520> <jkes69$nt2$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Mar 2012 09:04:43 -0700
Message-ID: <CAMKF1soqkT7vNrp=-CgnSkMzQ5YhEFL2w4Vi3WvOQVwyn6r9aA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] [meta-oe] giflib: Move to OE-Core
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
X-List-Received-Date: Thu, 22 Mar 2012 16:14:10 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 22, 2012 at 2:42 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> In the mean time I bet Khem would love to have people sending patches to
> move the toolchain bits to a meta-toolchain layer inside the
> meta-openembedded repo.

yes please.


