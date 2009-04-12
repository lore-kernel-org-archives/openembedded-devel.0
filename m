Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1Lt1KJ-0005Uk-Gg
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Apr 2009 17:10:33 +0200
Received: by ewy20 with SMTP id 20so1811375ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Apr 2009 08:07:00 -0700 (PDT)
Received: by 10.210.137.14 with SMTP id k14mr4514018ebd.92.1239548820827;
	Sun, 12 Apr 2009 08:07:00 -0700 (PDT)
Received: from ?192.168.1.10? (94-193-93-235.zone7.bethere.co.uk
	[94.193.93.235])
	by mx.google.com with ESMTPS id 21sm4555321ewy.66.2009.04.12.08.06.59
	(version=SSLv3 cipher=RC4-MD5); Sun, 12 Apr 2009 08:07:00 -0700 (PDT)
Message-ID: <49E20393.6060701@xora.org.uk>
Date: Sun, 12 Apr 2009 16:06:59 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1239271446-6732-1-git-send-email-k.kooi@student.utwente.nl>
	<19c1b8a90904120740w68992392u6ac0b780e083abd8@mail.gmail.com>
In-Reply-To: <19c1b8a90904120740w68992392u6ac0b780e083abd8@mail.gmail.com>
X-Enigmail-Version: 0.95.0
X-SA-Exim-Connect-IP: 209.85.219.172
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>
Subject: Re: [STABLE][PATCH] bluez4: add less restrictive (and hence less secure) bluetooth dbus config
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
X-List-Received-Date: Sun, 12 Apr 2009 15:10:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> Acked-by: Khem Raj <raj.khem@gmail.com>
>
>
> oh the PR is jumping from 4 to 6. May be it should be 5 ?
>
>   
I guess stuff merged from .dev should keep compatible PR numbers.
Otherwise it starts to get real painful to maintain.

Graeme



