Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TQcD6-0003YA-QL
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Oct 2012 12:59:49 +0200
Received: by mail-pb0-f47.google.com with SMTP id ro12so307083pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Oct 2012 03:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=iZfgry9NYmu8yEpf8ZcxHG4Vu4xLkMDumzQgV0btt0Q=;
	b=gFXssnVYQgB82ecuBFiGttsI29IFywfzJHYzP6VksudoR+MI8Tdber98QjitNUQWwv
	MwsRyHi72knCzMVfyqaeqhunvtr/IRJ/AAP5qIG1v9VZqKv/FOGuebvaSmnTjSu1/CCJ
	0k8YhL00HTZWNC/upfr+xFKiS5tF6n79MyHm1k29P9gNdQMDBYEpcK4wIQSs8jHxZiOq
	gB+5K4RP7YRw2Ye/81dHX9mwYq8D9XZebHHMjGL02SOeAZi3fKQ1iclPv4u+Aw0qSX6x
	8l0h4qBq8nWjHnwwm5U0VSXbM8AwYFp7otDdXbEtYDf6qUKcCkzcNnpVYrKbFI6bp64s
	snpg==
MIME-Version: 1.0
Received: by 10.68.135.168 with SMTP id pt8mr39572874pbb.24.1350989182114;
	Tue, 23 Oct 2012 03:46:22 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.40.201 with HTTP; Tue, 23 Oct 2012 03:46:22 -0700 (PDT)
In-Reply-To: <1350981961-5198-1-git-send-email-paul.eggleton@linux.intel.com>
References: <1350981961-5198-1-git-send-email-paul.eggleton@linux.intel.com>
Date: Tue, 23 Oct 2012 08:46:22 -0200
X-Google-Sender-Auth: _Gr8pclFjg_SKQVeJJL6h9719Pw
Message-ID: <CAP9ODKq04btVML34-Aw4LhbH7N+hgfXY6BxVAM50PjOp7e2xbQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] hddtemp: add from OE-Classic and update
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
X-List-Received-Date: Tue, 23 Oct 2012 10:59:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Oct 23, 2012 at 6:46 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> hddtemp is unmaintained upstream so we have to do a bit of patching. All
> patches sourced from Debian/Fedora, except hddtemp-no-nls-support.patch
> which came from OE-Classic.
>
> Other improvements:
> * Add initscript from Debian
> * Make LICENSE more accurate
> * Add LIC_FILES_CHKSUM
> * inherit gettext to avoid error during configure
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Much better :-)

Thanks by looking at it.

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


