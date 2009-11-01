Received: from [74.125.78.145] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay4mail@gmail.com>) id 1N4Vsz-0007TG-S3
	for openembedded-devel@lists.openembedded.org;
	Sun, 01 Nov 2009 09:34:08 +0100
Received: by ey-out-1920.google.com with SMTP id 5so73400eyb.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Nov 2009 01:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=ULyfVnMxO7SaQ0DaPRbMfJfkcuDlqsRzL9Sk3iL12kU=;
	b=CoA6O409Aigy4apJURfsb7Ku0vsN43C8DAZqZ9G1bt4vHjLflG7wXuQruutSl4hXFj
	erIMg9YMsJBbTlC9lW02VuE2lPXSnGlwS1Uz/rtT+ev6DXCHO92vKM8S3c4B7aZrC8zj
	3FXr91zN4FUNkn+uNY5BXxkifNeY4nrLwCSyo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:references:in-reply-to:mime-version
	:content-type:content-transfer-encoding:message-id;
	b=Ub7Vs3HvdQybRCdRTkRCC2gbbvZIvFzFhg9kQh4/tfPi0zFceBMFop8PSBshBUsD+5
	M9UIk7eZNFvDD1EjOGh0P8ChvgBHTSiCNmru3eZo8a8t/jFUOqDzHJpPJuvoQVFA+Zi0
	vHi+Ep9eB5OAzjRed90JjDZe+YiiFKa8F0GUo=
Received: by 10.216.90.196 with SMTP id e46mr2667996wef.194.1257064377077;
	Sun, 01 Nov 2009 01:32:57 -0700 (PDT)
Received: from is.home (93-81-68-255.broadband.corbina.ru [93.81.68.255])
	by mx.google.com with ESMTPS id 5sm3174211eyf.11.2009.11.01.01.32.54
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 01 Nov 2009 01:32:55 -0700 (PDT)
From: Yuri Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 1 Nov 2009 11:32:24 +0300
User-Agent: KMail/1.12.2 (Linux/2.6.30-std-def-alt14; KDE/4.3.2; i686; ; )
References: <200910302300.02775.david.lanzendoerfer@o2s.ch>
	<20091031145402.GA4300@rhein.zuhause.netz>
	<200910311857.54380.david.lanzendoerfer@o2s.ch>
In-Reply-To: <200910311857.54380.david.lanzendoerfer@o2s.ch>
MIME-Version: 1.0
Message-Id: <200911011132.24990.jay4mail@gmail.com>
X-SA-Exim-Connect-IP: 74.125.78.145
X-SA-Exim-Mail-From: jay4mail@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Maemo5 and OE
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
X-List-Received-Date: Sun, 01 Nov 2009 08:34:09 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit

Hello!

> Here [1] is the link to the mentioned maemo port for OE.
> Until now, it doesnt seem to be an indipendent branch in the repository.
> maemo5-angstrom and maemo4-angstrom branches would be nice approaches to
>  the goal to get hildon desktop fully integrated into the project.
> I'm glad to hear, that someone is on it.
> I'll check next week to see, if theres something new.
> If it is, just ask for help, I'm very motivated to get it running as soon
>  as possible :-)
> 
> [1] http://github.com/rkirti/maemo_angstrom

I'm very interested in running hildon environment on my Zauruses (Akita and 
Tosa). This may requre some patching for smaller screen size (640x480 vs 
800x480). But I still have no time to test it. I've called for testers on 
local community.

-- 
Yuri Bushmelev


