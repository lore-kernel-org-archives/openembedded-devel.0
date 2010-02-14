Received: from mail-bw0-f219.google.com ([209.85.218.219])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1NghVt-0002Q4-IC
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Feb 2010 17:40:08 +0100
Received: by bwz19 with SMTP id 19so2936735bwz.28
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Feb 2010 08:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=Py1oawiu+yA2QJzpDtMCBBEpdnvWPy35wEk527QWE9c=;
	b=BM7uVz9ymRBcnCgNe3OySNeYwT9wGjbfbaQOyj5XiKPg4/W86ALT4EakNNzNjXEVoJ
	POom9xrBNUiFDQLwzw7YRvS3LAtKfIUcWldXC4LUNCgPonWGSdgtXMAGfYqbNhyLQUAO
	FtY6HIXDB20C7ioM9cD3rW2044JGIQzO5aIuM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=hmd8Gm14hrwn+ahgdvkCQYIdDh9yCLGt5/9iRYUHpClDom2Gy/lfGxcqGJnPTU51zN
	kwudxtx9rm2VGndoLKbOxcGgCJubM1PAVkyem6F2Ok944F9wQ+05UjoxHoEfwGxog46X
	czFLNxllC1JYtPzC0l7S9lvHw5KSFxp9exPow=
MIME-Version: 1.0
Received: by 10.204.14.86 with SMTP id f22mr2512633bka.107.1266165448300; Sun, 
	14 Feb 2010 08:37:28 -0800 (PST)
In-Reply-To: <20100214161328.GE5979@excalibur.local>
References: <20100213203508.540D614AF55@gandalf.denix.org>
	<20100214130905.GD5979@excalibur.local>
	<1266162635.5009.42.camel@mattotaupa>
	<20100214161328.GE5979@excalibur.local>
Date: Sun, 14 Feb 2010 17:37:28 +0100
Message-ID: <fca63bcf1002140837i631f5d62kb8b7481e7d266c1b@mail.gmail.com>
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.219
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Update state in Patchwork. (was: [PATCH] meta-toolchain: Run rmdir only if empty dirs are actually found.)
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
X-List-Received-Date: Sun, 14 Feb 2010 16:40:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

>> 2. Update the state.
>
> How? The webinterface does not offer my the functionality to change the state. I
> guess it is because I'm not in the right group or have otherwise not enough
> permissions in patchwork. As I just registered the account today it could be
> that I'm to late in the game to get updated with the rights in the last batch.
> :)
>
> regards
> Stefan Schmidt

I think you have to add the email address, the patch has been sent
from, to your account at [1].

(Atleast then I could update the status of MY patches that have been
rejected/applied by others.)

Regards,
Michael

[1] http://patchwork.openembedded.org/user/


