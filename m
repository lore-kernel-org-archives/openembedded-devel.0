Received: from mail-lpp01m020-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RvbSI-0002gY-CU
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Feb 2012 22:23:02 +0100
Received: by lbol12 with SMTP id l12so1093979lbo.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Feb 2012 13:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=/FLzXVSY/Tfj3unUja+WAF1Xed8QrBYzFATpSeGyBjQ=;
	b=SXWwdJJ6h60Rx3VcZdIybNPZWTwQ1J27sWGzcRL/vpKj9KYfMdhzm8I7HfoDhZEja0
	D9Je/3YoQ4fQZqKpytMgEhArPNpBn6J14DpCxLlUh18/LTtgbDV/qjbVZJ6040nWjERS
	n9XYB8fTLEReRvaNM+YP5UbkmGIgKMbwY3lns=
Received: by 10.152.123.68 with SMTP id ly4mr2318165lab.13.1328822097243; Thu,
	09 Feb 2012 13:14:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Thu, 9 Feb 2012 13:14:27 -0800 (PST)
In-Reply-To: <4F34274B.60502@palm.com>
References: <4F33048E.8030109@palm.com>
	<CAMKF1so61ndkzii_qK-sLiX6czvHXvaMFvBsxzm78z87zRTQkA@mail.gmail.com>
	<4F34274B.60502@palm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Feb 2012 13:14:27 -0800
Message-ID: <CAMKF1spW=804wWenyHN-v6cgs6yo0g9mYMSZVVg2EY+f4M53Wg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: bitbake versions
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
X-List-Received-Date: Thu, 09 Feb 2012 21:23:02 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 9, 2012 at 12:06 PM, Rich Pixley <rich.pixley@palm.com> wrote:
> I'll start over from 'core.

yeah right now we know that documentation is a bit of problem and we seek
people contributing to it as they move into oe-core/layered world

You can look at angstrom e.g. or yocto on how they utilize oe-core
in a layered design.


