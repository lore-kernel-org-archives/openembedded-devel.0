Received: from hermes.mlbassoc.com ([76.76.67.137] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1NI2Pf-0004QL-QU
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Dec 2009 16:55:48 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id ECF0E16603C1; Tue,  8 Dec 2009 08:54:01 -0700 (MST)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id A8E6F1660387;
	Tue,  8 Dec 2009 08:54:01 -0700 (MST)
Message-ID: <4B1E7699.7000004@mlbassoc.com>
Date: Tue, 08 Dec 2009 08:54:01 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.3a1pre) Gecko/20091130 Shredder/3.1a1pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BAY127-W12CD092294401BAF297F8DD88F0@phx.gbl>
In-Reply-To: <BAY127-W12CD092294401BAF297F8DD88F0@phx.gbl>
X-SA-Exim-Connect-IP: 76.76.67.137
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: saleh usman <salehusman@hotmail.com>
Subject: Re: Problem using "bitbake"
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
X-List-Received-Date: Tue, 08 Dec 2009 15:55:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/08/2009 08:49 AM, saleh usman wrote:
>
> Hello
>
> I am trying to build   "helloworld_image"  given in openembedded recipes/images directory but the following error is occuring. Please help me in diagnosing the pr0blem and moving forward.
>
>
> [saleh@localhost build]$ bitbake helloworld_image
>
> NOTE: Parsing finished. 0 cached, 0 parsed, 0 skipped, 0 masked.
> NOTE: Cache is clean, not saving.
> ERROR: Nothing PROVIDES 'helloword_image'

Try 'bitbake helloworld-image' (dash, not underscore)

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


