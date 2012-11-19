Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TaQwu-0000ys-3P
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Nov 2012 13:59:40 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa11so3040662pad.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Nov 2012 04:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=7KiMHHRU9n7PXFoaZrVqEAaAQDvNPjNFQcYkDrmBBco=;
	b=adyQW8laHgvrqOXR5FlvoO33sslRhOkD03SVYxr+FTX67BQLx/emMDMnNHjPtsuuUU
	mky2i+DfRQHOYZ8mjV8455ZGSJVoEHvqnpccYCXamle44cNFKswi2z6IAyoAKxtvXfcf
	S1rGTbxt9aFGk7cKVK9FqLRlUxnZy9TQ083KZ13JUM4/ih08nZBHG3/WwJFiO+o/siIT
	w6gWQjTgRKMRRduk1IggRIkhz7ZRJCIJglmOLKTda2+RaRJc/BzNtWtUqjEwe8WRr39W
	lFnLlUGRyFP3RB0q7Ze2uGlBtVviKdWQUTNvxp0PKEy6vnH3VeqZn76es94XDx6Z6KgL
	/eRw==
MIME-Version: 1.0
Received: by 10.68.234.98 with SMTP id ud2mr32946178pbc.136.1353329137257;
	Mon, 19 Nov 2012 04:45:37 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Mon, 19 Nov 2012 04:45:37 -0800 (PST)
In-Reply-To: <1353326429-14624-1-git-send-email-mario@ossystems.com.br>
References: <1353326429-14624-1-git-send-email-mario@ossystems.com.br>
Date: Mon, 19 Nov 2012 10:45:37 -0200
X-Google-Sender-Auth: EhNYFXLjR3EiEwJIt6P8ZFb3eDM
Message-ID: <CAP9ODKpjB-rSY5saAwcF6QYnb2fp0DdZE4OnJCp_Zh9-_ZQjwQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: Re: [meta-oe][PATCH] orbit2: put .a files into ${PN}-staticdev package
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
X-List-Received-Date: Mon, 19 Nov 2012 12:59:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Nov 19, 2012 at 10:00 AM, Mario Domenech Goulart <
mario@ossystems.com.br> wrote:

> Change-Id: I1b1d5452fd0252f489061a7c6035a97e837c1d45
> Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

