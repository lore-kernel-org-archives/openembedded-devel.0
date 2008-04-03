Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1JhKOw-00084T-5b
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Apr 2008 10:02:28 +0200
Received: from [192.168.1.65] ([::ffff:78.86.128.56])
	(AUTH: PLAIN dp, SSL: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Thu, 03 Apr 2008 09:02:23 +0100
	id 0005C366.47F48F10.00002150
Message-ID: <47F48F02.8070700@xora.org.uk>
Date: Thu, 03 Apr 2008 09:02:10 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Thunderbird 2.0.0.12 (X11/20080227)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200803311727.49709.loudawgucr@gmail.com>
	<200804021205.00689.loudawgucr@gmail.com>
In-Reply-To: <200804021205.00689.loudawgucr@gmail.com>
Subject: Re: Bug 3977: old autobuild format?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Apr 2008 08:02:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Louie Ilievski wrote:
> Nobody has anything?  Not even just a quick explanation?  I haven't had any 
> luck getting help on IRC either.
>
> Koen, considering you're the one who closed all the bugs I've looked at with 
> that same resolution, you must know what the reason behind it all is.
>
>
>   
The bugs were filed by the autobuilder using an old template, koen
updated the template and that made the old bug hard to search so they
were closed. In theory if bug was still present the autobuilder would
have refiled a new bug the first night it was ran after this operation.

The fact it hasn't means the autobuilder doesn't see the bug in question
anymore.

Graeme



