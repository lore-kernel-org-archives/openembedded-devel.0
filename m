Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cdhmanning@gmail.com>) id 1PpBsZ-0007rI-6T
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 04:47:07 +0100
Received: by fxm17 with SMTP id 17so5624393fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 19:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=KCLtXpbXdPGCxmhTnH4X7KnER4w/XeCRhGXI6ebHIXc=;
	b=xSaCVUQ0zlox3EXFxq4pzGMY0GUdVtwB5nOFvoyHv9zFD1G97Q+nVd293UnVg/s4vh
	uLfaqX1F9uIITMvQEva9efnxO4CrmnKH99zg1zf7NatcU6FsTCw9XG3VfWR+MMj5+n5h
	siS9oBngeaX9FtI0+6BM5pdfpiE2kl5JvOnOs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=K13o5cM0ZS54PxTqyOFKHk1IVFaH7FZ3bkNnVeKx/rmYvCVP5JD+r0Pnn38wmrunVk
	rdyofc/AQiJwunXS7u6k1Y/+xTEofruQwIOwq4Nu2vsZX7LryqH2qUYVC3/8L82g79YC
	pGsgrqFXhrizMBIjs6y9JeoT2AaPd739+TZKY=
MIME-Version: 1.0
Received: by 10.223.86.135 with SMTP id s7mr5588777fal.70.1297741557693; Mon,
	14 Feb 2011 19:45:57 -0800 (PST)
Received: by 10.223.93.205 with HTTP; Mon, 14 Feb 2011 19:45:57 -0800 (PST)
In-Reply-To: <20110214223458.GB20605@sakrah.homelinux.org>
References: <AANLkTikLpJU9q7woyJrpTVWaAXK_m557J1uXAF-HLBCs@mail.gmail.com>
	<20110214223458.GB20605@sakrah.homelinux.org>
Date: Tue, 15 Feb 2011 16:45:57 +1300
Message-ID: <AANLkTintqz33=N42JHjm=7HtP4hF8WUFvxuL0i=B71Qo@mail.gmail.com>
From: Charles Manning <cdhmanning@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Which recipe to get EFL into SDK
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
X-List-Received-Date: Tue, 15 Feb 2011 03:47:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 15, 2011 at 11:34 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On (15/02/11 11:17), Charles Manning wrote:
>> Hello
>>
>> I am building an SDK and have managed to get everything added to it
>> that I want except for EFL.
>>
>> Any hints as to what recipe to use to add EFL to the SDK?
> there is a meta task
> task-efl.bb in recipes/tasks that might be a good starting point
>

I am confused.

Are you suggesting that I should be able to include task-efl.bb or are
you suggesting I should
be able to make a lib building version of task-efl.bb?


