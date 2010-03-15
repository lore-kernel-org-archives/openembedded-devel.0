Received: from mail-gx0-f224.google.com ([209.85.217.224])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NrF4w-0007VU-4n
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 19:31:54 +0100
Received: by gxk24 with SMTP id 24so418761gxk.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 11:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=+V8px17OYYP+FMrpF88MbfXXFaioBX9PieviHCU2Dg0=;
	b=fFlKodCKETezxipKfsRJ8GspZk8SI3GG/W73hPsgUBMLV+LyQ7HZUTngbrdhryoMTh
	FNI9SRy+kxQVHATlKi5iYweLs9ZHtMw8Q4Dap4Ca8FPwOkkghyVVkeITsKooZVcVD0lB
	6oUiKMpzk22O5YJvRe1l5HKKEmnWjCmRFh0kI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=d6l/KbvRHTl5EVjPTEJZFdSgLOMbZdjWWwt/5SA9ZIgaEHNUSrOmL19VZBBBWCEvEX
	gSxKEIiYldssZKrC6CvShe7X4kXIKSf3Erq7ybrbkXtCdSkSul66McmGBm8SjGNOlw5Z
	hDGU6TupX4mXjCtTkWjT9KJENf7jHBvyKt70A=
MIME-Version: 1.0
Received: by 10.101.155.19 with SMTP id h19mr1614699ano.43.1268677233325; Mon, 
	15 Mar 2010 11:20:33 -0700 (PDT)
In-Reply-To: <201003151658.08401.holger+oe@freyther.de>
References: <201003081300.19058.holger+oe@freyther.de>
	<hnkunp$sju$1@dough.gmane.org>
	<ac9c93b11003150251w3ca229d6uedc63c4dae21e52f@mail.gmail.com>
	<201003151658.08401.holger+oe@freyther.de>
Date: Mon, 15 Mar 2010 19:20:33 +0100
Message-ID: <ac9c93b11003151120w7b467a07m8916030fe51b107c@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.224
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: samba-essential upgrade or remove?
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
X-List-Received-Date: Mon, 15 Mar 2010 18:31:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/3/15 Holger Hans Peter Freyther <holger+oe@freyther.de>:
> On Monday 15 March 2010 10:51:33 Frans Meulenbroeks wrote:
>
>> > I don't think 1) is a realistic option, if we go with that, we should
>> > just redirect oe.org to buildroot.org and go home.
>>
>> Why is it not realistic.
>> Lots of driver code I get from commercial vendors, contain statements like
>> "this is sample code only, not intended for use in products, proceed
>> at own risk, bla bla bla".
>
> You are mixing two things again. One is warranty and of course our MIT license
> says that the stuff comes "as is" without warranty and such. The other is what
> do we want to try. I think we should folllow CVEs and have no known security
> issues in our default set (bitbake -s).

Be my guest :-)
Given the hostile attitude of some people here, I'm becoming less and
less interested to contribute.
Guess some will be happy about that :-(

Frans


