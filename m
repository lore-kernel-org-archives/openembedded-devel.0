Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TPXe7-0008Ea-HF
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Oct 2012 13:55:15 +0200
Received: by mail-pb0-f47.google.com with SMTP id ro12so893794pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Oct 2012 04:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=s/VDIbpg5E4EY3nf13kuGp9RBx2pWMgoQ+ZcZGC9Wp4=;
	b=VQOdZa5IWB/JwxPn+7kI/oCv869lfD5wnRtCZQc15kC3RJQaduy/+IpFVnTTIDmd4/
	aX6/FNw15a+ckbLnp7SUpb2ml782t7bjomD0L5AI7RMC2LJtJ7tFml7B9P+fDQkZ1Kw9
	NKLE2mJnwXbGE3laG1mIE/2PXb+z2K620qifJ8/GDwHOyY6pibEDB5Qemb2OWFmIdjfT
	RZ3j7xOi9KQwlD4zeK6u63+yFEtGI//Fy2vTPgWgP03XcyuZsuqWhY+C7/tYu/I879YN
	Jdiz7a3N8suC+yqZ+8xDIPZiXPK/XU/9lN4jQL/ZpjGQJHDdZmmEwW9RIcTlaLSifcpy
	p+GQ==
MIME-Version: 1.0
Received: by 10.68.218.226 with SMTP id pj2mr14979561pbc.33.1350733312710;
	Sat, 20 Oct 2012 04:41:52 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.40.201 with HTTP; Sat, 20 Oct 2012 04:41:52 -0700 (PDT)
In-Reply-To: <1350732352-5383-1-git-send-email-paul.eggleton@linux.intel.com>
References: <1350732352-5383-1-git-send-email-paul.eggleton@linux.intel.com>
Date: Sat, 20 Oct 2012 08:41:52 -0300
X-Google-Sender-Auth: 01cpSOa94V_miD40PQXoXUSPT20
Message-ID: <CAP9ODKrExE8s8_X+8JD8spK3XY9n905TzZE4Ete9WGOtUNTjDw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] hddtemp: add from OE-Classic and update
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
X-List-Received-Date: Sat, 20 Oct 2012 11:55:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Oct 20, 2012 at 8:25 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> hddtemp is unmaintained upstream so we have to do a bit of patching. All
> patches sourced from Debian/Fedora, except hddtemp-no-nls-support.patch
> which came from OE-Classic.
>
> Other improvements:
> * Install initscript
> * Make LICENSE more accurate
> * Add LIC_FILES_CHKSUM
> * inherit gettext to avoid error during configure
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>


-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


