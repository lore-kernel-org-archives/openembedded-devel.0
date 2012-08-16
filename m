Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1T1ycF-0003uc-EG
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Aug 2012 13:51:55 +0200
Received: by pbcwy7 with SMTP id wy7so1744329pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2012 04:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=2H5kF7y5OTa4L8KuuIdztpDNKoKhjXLe5TTvCPqCx4w=;
	b=nO4/bCdZxR3bSiQCcE+H4oCKvzbyqiwpWWQBOFYKgLsG4Zr6Fc5NMPAFTNlgxyvrCH
	popkLd4wBMgafa6E99i/EyAybqYxml2BttnBq8qmifw/ZfJi6pNd+9A48P5xSXI/8fZJ
	twdqwvrMngGaJ6ePXrmLf/zOlSyGQg09H0Z2yO/A914/DAUb+RBjTGgV+rVN6nyjwKk3
	ebaiJZAXifJSDt2QS//DXVYP0io9zvsQz07j7wOMiTgRRmfKu3Ta4C5P+PxH6sshVi8h
	xEI/f5D4xbnWut3mJbTu844WSdAMtPZD6atUsmop3VsPAg5N2xNyF6RTLM7ZpKv2mE+2
	qJDg==
MIME-Version: 1.0
Received: by 10.66.76.196 with SMTP id m4mr1703364paw.61.1345117197334; Thu,
	16 Aug 2012 04:39:57 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.36.105 with HTTP; Thu, 16 Aug 2012 04:39:57 -0700 (PDT)
In-Reply-To: <CAMKF1srS0y-TDqYJHq3jzoaz0nDmn-OP_F9R_bh5FptOzXCEvg@mail.gmail.com>
References: <1345031739-8374-1-git-send-email-paul.eggleton@linux.intel.com>
	<CAP9ODKpUziM4W+UiK=da9UkO+UMA-wErx3QQCVM-Rbr7zx-XJQ@mail.gmail.com>
	<CAMKF1srS0y-TDqYJHq3jzoaz0nDmn-OP_F9R_bh5FptOzXCEvg@mail.gmail.com>
Date: Thu, 16 Aug 2012 08:39:57 -0300
X-Google-Sender-Auth: 8eWQDKCi2XwNpzJ-99wW_bzttlQ
Message-ID: <CAP9ODKrDoKKc9hU4bdRr2SeqD6w92bfsyKe_vgf6vrBJ7FKmBg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@lists.linuxtogo.org
Subject: Re: [meta-oe][PATCH] freerdp-extension-xpunlimited: inherit gitpkgv
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
X-List-Received-Date: Thu, 16 Aug 2012 11:51:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 16, 2012 at 1:09 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Aug 15, 2012 at 10:48 AM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>> On Wed, Aug 15, 2012 at 8:55 AM, Paul Eggleton
>> <paul.eggleton@linux.intel.com> wrote:
>>> If you refer to GITPKGVTAG you need to inherit gitpkgv or the result is
>>> a parsing error.
>
> since its not working and therefore carries no baggage lets try not
> use GITPKGVTAG if possible ?

Why it is not working? I've been using it internally a lot and it
works fine for me.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


