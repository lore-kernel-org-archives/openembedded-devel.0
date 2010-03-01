Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NmCmo-0003dG-JD
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 22:04:23 +0100
Received: (qmail 31727 invoked by uid 1003); 1 Mar 2010 21:01:26 -0000
Received: from localhost (HELO ?192.168.0.157?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 1 Mar 2010 21:01:26 -0000
Message-ID: <4B8C2B1B.40604@balister.org>
Date: Mon, 01 Mar 2010 16:01:15 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.7) Gecko/20100120 Fedora/3.0.1-1.fc11 Thunderbird/3.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <ac9c93b11003011133wa0f4e3bqe7af69ead4d7eec6@mail.gmail.com>
In-Reply-To: <ac9c93b11003011133wa0f4e3bqe7af69ead4d7eec6@mail.gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: {TSC] request to discuss items.
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
X-List-Received-Date: Mon, 01 Mar 2010 21:04:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/01/2010 02:33 PM, Frans Meulenbroeks wrote:
> As we have (as far as I know) no procedure to table issues for the
> TSC, I'm proposing two issues for the TSC:

 > 1) the location of distro specific files

This is a little premature ... There is a good discussion going on about 
this at the moment. It takes time for the community to draw a conclusion 
on matters like this.

> 2) how to handle legacy recipes that are not used by any known distro

I'd note that this issue has come up before, and the consensus is no 
major shuffling of recipes for aesthetic reasons. I don't see any 
changes that would change the conclusion this time. I believe all of the 
TSC members are already involved in the on list discussion.

Philip

>
> Both have been discussed on this list, and several options have been coined
> E.g. for 1) dedicated directories, overlays or retain the current solution
> And for 2) an overlay, and "obsolete" directory, retain the current
> solution and remove the recipes.
>
> May I ask the TSC to provide a verdict on these.
>
> Thanks alot,
> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


