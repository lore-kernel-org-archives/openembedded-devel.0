Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1PlMd6-0004Hg-KL
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 15:27:20 +0100
Received: by pwi8 with SMTP id 8so434227pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Feb 2011 06:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=r9yT/hgXL6uxuWlzOkCRkGD2P9jykAubpdO/ZOz7W2Q=;
	b=seiuR4Hkydk7oXbUqtRmDfpTfI9eQIRMwhP/10X7WtQBcrcK4DoLZ0/AW4rmYNZV4t
	2wafj/WiDqHNh/UVFlTV2Ehc9Ini2t0L1YpIscK+/YFozBBny6GoNlsXw0WNEWT+BNbd
	AIbhf9wVcoOxr+M0sHeGpBmooplYBwdDA0RO8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=vzCXIeXBokdup6RtyAUk3VGvBk+9KVrc4JgJwprvNhLkYFJm7wEcClllrY8QtGRtWq
	Nl8leVi41+a5mwVGbhu3na+4Z/3SBsX43fOjlJM/g51sP/GgzJEbX2i843EomwSUOrm7
	zli6FQMxR5sHAsJHLhLDZa3ypIpC8/a64jizg=
MIME-Version: 1.0
Received: by 10.142.203.2 with SMTP id a2mr11783330wfg.31.1296829581088; Fri,
	04 Feb 2011 06:26:21 -0800 (PST)
Received: by 10.142.155.8 with HTTP; Fri, 4 Feb 2011 06:26:21 -0800 (PST)
In-Reply-To: <AANLkTinAbLLKzbMbcQNSkgh8dQj+FD7WtuVd+wQ1ZKmz@mail.gmail.com>
References: <AANLkTinAbLLKzbMbcQNSkgh8dQj+FD7WtuVd+wQ1ZKmz@mail.gmail.com>
Date: Fri, 4 Feb 2011 09:26:21 -0500
Message-ID: <AANLkTik3N3mv2aO09vBnBx-XYxA0B9K6MB3fS0urGJ8c@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: oestats as automated testing reporting tool (Was: testing branch 2011-01-20)
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
X-List-Received-Date: Fri, 04 Feb 2011 14:27:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 26, 2011 at 5:04 PM, Yury Bushmelev <jay4mail@gmail.com> wrote:
> I have spent some time to looking over oestats client and server code.
> Below are some ideas.

Thanks for looking into this.

> P.S.: Do we really need this in perspective of merging with yocto? Or
> may be just use e.g. some spreadsheet/form on google instead?

I think long term, the OE testing effort will still be valuable as it
has the potential to test way more combinations that Yocto or oe-core
will support.  The goal is to provide users with a known working
starting point for the target board/arch they are interested in.  I
think there is also value in having multiple people involved as we end
up covering more workstation distros.  However, I don't have a clear
vision yet where things are going, so this may all change.

Cliff

-- 
=================
http://bec-systems.com


