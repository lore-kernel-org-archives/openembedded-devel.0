Received: from [216.145.245.197] (helo=mx01.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LmCnW-00030Z-IH
	for openembedded-devel@openembedded.org; Tue, 24 Mar 2009 21:00:31 +0100
Received: from [209.242.7.134] (helo=[192.168.231.111])
	by mx01.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LmCm2-00064b-GA
	for openembedded-devel@openembedded.org; Tue, 24 Mar 2009 14:58:58 -0500
Message-ID: <49C93B87.40607@dls.net>
Date: Tue, 24 Mar 2009 14:59:03 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.21) Gecko/20090302 Thunderbird/2.0.0.21 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <b6ebd0a50903171218i7f5716afifd99177982b6df5b@mail.gmail.com>	<b6ebd0a50903231335y1ddfcb3bpd447b646e18d439a@mail.gmail.com>	<1237885606.5348.8.camel@dax.rpnet.com>	<b6ebd0a50903240808p4e07c61g6a088df634e161b2@mail.gmail.com>
	<ac9c93b10903241136q779fe115sa595c31200b707c6@mail.gmail.com>
In-Reply-To: <ac9c93b10903241136q779fe115sa595c31200b707c6@mail.gmail.com>
Subject: Re: Package Maintenance
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
X-List-Received-Date: Tue, 24 Mar 2009 20:00:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks wrote:
> Disadvantage of a Maintainers file is that it is yet another file to
> update when you create a package (adjacent to the checksums file and
> of course the package recipe). Guess it will be forgotten regularly.
> 
> Also I fear we're going to end up with a lot of orphaned packages.

Is lack of a Maintainers file _really_ our problem?

IMO, our current issue is what I would term "Drive-by Commits" (for
example, the past two weekends have seen commits that have introduced
major breakage of some sort where the committer has not been about for
some fairly significant period of time.

I don't think listing a name in a Maintainers file is going to change
anything, frankly.

Mike (mwester)


