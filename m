Received: from [216.145.245.200] (helo=mx04.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1Lkrsu-0002xV-1h
	for openembedded-devel@openembedded.org; Sat, 21 Mar 2009 04:28:32 +0100
Received: from [209.242.7.134] (helo=[192.168.231.111])
	by mx04.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>)
	id 1Lkrrp-0001pH-5e; Fri, 20 Mar 2009 22:27:25 -0500
Message-ID: <49C45E91.90703@dls.net>
Date: Fri, 20 Mar 2009 22:27:13 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.21) Gecko/20090302 Thunderbird/2.0.0.21 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@openembedded.org
References: <49C4516C.90607@dls.net> <200903202016.34258.raj.khem@gmail.com>
In-Reply-To: <200903202016.34258.raj.khem@gmail.com>
Subject: Re: Parse failure for the new RPM recipes
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
X-List-Received-Date: Sat, 21 Mar 2009 03:28:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> 
> Attached is a better fix. Is it OK ?
> 

+1 from me -- parses correctly now, and while I don't build rpm, and
therefore can't test it, that logic looks to be equivalent.

Mike (mwester)


