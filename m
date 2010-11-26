Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1PM3C0-00031k-HK
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Nov 2010 19:38:44 +0100
Received: by wyb40 with SMTP id 40so2264222wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Nov 2010 10:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=QuICOq1h/mbezt9XrOUG/7aD17x/IDHnz9gTzdMtBr4=;
	b=lKe5veZVljqrhQ/LjcSh+b26Xwsiu4WF/MAd7U+8IGQyLQCKMNZgvXWp5XtQP6j+Mc
	Egj1l7G878noiLLRMzxljABV6tdfeDOGknNk+DWMWfopqUT0OuRrDAxuU0AeEpi7Ng62
	NvuooXnbxpJIDGObP/IbiJSnppiMGvgVGLAzs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=tkrpjFcxHDLPJ5OQZlZlktQwAoBw9H3j0Gjcp7faQoLvd3Imheyrr2URwVmjaugvIG
	ay+fRXC62aGiWNMRwTheDLP70J6TcZkL2lxSpSLlLbU6WwiGNnD2amlSEhJx90qgp10E
	/7xu5dwaW/uc9Qf1o0zq6cd+6RdwSd82wBHus=
MIME-Version: 1.0
Received: by 10.216.199.81 with SMTP id w59mr231745wen.100.1290796643248; Fri,
	26 Nov 2010 10:37:23 -0800 (PST)
Received: by 10.216.49.130 with HTTP; Fri, 26 Nov 2010 10:37:23 -0800 (PST)
In-Reply-To: <ico56o$f8$2@dough.gmane.org>
References: <1290768432-13366-1-git-send-email-ynezz@true.cz>
	<AANLkTi=SB9wuO4wcTXz3M5fYb2WyO09_pK3ooA+i4xgo@mail.gmail.com>
	<ico56o$f8$2@dough.gmane.org>
Date: Fri, 26 Nov 2010 19:37:23 +0100
Message-ID: <AANLkTinK9h557fQ3Ob=chdkoA5AiSjRxVe90dx43K320@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] angstrom-2008.1: bump uclibc to 0.9.30.3 which unbreaks x264
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
X-List-Received-Date: Fri, 26 Nov 2010 18:38:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

>> So I suppose we should do a combined upgrade of uclibc and binutils.
>> I'll test with current gcc-4.3.3 and let you know.

FWIW angstrom-2008.1 console, opie, x11, x11-gpe images build fine
with binutils "2.20.1" and uclibc "git" like minimal distro but  with
gcc-4.3.3.

> An upgrade of binutils is out of the question for angstrom 2008.

I understand, too late now.
Shame on us for the lack of uclibc testing :/

Regards

Andrea


