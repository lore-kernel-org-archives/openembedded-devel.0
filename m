Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1PlNBY-0006WX-BP
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 16:02:58 +0100
Received: by pxi17 with SMTP id 17so413423pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Feb 2011 07:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=Dk2KVqtxxKWbLNNbq9vokiqj+aj+fDHbDAGw6BRHfdo=;
	b=V/D9H3XAHUZq1s4q3RmkxdIvi9b9necPVZVeQYtYI3E9ev5qskMp3/9DV2p89fN4lT
	7OwS1SPhWg8Qc6gY0TiqkaHDzOVmAcpElOcLZX6fRGf3G+dwIXqfEWXarlgiixGxqz2j
	EgGdgV+ypq0YwTIVi6mpfpUR5HIm5OnDNaigw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=w2mujy/xRYURINxyMIr9zL65ERNSNuHgTfBibMh1IfX8eeDIth/+j7jMZ7LbXwN6N6
	uzhlwTg/UzwToPSfPJLXHq0vjmU4Dki8skfenA4aLYeQNwV97ZbSmuJZcMeO17IExIhQ
	jBXLBCu/usomnW6X46wtlZ9dsS0N+KSxrpBwg=
MIME-Version: 1.0
Received: by 10.142.207.7 with SMTP id e7mr2425876wfg.259.1296831717743; Fri,
	04 Feb 2011 07:01:57 -0800 (PST)
Received: by 10.142.155.8 with HTTP; Fri, 4 Feb 2011 07:01:57 -0800 (PST)
In-Reply-To: <AANLkTi=QkexH5odXt9-6a9SFe=hhyv=tsiBXOhHt-u9p@mail.gmail.com>
References: <AANLkTi=QkexH5odXt9-6a9SFe=hhyv=tsiBXOhHt-u9p@mail.gmail.com>
Date: Fri, 4 Feb 2011 10:01:57 -0500
Message-ID: <AANLkTi=HQbkySF+iv50VAZcKHm6uxF_iW12z-6zBxo=N@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: testing branch 2011-02-03
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
X-List-Received-Date: Fri, 04 Feb 2011 15:02:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 4, 2011 at 8:08 AM, Cliff Brake <cliff.brake@gmail.com> wrote:
> master has been merged to testing-next and is ready for clean builds.
>
> I realize I've been tardy in getting the testing-next going, so I'm
> going to create a cron job now that does that weekly.

OK, I have created the script and have it set to run in a cron job:

http://www.openembedded.org/index.php/Testing#Testing_Procedure
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=db60254c965392e21ba5438b1530cb7049574dfa

So, we'll see if that works any better.

Thanks,
Cliff

-- 
=================
http://bec-systems.com


