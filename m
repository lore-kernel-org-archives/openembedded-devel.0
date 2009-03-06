Received: from [216.145.245.200] (helo=mx04.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LfOLG-00060V-6K
	for openembedded-devel@openembedded.org; Fri, 06 Mar 2009 01:55:10 +0100
Received: from [209.242.7.188] (helo=[192.168.231.111])
	by mx04.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LfOH1-0005ZY-G4
	for openembedded-devel@openembedded.org; Thu, 05 Mar 2009 18:50:47 -0600
Message-ID: <49B0735C.6080802@dls.net>
Date: Thu, 05 Mar 2009 18:50:36 -0600
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.19) Gecko/20081209 Thunderbird/2.0.0.19 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <87iqmp5f58.fsf@neumann.lab.ossystems.com.br>	<87eixc40oz.fsf@ucpel.tche.br>	<87skls2ihj.fsf@neumann.lab.ossystems.com.br>
	<87sklr3bdy.fsf@ossystems.com.br>
In-Reply-To: <87sklr3bdy.fsf@ossystems.com.br>
Subject: Re: [RFH] Support for automatic package versining using git describe
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
X-List-Received-Date: Fri, 06 Mar 2009 00:55:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Mario Domenech Goulart wrote:
> On Thu, 05 Mar 2009 10:43:04 -0300 Otavio Salvador <otavio@ossystems.com.br> wrote:
>> Please drop this hook since it is our internal workaround for the lack
>> of the AUTOREV in our recipes.
> 
> Sure.  Attached is the new patch.

I don't know the context for these patches, so please forgive me if I
should be reading the sources instead of asking here (perhaps my
question makes no sense at all):

What does this code do if I make a tarball snapshot of the
"openembedded" directory structure, excluding the .git directory, and
attempt to build from that?

-Mike (mwester)


