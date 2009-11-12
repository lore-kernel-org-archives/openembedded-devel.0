Received: from [194.158.229.31] (helo=smtp-be-01.be08.sunrise.ch)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dv@vollmann.ch>) id 1N8kGn-0001Oi-Ga
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 01:44:12 +0100
Received: from [192.168.26.14] (212-98-43-140.static.adslpremium.ch
	[212.98.43.140])
	by smtp-be-01.be08.sunrise.ch (8.13.1/8.12.10) with ESMTP id
	nACNXq6M001263; Fri, 13 Nov 2009 00:33:53 +0100
Message-ID: <4AFC9BD2.6070203@vollmann.ch>
Date: Fri, 13 Nov 2009 00:35:46 +0100
From: Detlef Vollmann <dv@vollmann.ch>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1258014540.6879.18.camel@opal>
	<ac9c93b10911120038l67476671pe223e41233fc9bc6@mail.gmail.com>
In-Reply-To: <ac9c93b10911120038l67476671pe223e41233fc9bc6@mail.gmail.com>
X-SA-Exim-Connect-IP: 194.158.229.31
X-SA-Exim-Mail-From: dv@vollmann.ch
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OEDEM: Summary of the 'Splitting the tree' session
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
X-List-Received-Date: Fri, 13 Nov 2009 00:44:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/09 09:38, Frans Meulenbroeks wrote:
> I think a split is a good idea, but I am not too keen on the name "base"
> This suggests that it is kinda basic/core functionality.
This is how I understand it.

> For a lot of
> recipes this is not true. E.g. I am currently working on xmltv, not
> really base functionality
And it wouldn't go into 'base'.

> As the split proposal is more along the graphics axe, I suggest that
> instead of "base" we use something like "cmdline" or so (trying to
> avoid the word "terminal" here).
> Btw before someone proposes this: I'm also not too keen on a directory
> "other" as it will become a junkyard of things.
You can't avoid that 'junkyard', whether you call it 'cmdline'
or 'other'.  And as that would be the place for those packages
that don't belong in any of the other categories, 'other' is
just the right name for that.

   Detlef



