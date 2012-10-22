Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TQK51-0003oZ-MO
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Oct 2012 17:38:15 +0200
Received: by mail-ie0-f175.google.com with SMTP id c13so3699406ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Oct 2012 08:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=6MmhNL5kO6IMWYV26HQpsFUY58l98+Iyd4YX9yGOxvU=;
	b=AMnVajTldTgPDJ2yhnNe9/jVs4/no6LFmtK8UGAosTIqt9y6eFbi2Z1Ln3nDQthT1h
	lxYBjT7mJDYpYmJSkrK+4EuEkiVhodqBklniyh8hdU7A3aGF5/CdnXkSgrqCFBtkrjst
	M8vJxRQH2rEJSSHY93e9Db03kN7iwk4iNHpFBM5fLHxZhDWSVTxCY1SvuVIkruotds3p
	Kao9Q+97BJUkM9zb3AP6xWBuOY4w21gPs7ePcuCLB5N/oR/bcYC3yluCllqjII3Xkars
	q306ACZ3PU5NLXkReVbrvr1+Y7MuRzuGcURe/f2xxRq2+ScqE97Fwj7Sktszm+DT8RGa
	veEg==
MIME-Version: 1.0
Received: by 10.50.181.202 with SMTP id dy10mr9606979igc.14.1350919490367;
	Mon, 22 Oct 2012 08:24:50 -0700 (PDT)
Received: by 10.64.24.179 with HTTP; Mon, 22 Oct 2012 08:24:50 -0700 (PDT)
In-Reply-To: <CAMQ5J2bVMpK6+uX4Rbi0spKLduy5of4JX2esXZbOE5k_muvATg@mail.gmail.com>
References: <1350918808-23478-1-git-send-email-s.stirtzel@googlemail.com>
	<CAMQ5J2bVMpK6+uX4Rbi0spKLduy5of4JX2esXZbOE5k_muvATg@mail.gmail.com>
Date: Mon, 22 Oct 2012 17:24:50 +0200
Message-ID: <CAGiJk9cJq2uQXBw6GtXg8gc=MSdHp7Y_ZVgRP6FiE8gLsLiN+g@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v3] libjpeg-turbo: Add RPROVIDES to fix errors when rdepending on jpeg
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
X-List-Received-Date: Mon, 22 Oct 2012 15:38:15 -0000
Content-Type: text/plain; charset=UTF-8

2012/10/22 RaNgErS <rangers.av@gmail.com>:
> Hi,
>
> I had a problem with do_rootfs. Using master branch and 2012. Distro.

Hi,

do you have any more specific information, like the error message?
Or which package failed the rootfs? / what image did you build?


-- 
Regards
Samuel


