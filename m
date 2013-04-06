Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UOTZq-0002aV-7E
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Apr 2013 15:54:51 +0200
Received: by mail-oa0-f47.google.com with SMTP id o17so4797624oag.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Apr 2013 06:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=DE8jPL+HyV3Uz4k7lpzwSwXnQor83yjXyQthtR3xCcI=;
	b=klN1mOqy1fE6PewAvKE8qOchJWU4Fj7Gtb3vYfIlJVQx9zBol9tAbA6CjqgzLI0Rei
	T9nyJF6Trc5G1dLAvw8qaZa/NPSHUCG9w0+3qVeLW7bIu5lTvdvW0w7G/D+3B06oovj1
	40fQK1QEWRAUWXfpJb36Yz+xuqoMbzWPjiPHL9klluzox12Af4QMu8zG4TrKfLE3Jnfu
	33PYgZyKwW9Zs4uxD2f9pIXSMzgSYlgNKmR6ICbt+LnT3KRrPDLJtXHv/BeB0RxxxGvA
	hdAfD2e3Awy9kfKO+Ua7Fe+xUseBIfdwxauPGIovnDNYjJlrrwhKwdWIs9O3YUhvuN0C
	Y4/w==
MIME-Version: 1.0
X-Received: by 10.182.39.69 with SMTP id n5mr11067451obk.72.1365255446018;
	Sat, 06 Apr 2013 06:37:26 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Sat, 6 Apr 2013 06:37:25 -0700 (PDT)
In-Reply-To: <83a882b9aef9d5a8054e9b291db1b24b6157443e.1365204818.git.paul.eggleton@linux.intel.com>
References: <cover.1365204818.git.paul.eggleton@linux.intel.com>
	<83a882b9aef9d5a8054e9b291db1b24b6157443e.1365204818.git.paul.eggleton@linux.intel.com>
Date: Sat, 6 Apr 2013 10:37:25 -0300
X-Google-Sender-Auth: otAzwoLkc6CVi_1n_mj54tNBwOM
Message-ID: <CAP9ODKorieu9sAbJczF83xGuwrxeH8G2KLvaZhn1KSpzAZFNNQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 3/4] packagegroup-qte-toolchain-target: remove bbappend
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
X-List-Received-Date: Sat, 06 Apr 2013 13:55:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Apr 5, 2013 at 8:35 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> This added Qwt to the Qt Embedded toolchain. This is a distro policy
> decision, and in any case Qwt is a third-party library which is not part
> of Qt. Distros that wish to do this should add this bbappend to their
> own layers.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

NACK

Keep PRINC please.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


