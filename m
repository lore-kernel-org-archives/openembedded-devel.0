Received: from [65.55.251.16] (helo=outbound4-blu-R.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <Tim.Bird@am.sony.com>) id 1IZsJS-000403-7Z
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Sep 2007 20:05:43 +0200
Received: from outbound4-blu.bigfish.com (localhost.localdomain [127.0.0.1])
	by outbound4-blu-R.bigfish.com (Postfix) with ESMTP id 98BC01FB184
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2007 18:01:21 +0000 (UTC)
Received: from mail94-blu-R.bigfish.com (unknown [10.1.252.3])
	by outbound4-blu.bigfish.com (Postfix) with ESMTP id 6740E160065
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2007 18:01:21 +0000 (UTC)
Received: from mail94-blu (localhost.localdomain [127.0.0.1])
	by mail94-blu-R.bigfish.com (Postfix) with ESMTP id 19579810269
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2007 18:01:20 +0000 (UTC)
X-BigFish: VP
X-MS-Exchange-Organization-Antispam-Report: OrigIP: 160.33.66.75;Service: EHS
Received: by mail94-blu (MessageSwitch) id 119065687915477_6038;
	Mon, 24 Sep 2007 18:01:19 +0000 (UCT)
Received: from mail8.fw-sd.sony.com (mail8.fw-sd.sony.com [160.33.66.75])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail94-blu.bigfish.com (Postfix) with ESMTP id 7E3C5410058
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2007 18:01:18 +0000 (UTC)
Received: from mail1.sgo.in.sel.sony.com (mail1.sgo.in.sel.sony.com
	[43.130.1.111])
	by mail8.fw-sd.sony.com (8.12.11/8.12.11) with ESMTP id l8OI1H1K021845
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2007 18:01:17 GMT
Received: from USSDIXIM01.am.sony.com (ussdixim01.am.sony.com [43.130.140.33])
	by mail1.sgo.in.sel.sony.com (8.12.11/8.12.11) with ESMTP id
	l8OI1H8l001676 for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2007 18:01:17 GMT
Received: from ussdixms03.am.sony.com ([43.130.140.23]) by
	USSDIXIM01.am.sony.com with Microsoft SMTPSVC(5.0.2195.6713); 
	Mon, 24 Sep 2007 11:01:16 -0700
Received: from [43.135.148.58] ([43.135.148.58]) by ussdixms03.am.sony.com
	with Microsoft SMTPSVC(5.0.2195.6713); 
	Mon, 24 Sep 2007 11:01:16 -0700
Message-ID: <46F7FB64.9060907@am.sony.com>
Date: Mon, 24 Sep 2007 11:01:08 -0700
From: Tim Bird <tim.bird@am.sony.com>
User-Agent: Thunderbird 1.5.0.4 (X11/20060614)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <46F587F7.4060501@balister.org>	<c384c5ea0709230419n7542c911v27a389539421e454@mail.gmail.com>	<46F65D2D.5020507@dominion.kabel.utwente.nl>	<46F7F1F2.6040506@am.sony.com>
	<46F7F727.6010009@student.utwente.nl>
In-Reply-To: <46F7F727.6010009@student.utwente.nl>
X-Enigmail-Version: 0.94.0.0
X-OriginalArrivalTime: 24 Sep 2007 18:01:16.0744 (UTC)
	FILETIME=[E71F0480:01C7FED4]
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
X-List-Received-Date: Mon, 24 Sep 2007 18:05:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> Tim Bird schreef:
>>> Koen Kooi wrote:
>>>> If we need to checkout some svn/cvs/hg/git tree to
>>>> get your OE-based distro, you have already lost.
>>> I strongly agree with this sentiment.  I would like to see something
>>> even further.  I would like to see downloadable  minimal distro *binaries*
>>> (not just source) for all major architectures.
> 
> Like http://www.angstrom-distribution.org/unstable/images/? That has armv4-oabi, armv4t,
> armv5te, armv5teb, armv6, ppc603, i486, i586, i686 and soon ppc405 and avr32. A uclibc
> variant is in the works as well :)

At a first glance, this is quite possibly exactly what I want.
Thanks!!

I'll look further and see if this will meet my needs.
 -- Tim


=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================



