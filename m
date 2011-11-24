Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RTeMi-0008Rq-2I
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 19:49:44 +0100
Received: by bkbzs2 with SMTP id zs2so3118494bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 10:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=Xwi1fP5odcxCdLiAi6GzdL5Ec0pOORMrQpi3grxCH6w=;
	b=hyrhB1ibvNkQ3LibOgcJ43OWvE44IGDkStQKKXQEztKGRUwx1SEqHSYGLfWEEfbuX1
	XFj01Lk0NQu6ABbvJH5GIie2mgGvqttk/nQ31zzH71iP941qu984d7q4B0gbW3l71Bxn
	QR/OOI8H1CznBtl3lNmvWFlQuR4imFSUV/p60=
MIME-Version: 1.0
Received: by 10.205.121.1 with SMTP id ga1mr27796642bkc.60.1322160189911; Thu,
	24 Nov 2011 10:43:09 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.113.148 with HTTP; Thu, 24 Nov 2011 10:43:09 -0800 (PST)
In-Reply-To: <4ECE81D3.2010603@opendreambox.org>
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se>
	<CAMKF1sr6mM0_iYu_1vfEGbUYNqaj2hK2vpdsHqCTkoSdrHyJOA@mail.gmail.com>
	<CACW_hTYcHF6RXuW3prEO2cR+UYCFFvdtoH1d6DetY-6pCmT6qA@mail.gmail.com>
	<CAMKF1srRnHd4C7XsEdZ80HcKuc7ioLC_+2J4NO3=bChoCw2k-Q@mail.gmail.com>
	<4ECD76E2.3040001@opendreambox.org> <jal1pc$2u7$1@dough.gmane.org>
	<CACW_hTZpUU0Zyjv4d+ut1n+Rte55TTh5GT_k1W98KzMY9sjL1w@mail.gmail.com>
	<20111124170654.GA28572@sakrah.homelinux.org>
	<4ECE81D3.2010603@opendreambox.org>
Date: Thu, 24 Nov 2011 16:43:09 -0200
X-Google-Sender-Auth: Dj4RLlqk7htOS7w0nxOhNY-tNlk
Message-ID: <CAP9ODKrrnc8Op+At6CH2EJbUkTPafGuS=6wMmBXTFsBhA90oTA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Plans for OE classic future
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
X-List-Received-Date: Thu, 24 Nov 2011 18:49:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Nov 24, 2011 at 15:41, Andreas Oberritter <obi@opendreambox.org>wrote:

> ...
>
> I would like stronger arguments for why master and not 2011.03 release
> > branch ?
>
> Obviously, you can push a changeset to master, wait for someone to
> complain about a bug, fix the bug, wait for silence, merge it into 2011.03.
>

Sure not; 2011.03 is for bugfixes not huge changesets with new things.


> Would you prefer experimental changesets in 2011.03?
>

This is not going to happen  has 2011.03 is not a playground but a stable
 branch.

You're confusing development and maintainence branch meaning here.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

