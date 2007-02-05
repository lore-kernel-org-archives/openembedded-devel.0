Received: from [66.249.92.174] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mattjreimer@gmail.com>) id 1HE9qY-0004sX-KZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Feb 2007 20:49:50 +0100
Received: by ug-out-1314.google.com with SMTP id e2so1354896ugf
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Feb 2007 11:49:49 -0800 (PST)
Received: by 10.78.185.7 with SMTP id i7mr1253444huf.1170704989463;
	Mon, 05 Feb 2007 11:49:49 -0800 (PST)
Received: by 10.78.184.6 with HTTP; Mon, 5 Feb 2007 11:49:49 -0800 (PST)
Message-ID: <f383264b0702051149t7834f38cse108cc6ebd29fed1@mail.gmail.com>
Date: Mon, 5 Feb 2007 11:49:49 -0800
From: "Matt Reimer" <mattjreimer@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <45C6E906.9090602@whitby.id.au>
MIME-Version: 1.0
References: <45C6E906.9090602@whitby.id.au>
Subject: Re: How will OE handle the US timezone change?
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
X-List-Received-Date: Mon, 05 Feb 2007 19:49:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2/5/07, Rod Whitby <rod@whitby.id.au> wrote:
> Not that I really care (not living in the US), but people using distros
> built from OE are getting concerned about how the new US DST timezone
> thing is going to be handled.
>
> Are there any OE developers in the US who know enough and care enough to
>  fix it properly?  Our someone else who is gracious enough to help our
> US friends out of their timezone mess?
>
> At the moment, there seems to be a timezones package which downloads
> binary files from some OPIE site.  I've heard that timezone data is
> endian specific, so it seems that some better solution might be required.

Todd Blumer (tnb on IRC) has been working on getting the timezones
packages up. Check with him.

Matt


