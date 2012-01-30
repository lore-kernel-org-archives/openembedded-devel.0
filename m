Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rrtd4-0006bv-If
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jan 2012 16:58:50 +0100
Received: by lahc1 with SMTP id c1so2204946lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2012 07:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=gwowhTV489T/WTAOs/3AuTPeXrD7/1wkqTqR7AmpOsU=;
	b=DX36ki/FAvoYs7O3zz8AFGy7B5Uli4MwUNkskweUncZvqNS6PKSzY8PfHQezbx3Tb4
	nBwD6Ns1kkqOnbTPCogFxGCqLdmob79pLlqLkjIHMjj4t8sft4S2mQJanzdG0ztcE4yy
	VZo1IL2QLW+YlUqzo9ijT/IUDKCQJrrhsmgg8=
MIME-Version: 1.0
Received: by 10.152.112.41 with SMTP id in9mr9214125lab.27.1327938657934; Mon,
	30 Jan 2012 07:50:57 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.112.46.199 with HTTP; Mon, 30 Jan 2012 07:50:57 -0800 (PST)
In-Reply-To: <jg68t6$uh9$1@dough.gmane.org>
References: <jg68t6$uh9$1@dough.gmane.org>
Date: Mon, 30 Jan 2012 13:50:57 -0200
X-Google-Sender-Auth: feXC68pDEsrC_AmxYw1qya9qF0k
Message-ID: <CAP9ODKpt285LxOmMRbP6ZLLB170iCFUQwFGNVk2TOsUoD5rm=w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe] udev rollcall
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
X-List-Received-Date: Mon, 30 Jan 2012 15:58:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 30, 2012 at 12:19, Koen Kooi <koen@dominion.thruhere.net> wrote:

> We currently have udev 173 and 175 in meta-oe and I just sent a patch to
> add
> 180. To keep the number of udev recipes sane I'd like to ask people using
> udev from meta-oe to state which version they are using and if they want to
> keep it.
>

Please keep 173; I am using it as base of my work of merging it onto
OE-Core and I can then do 180 too.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

