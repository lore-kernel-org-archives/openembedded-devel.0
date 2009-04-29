Received: from [74.125.44.158] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1LzJER-00060w-DT
	for openembedded-devel@openembedded.org; Thu, 30 Apr 2009 01:30:27 +0200
Received: by yx-out-1718.google.com with SMTP id 4so855981yxp.30
	for <openembedded-devel@openembedded.org>;
	Wed, 29 Apr 2009 16:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=He6qkw2SurxvRNIAUugs2id+v2hWKyZdwtPPLxRJ45M=;
	b=Xu4/GUK1TvP9BZiCJcT6l8raplP8KyEN6oSfoQpzjtY0x33Xx46GEgAdDugIsFb85x
	o5qPHCp3XH640eh1ThCtv3CnYUwbkRVwqJgGASoHaYT5jUZSCHjyX3fAFXJXuglLYadZ
	+0yrx0JrY0+mr820fGif9nzeWkUxxn31K5YGs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=n08dqf3VLSfceUqMbGV2645axtOrpZCS1YG7GqzOTm0HHe3jyBlJdx/09kvgx/Hq4p
	DRF/WjVzquCK8fUIULeEbjJeoGNZ9XQlM3DqIZpMApNgZNG3VR+Zdq/0ya/GIIpuA86X
	q30zn/np2aYQ4u6RcbYwpFd4TlGr8Bpad45w8=
MIME-Version: 1.0
Received: by 10.231.17.65 with SMTP id r1mr1111602iba.14.1241047508860; Wed, 
	29 Apr 2009 16:25:08 -0700 (PDT)
In-Reply-To: <20090429161224.GB18788@smtp.west.cox.net>
References: <20090427141943.GG18788@smtp.west.cox.net>
	<20090429161224.GB18788@smtp.west.cox.net>
Date: Thu, 30 Apr 2009 01:25:08 +0200
Message-ID: <c384c5ea0904291625m427a7834ie3d06dbc309fcc6f@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Subject: Re: [RFC] Bring PREFERRED_LIBC to all distros
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
X-List-Received-Date: Wed, 29 Apr 2009 23:30:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Tom,

On Wed, Apr 29, 2009 at 6:12 PM, Tom Rini <trini@embeddedalley.com> wrote:
> On Mon, Apr 27, 2009 at 07:19:43AM -0700, Tom Rini wrote:
> - Change PREFERRED_LIBC to LIBC
>
Yes, this approach is simple and sane, and doesn't confuse people. Thanks Koen.

> I'm now looking for ack's to pull this branch into .dev
>
Acked-by: Leon Woestenberg <leon@sidebranch.com>

Regards,
-- 
Leon


