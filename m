Received: from smtp1.irobot.com ([206.83.81.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <awozniak@irobot.com>) id 1NZSCI-0007d4-Sz
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 17:53:58 +0100
X-AuditID: 0a460614-b7b17ae0000057de-91-4b5dcc150b93
Received: from webmail.irobot.com (Unknown_Domain [10.70.6.12])
	by smtp1.irobot.com (Symantec Brightmail Gateway) with SMTP id
	D4.67.22494.51CCD5B4; Mon, 25 Jan 2010 11:51:33 -0500 (EST)
Received: from fever2.wardrobe.irobot.com ([192.168.163.187]) by
	webmail.irobot.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 25 Jan 2010 11:51:34 -0500
Received: from [192.168.69.89] ([192.168.69.89]) by fever2.wardrobe.irobot.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 25 Jan 2010 11:51:34 -0500
Message-ID: <4B5DCC14.3030509@irobot.com>
Date: Mon, 25 Jan 2010 08:51:32 -0800
From: Adam Wozniak <awozniak@irobot.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B56384B.10402@irobot.com>	<19c1b8a91001211447w4892750et4414587220a70e4b@mail.gmail.com>	<4B5A333D.2090400@irobot.com>
	<201001251102.50572.holger+oe@freyther.de>
In-Reply-To: <201001251102.50572.holger+oe@freyther.de>
X-OriginalArrivalTime: 25 Jan 2010 16:51:34.0167 (UTC)
	FILETIME=[A6E2EA70:01CA9DDE]
X-Brightmail-Tracker: AAAAAA==
X-SA-Exim-Connect-IP: 206.83.81.187
X-SA-Exim-Mail-From: awozniak@irobot.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] added new recipe for olsrd_0.5.6-r8
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
X-List-Received-Date: Mon, 25 Jan 2010 16:53:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

It is "revision" 8, not "release candidate" 8.  If you look at  
http://www.olsr.org/releases/0.5/ you'll notice they ALSO have things 
labeled 0.5.6-rcN, but these all predate 0.5.6-rN.  I think their 
numbering scheme through 0.5.6 is horrible.  It gets worse...  Four days 
after they posted 0.5.6-r8, they decided to break convention again and 
posted 0.5.6-r8-2 (and not 0.5.6-r9 as you'd expect).

It is indeed unfortunate.

--Adam

Holger Hans Peter Freyther wrote:
> On Saturday 23 January 2010 00:22:37 Adam Wozniak wrote:
>   
>> Sorry, I've tried and tried, but I can't get send-email to work (network
>> config settings which are completely out of my control).  Please try
>> this attachment.
>>     
>
> The upstream version number of "olsrd_0.5.6-r8" is a bit unfortunate. Is that 
> revision or release candidate 8? This also means that the generated OE package 
> will be something like olsrd-0.5.6-r8-rX".
>
> In case it is the release version it is probably fine but just a little bit 
> awkward, in case of rc we would have a small problem.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>   



