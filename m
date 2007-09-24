Received: from [213.199.154.16] (helo=outbound5-dub-R.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <Tim.Bird@am.sony.com>) id 1IZraW-0007aA-7H
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Sep 2007 19:19:16 +0200
Received: from outbound5-dub.bigfish.com (localhost.localdomain [127.0.0.1])
	by outbound5-dub-R.bigfish.com (Postfix) with ESMTP id 3736D41A859;
	Mon, 24 Sep 2007 17:14:56 +0000 (UTC)
Received: from mail78-dub-R.bigfish.com (unknown [10.5.252.3])
	by outbound5-dub.bigfish.com (Postfix) with ESMTP id 2D031838049;
	Mon, 24 Sep 2007 17:14:56 +0000 (UTC)
Received: from mail78-dub (localhost.localdomain [127.0.0.1])
	by mail78-dub-R.bigfish.com (Postfix) with ESMTP id E6B35194015E;
	Mon, 24 Sep 2007 17:14:55 +0000 (UTC)
X-BigFish: VP
X-MS-Exchange-Organization-Antispam-Report: OrigIP: 160.33.66.75;Service: EHS
Received: by mail78-dub (MessageSwitch) id 1190654092808524_11902;
	Mon, 24 Sep 2007 17:14:52 +0000 (UCT)
Received: from mail8.fw-sd.sony.com (mail8.fw-sd.sony.com [160.33.66.75])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail78-dub.bigfish.com (Postfix) with ESMTP id F03C810A007D;
	Mon, 24 Sep 2007 17:14:51 +0000 (UTC)
Received: from mail1.sgo.in.sel.sony.com (mail1.sgo.in.sel.sony.com
	[43.130.1.111])
	by mail8.fw-sd.sony.com (8.12.11/8.12.11) with ESMTP id l8OHEoKC019801; 
	Mon, 24 Sep 2007 17:14:50 GMT
Received: from USSDIXIM01.am.sony.com (ussdixim01.am.sony.com [43.130.140.33])
	by mail1.sgo.in.sel.sony.com (8.12.11/8.12.11) with ESMTP id
	l8OHEoAR022344; Mon, 24 Sep 2007 17:14:50 GMT
Received: from ussdixms03.am.sony.com ([43.130.140.23]) by
	USSDIXIM01.am.sony.com with Microsoft SMTPSVC(5.0.2195.6713); 
	Mon, 24 Sep 2007 10:14:49 -0700
Received: from [43.135.148.58] ([43.135.148.58]) by ussdixms03.am.sony.com
	with Microsoft SMTPSVC(5.0.2195.6713); 
	Mon, 24 Sep 2007 10:14:48 -0700
Message-ID: <46F7F080.90102@am.sony.com>
Date: Mon, 24 Sep 2007 10:14:40 -0700
From: Tim Bird <tim.bird@am.sony.com>
User-Agent: Thunderbird 1.5.0.4 (X11/20060614)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <46F587F7.4060501@balister.org>	<c384c5ea0709230419n7542c911v27a389539421e454@mail.gmail.com>	<46F7DDF7.8060804@am.sony.com>
	<46F7E74E.7020402@balister.org>
In-Reply-To: <46F7E74E.7020402@balister.org>
X-Enigmail-Version: 0.94.0.0
X-OriginalArrivalTime: 24 Sep 2007 17:14:48.0494 (UTC)
	FILETIME=[6931D4E0:01C7FECE]
Cc: openembedded-devel@openembedded.org, Leon Woestenberg <leonw@mailcan.com>,
	Matthew Locke <matt@nomadgs.com>
Subject: Re: How should OE be used?
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
X-List-Received-Date: Mon, 24 Sep 2007 17:19:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Philip Balister wrote:
> Tim,
> 
> Hopefully, we can address some of Leon's and other's issues during OEDEM
> in two weeks. So be prepared to update the elinux.org web page :)

I'll be glad to. :-)

BTW - I still have some unspent money from CELF budgeted for OE
improvements (not a lot, but some).  Also, I have a machine dedicated
in the CELF test lab for OE work.  Last year, Marcin did some contract
work for us.  I don't think we're leveraging what he did very well.
In terms of what CELF is interested in going forward: we would very
much like to see well-maintained minimal distribution that works
on several architectures.  I can use some of the above
resources for this work.

I don't want to discuss numbers on an open list, but details
are available upon request.

Can you please factor this into the OEDEM discussions?

I won't be at OEDEM, but I'll be at ELCE in Austria, November 2-3.
(see http://www.celinux.org/elc_europe07/elc_europe_index.html)
Matt Locke will be giving a talk on Open Embedded there.  I'm not
sure where the main OE developers are located in Europe, but if
it's convenient, it would be nice to meet there and discuss what
CELF can do to help out.
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================



