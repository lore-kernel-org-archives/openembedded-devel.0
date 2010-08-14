Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lukasmaerdian@googlemail.com>) id 1OkDMw-0001VI-W5
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Aug 2010 11:49:39 +0200
Received: by fxm6 with SMTP id 6so2320892fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Aug 2010 02:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:cc:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=FgUG6XE20nDP2TU53bTwMoXXiLNxIkPTVjj6aF37hmM=;
	b=fKkOQUmD3C6lI+LSmPFCOiyYf/oO9dtOfd7ivO8pW8f5rYgY5jlvU9A60O3ddy8rHv
	ikNy08NHTgcrvj2r7V64yAw7sbHHo3e/gh0rNlmM7pR6jJNEHNdLQBjlQsbRj4ftcrJ2
	T7rfNBElae2FXbSzZsNEFvSMO7yUsLuhymn38=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	b=nl9c51mwPitkbGo+LPfhRThP2Dj5zI2dubnTnobDsbpf7heyBGz8OuQUy28DxK78Sn
	D02xht0AtToyxJrbWGxzIYRySzcpSWWFOiHnXk9l9o/sXp3y48gabfcB+D6Jx5LVh8JW
	TjpFb0XUsxqni8HHsOxWOaan5pgo1g608K58I=
Received: by 10.223.119.210 with SMTP id a18mr3059404far.52.1281779364482;
	Sat, 14 Aug 2010 02:49:24 -0700 (PDT)
Received: from [192.168.178.41] (p4FDB1210.dip0.t-ipconnect.de [79.219.18.16])
	by mx.google.com with ESMTPS id
	k25sm1504778fac.41.2010.08.14.02.49.23
	(version=SSLv3 cipher=RC4-MD5); Sat, 14 Aug 2010 02:49:23 -0700 (PDT)
Message-ID: <4C6666A2.2040203@googlemail.com>
Date: Sat, 14 Aug 2010 11:49:22 +0200
From: =?ISO-8859-1?Q?Lukas_M=E4rdian?= <lukasmaerdian@googlemail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100713 Lightning/1.0b1 Thunderbird/3.0.6
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1281749324-22589-1-git-send-email-lukasmaerdian@gmail.com>
	<20100814081222.GD10076@jama>
In-Reply-To: <20100814081222.GD10076@jama>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: lukasmaerdian@googlemail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: =?ISO-8859-1?Q?rdian?= <lukasmaerdian@gmail.com>,
	openembedded-devel@lists.openembedded.org, =?ISO-8859-1?Q?Lukas_M=E4?=
Subject: Re: [PATCH] bump libphone-ui and libphone-ui-shr as to the 0.0.1 release and bump SRCREV to the 0.0.1 commit
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
X-List-Received-Date: Sat, 14 Aug 2010 09:49:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Am 14.08.2010 10:12, schrieb Martin Jansa:
>
> Applied, thanks!
>
> Next time, please prepare better commit message:
> http://wiki.openembedded.net/index.php/Commit_Policy
>

It was my first OE patch and I wasn't aware of the commit policy.
Will take care next time, thanks!

-- Lukas


