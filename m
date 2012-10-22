Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rangers.av@gmail.com>) id 1TQKsx-0004qm-RB
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Oct 2012 18:29:51 +0200
Received: by mail-la0-f47.google.com with SMTP id h5so1613212lam.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Oct 2012 09:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=t4XUmyftz8Yq1PJurEkwMo5RBxzBNcnkQIXni905cD8=;
	b=rLOZcHVgeyrEL/zlnsKwEzS1M+n9ilHt5/pjInMzKJCTTBP5fibqV/GNI5cXeO4jWw
	MQUQTWFCk0VSu3IRtxBkH1NMfU5OAJcLGK89nT3dssCUlBlx4EbsB6E2ujlSdkhGOiSx
	tPe0u47vVMMvyMkDKGmynNWtWhldLToRnkOc98etuG7JIQ1/mKjwmbl9mpDs7YrZKvJ4
	fjPLLqNlJdrCBKIaIrxW8VAEf8n9JunpfJOIwB0H4sle0ZIw/fAKgocxIWpdxa1ZCaDR
	zjSqrI730RePqm1py2UkGuOCtD2lyt3MYvHJNEAvGduxoHBIPnKNeUTA7UeHHo2Vz7cK
	Awmw==
MIME-Version: 1.0
Received: by 10.152.104.115 with SMTP id gd19mr8799362lab.13.1350922586938;
	Mon, 22 Oct 2012 09:16:26 -0700 (PDT)
Received: by 10.112.28.8 with HTTP; Mon, 22 Oct 2012 09:16:26 -0700 (PDT)
Received: by 10.112.28.8 with HTTP; Mon, 22 Oct 2012 09:16:26 -0700 (PDT)
In-Reply-To: <CAGiJk9cJq2uQXBw6GtXg8gc=MSdHp7Y_ZVgRP6FiE8gLsLiN+g@mail.gmail.com>
References: <1350918808-23478-1-git-send-email-s.stirtzel@googlemail.com>
	<CAMQ5J2bVMpK6+uX4Rbi0spKLduy5of4JX2esXZbOE5k_muvATg@mail.gmail.com>
	<CAGiJk9cJq2uQXBw6GtXg8gc=MSdHp7Y_ZVgRP6FiE8gLsLiN+g@mail.gmail.com>
Date: Mon, 22 Oct 2012 21:46:26 +0530
Message-ID: <CAMQ5J2ZsmYhjG-3Ket0hft1xL7uS2qomyxywQAaZMidoC+Ps5A@mail.gmail.com>
From: RaNgErS <rangers.av@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
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
X-List-Received-Date: Mon, 22 Oct 2012 16:29:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,
I am already sent a mail about this before 3 weeks to admin. And it is not
posted .

I have posted the same in the following link. Pardon me for providing an
exterrnal link .

http://stackoverflow.com/questions/12909202/openembedded-do-rootfs-failed

On Oct 22, 2012 8:55 PM, "Samuel Stirtzel" <s.stirtzel@googlemail.com>
wrote:
>
> 2012/10/22 RaNgErS <rangers.av@gmail.com>:
> > Hi,
> >
> > I had a problem with do_rootfs. Using master branch and 2012. Distro.
>
> Hi,
>
> do you have any more specific information, like the error message?
> Or which package failed the rootfs? / what image did you build?
>
>
> --
> Regards
> Samuel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

