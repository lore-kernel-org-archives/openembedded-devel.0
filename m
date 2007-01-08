Received: from [209.85.132.243] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <papercrane@gmail.com>) id 1H42SD-0002Yo-6j
	for openembedded-devel@openembedded.org; Mon, 08 Jan 2007 22:54:53 +0100
Received: by an-out-0708.google.com with SMTP id b2so966482ana
	for <openembedded-devel@openembedded.org>;
	Mon, 08 Jan 2007 13:53:12 -0800 (PST)
Received: by 10.78.193.19 with SMTP id q19mr5717702huf.1168293191603;
	Mon, 08 Jan 2007 13:53:11 -0800 (PST)
Received: by 10.78.39.8 with HTTP; Mon, 8 Jan 2007 13:53:10 -0800 (PST)
Message-ID: <432beae0701081353t4de8b66fh7d7d9b46971cb3b@mail.gmail.com>
Date: Mon, 8 Jan 2007 13:53:11 -0800
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <45A2B3EA.2070502@dominion.kabel.utwente.nl>
MIME-Version: 1.0
References: <20061230051641.GA30225@hezmatt.org>
	<459786C7.70000@dominion.kabel.utwente.nl>
	<1168200264.15021.54.camel@ip6-localhost>
	<1662139633.20070107231632@gmail.com>
	<20070107220333.GC6625@hezmatt.org>
	<432beae0701071446p377665c8x810644467cf7f234@mail.gmail.com>
	<1168280937.4526.32.camel@ip6-localhost>
	<432beae0701081111n490d67e2oebcaf44f4fe45e04@mail.gmail.com>
	<1168290172.4526.66.camel@ip6-localhost>
	<45A2B3EA.2070502@dominion.kabel.utwente.nl>
Cc: openembedded-devel@openembedded.org
Subject: Re: A question of workflow
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
X-List-Received-Date: Mon, 08 Jan 2007 21:54:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 1/8/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> Patrick Ohly schreef:
>
> <snip>
>
> So after every first commmit the tree is in a broken state, where-as if a developers
> applied a fixed patch in one go it wouldn't be. Sounds like your concept is badly broken.

Apply, commit (note brokenness if needed in commit message), then fix
it, commit, and push. Don't push before fixing.

-- 
Justin Patrin


