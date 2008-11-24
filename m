Received: from [216.145.245.200] (helo=mx04.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1L4fjs-0001lD-29
	for openembedded-devel@openembedded.org; Mon, 24 Nov 2008 19:00:48 +0100
Received: from [209.242.7.188] (helo=[192.168.231.111])
	by mx04.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1L4fh5-00052A-U2
	for openembedded-devel@openembedded.org; Mon, 24 Nov 2008 11:57:55 -0600
Message-ID: <492AEB0F.9050209@dls.net>
Date: Mon, 24 Nov 2008 11:57:35 -0600
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.18) Gecko/20081105 Thunderbird/2.0.0.18 Mnenhy/0.7.5.666
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <ggd81q$re5$1@ger.gmane.org> <492A3368.4070302@dls.net>
	<ggdhia$cv4$1@ger.gmane.org>
In-Reply-To: <ggdhia$cv4$1@ger.gmane.org>
Subject: Re: Bitbake r1090 (env hiding) makes my build fail.
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
X-List-Received-Date: Mon, 24 Nov 2008 18:00:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:

> Why not put
> 
> CCACHE=""
> 
> in local.conf?

:-)  Because I dislike the concept of ccache for one thing, but to be
honest, at the time I did that, I rather suspect that I didn't edit
local.conf because I didn't want to take the time to re-parse everything. :)

> regards,
> 
> Koen
> 
> PS: Is that on a RH (derived) buildhost?

Yes (RHEL 4, and CentOS 5.1).


Mike (mwester)


