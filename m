Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RunZo-00088P-9I
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 17:07:28 +0100
Received: by eaal10 with SMTP id l10so1968205eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 07:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=ZxhxOb0pMTdl8hhiO2Q8Kw5mgRwSj0lFFGRJZyTCppg=;
	b=CNK9C37vwUo8sXxdsSeYMkOHvVFxEodqzqwgs2JW50JmGTexpqwZOOubGvFGeY9i8V
	/zK76YRUMq3NFCzpvg236LRBgKUXBINLxruGKDjpQ2pWPJalWIfIvAQ0EcZm67o+O0bQ
	cZ5EXJP05kuw20pvkhJ3oVR3zYDPaHKOKb4I4=
MIME-Version: 1.0
Received: by 10.213.26.8 with SMTP id b8mr2126836ebc.88.1328630366082; Tue, 07
	Feb 2012 07:59:26 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Tue, 7 Feb 2012 07:59:25 -0800 (PST)
In-Reply-To: <2867195.8SQ0fmmcld@helios>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
	<1328627573-5217-4-git-send-email-schnitzeltony@googlemail.com>
	<2867195.8SQ0fmmcld@helios>
Date: Tue, 7 Feb 2012 13:59:25 -0200
X-Google-Sender-Auth: aqzBbHrqJgfsE8hterfCSWkFoa8
Message-ID: <CAP9ODKq_OD3thK5Nib_2HPm3LtmZk3Fd9KMETrqWe+69SnCT5Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][RFC 03/27] image.bbclass: inherit initmanager.bbclass and set default value for IMAGE_INIT_MANAGER
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
X-List-Received-Date: Tue, 07 Feb 2012 16:07:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 7, 2012 at 13:36, Paul Eggleton
<paul.eggleton@linux.intel.com>wrote:

> On Tuesday 07 February 2012 16:12:29 Andreas M=FCller wrote:
> > This is a copy of image.bbclass with only a few lines added. These are
> > marked.
>
> I appreciate it's additonal work but can we avoid adding more overlayed
> classes in meta-oe? We really want to be reducing the number of these.
>

I'd also prefer it to be done on an OE-core branch and posted together.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

