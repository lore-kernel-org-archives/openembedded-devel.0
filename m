Received: from p3plsmtpa01-03.prod.phx3.secureserver.net ([72.167.82.83])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1P0CDE-0002l6-R4
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 13:49:42 +0200
Received: (qmail 31571 invoked from network); 27 Sep 2010 11:49:26 -0000
Received: from unknown (209.242.7.160)
	by p3plsmtpa01-03.prod.phx3.secureserver.net (72.167.82.83) with ESMTP;
	27 Sep 2010 11:49:24 -0000
Message-ID: <4CA084B6.4070404@mwester.net>
Date: Mon, 27 Sep 2010 06:49:10 -0500
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTi=Wt1eRcSoXzjwMJizLBgQ-+hV=Xj1UWW155MWQ@mail.gmail.com>	<20100926112659.GB6483@jama>
	<AANLkTimQJUyZRsX6a5EA4FruiM5DVVbVD8e676Ri+ARe@mail.gmail.com>
In-Reply-To: <AANLkTimQJUyZRsX6a5EA4FruiM5DVVbVD8e676Ri+ARe@mail.gmail.com>
X-SA-Exim-Connect-IP: 72.167.82.83
X-SA-Exim-Mail-From: mike@mwester.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: some more non fetching recipes
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
X-List-Received-Date: Mon, 27 Sep 2010 11:49:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 9/27/2010 1:19 AM, Frans Meulenbroeks wrote:
> 2010/9/26 Martin Jansa <martin.jansa@gmail.com>:
> 
>> There was about ~1000 recipes failing to fetch few months ago, I don't
>> think this number is that much lower as I haven't seen any changes in
>> most of them.
>>
>> See my download status:
>> http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-April/019206.html
>> http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-April/019234.html
> 
> April is 5 months ago. Question is if it makes sense to keep recipes
> that are broken for > 5 months and no one who saw a need to fix them
> or complained about them.
> Personally I'm inclined to say it is a waste to spend any time on
> these. I would suggest moving them to e.g. nonworking but I guess the
> people who mix up quality and quantity will disagree on this.

Mix up quality and quantity?  That's a gross mischaracterization on your
part, and I quite resent it.

There are valid reasons for some of those.  If it is now necessary to
make Mr. Jansa like the comments on the ixp4xx firmware recipe in order
to keep the recipe in OE, I will update those.  But I cannot make it so
that Intel will not require click-throughs in order to download the
firmware files.

-Mike (mwester)



