Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1SCzmJ-000489-K1
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Mar 2012 22:47:36 +0200
Received: by vcbfl13 with SMTP id fl13so1181448vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2012 13:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=PKhHgkZ9JUOlVbJyIu0Ktf3AE+2OVvvycmQ1w9IRWbE=;
	b=uN7GX9elVn4UR7E9mgOItZcAtbdZY5jyxn1XHzDQkQ25F0rlLcWe9GoISJlS1R/WJI
	44oXH9UkJF5bl8A6XVoshje3eJlowsDQnjICEpMOXHtZljArK+fGgT7yRjeWm9RkpgxX
	n6vRbZ79AGe3RGoalfphEorIVxPpkk8st4UQ3PEE/7+SVIZ2LiA6LllgRkprDVNkSCLw
	ez2U8QTpYqe9RUBTtqngMiPN3X7zM7hWD9zRIHOJYAhQD5LumefV+vfOh3NIDqr8Lpea
	N5zsSXrCBQ2aro2GX/9KMcgsfljGGzQmFwA80pkECEIOhrgb949/M7rXvp9ULMmpnH4X
	rQPg==
MIME-Version: 1.0
Received: by 10.220.116.68 with SMTP id l4mr14828031vcq.4.1332967110994; Wed,
	28 Mar 2012 13:38:30 -0700 (PDT)
Received: by 10.52.88.228 with HTTP; Wed, 28 Mar 2012 13:38:30 -0700 (PDT)
In-Reply-To: <4F736B9F.9050304@dynamicdevices.co.uk>
References: <1332888458-15872-1-git-send-email-ajlennon@dynamicdevices.co.uk>
	<CACW_hTZ1Bu7X12=BLq+dfX-xHQzy829_w-fjwDX0VEeSTuBw7Q@mail.gmail.com>
	<2372633.2CZh3kKOpL@helios> <4F736B9F.9050304@dynamicdevices.co.uk>
Date: Wed, 28 Mar 2012 22:38:30 +0200
Message-ID: <CACW_hTa3mPsLrW8GkkYD+sQCfbajR30jVDOZijujDirLAqhzRA@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Modified fetch() checksums to be correct for libpng 1.4.28 released 15/3/12 (current) instead of previous 8/3/12 release
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
X-List-Received-Date: Wed, 28 Mar 2012 20:47:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

2012/3/28 Alex J Lennon <ajlennon@dynamicdevices.co.uk>:

>> FYI, I'm pretty sure that fetch2 from the version of bitbake we use with
>> OE-
>> Core will skip to the next available option (mirror) if the downloaded
>> file
>> doesn't match the SRC_URI checksum. Of course that's assuming there is a
>> mirror available.

There is an official oe mirror iirc. Not really sure who is exactly
responsible for it. Perhaps khem or kasox6

Frans


