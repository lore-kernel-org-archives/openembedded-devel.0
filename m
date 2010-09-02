Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1Or9lo-0000Bv-UE
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 15:24:04 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 531E31660930; Thu,  2 Sep 2010 07:23:26 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id DD3BC1660374;
	Thu,  2 Sep 2010 07:23:25 -0600 (MDT)
Message-ID: <4C7FA54D.5070908@mlbassoc.com>
Date: Thu, 02 Sep 2010 07:23:25 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100430 Fedora/3.0.4-2.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTinhxdSG3M3ddEa6Bgtbkp4Pg8H5MSxkUAgWGZUk@mail.gmail.com>
In-Reply-To: <AANLkTinhxdSG3M3ddEa6Bgtbkp4Pg8H5MSxkUAgWGZUk@mail.gmail.com>
X-SA-Exim-Connect-IP: 64.234.241.98
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: git issues
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
X-List-Received-Date: Thu, 02 Sep 2010 13:24:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/02/2010 06:59 AM, Frans Meulenbroeks wrote:
> For some reason recently every once in a while on a git pull or git
> clone I get an error like this:
>
> git clone git://git.openembedded.net/openembedded openembedded
> Initialized empty Git repository in
> /home/frans/workspace/Linux/openembedded-test/openembedded/.git/
> fatal: The remote end hung up unexpectedly
> make: *** [all] Error 128
>
> Repeating the command often makes it work.
>
> Also I notice that the transfer rate is about 100-120 KB/s
> I seem to recall Leon also reported something like this with irc.
>
> Is this something others see as well?
> Especially the hangup does not really help to set up an automated test system.

I've seen this on a number of sites, not just OE.  As you say, trying
again makes it happy.

I think it's a generic GIT problem (at least that's my experience)

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


