Received: from [213.199.154.10] (helo=mail24-dub-R.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <Tim.Bird@am.sony.com>) id 1IdVqa-0005Xa-22
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Oct 2007 20:54:56 +0200
Received: from mail24-dub (localhost.localdomain [127.0.0.1])
	by mail24-dub-R.bigfish.com (Postfix) with ESMTP id 5668A1489C72
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Oct 2007 18:49:31 +0000 (UTC)
X-BigFish: VP
X-MS-Exchange-Organization-Antispam-Report: OrigIP: 160.33.66.75;Service: EHS
Received: by mail24-dub (MessageSwitch) id 1191523771239620_27425;
	Thu,  4 Oct 2007 18:49:31 +0000 (UCT)
Received: from mail8.fw-sd.sony.com (mail8.fw-sd.sony.com [160.33.66.75])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail24-dub.bigfish.com (Postfix) with ESMTP id 7DB0E57007A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Oct 2007 18:49:30 +0000 (UTC)
Received: from mail1.sgo.in.sel.sony.com (mail1.sgo.in.sel.sony.com
	[43.130.1.111])
	by mail8.fw-sd.sony.com (8.12.11/8.12.11) with ESMTP id l94InStZ015296
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Oct 2007 18:49:28 GMT
Received: from USSDIXIM01.am.sony.com (ussdixim01.am.sony.com [43.130.140.33])
	by mail1.sgo.in.sel.sony.com (8.12.11/8.12.11) with ESMTP id
	l94InSv5017985 for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Oct 2007 18:49:28 GMT
Received: from ussdixms03.am.sony.com ([43.130.140.23]) by
	USSDIXIM01.am.sony.com with Microsoft SMTPSVC(5.0.2195.6713); 
	Thu, 4 Oct 2007 11:49:28 -0700
Received: from [43.135.148.58] ([43.135.148.58]) by ussdixms03.am.sony.com
	with Microsoft SMTPSVC(5.0.2195.6713); 
	Thu, 4 Oct 2007 11:49:27 -0700
Message-ID: <470535D5.8070307@am.sony.com>
Date: Thu, 04 Oct 2007 11:49:57 -0700
From: Tim Bird <tim.bird@am.sony.com>
User-Agent: Thunderbird 1.5.0.4 (X11/20060614)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1191494488.2516.34.camel@toontown>
	<4704CC05.40206@klever.net>	<B9AD73C2-790F-43EE-9FC4-96F1B1FA9415@selfish.org>	<1191502502.2516.39.camel@toontown>
	<4704EAE3.8050702@klever.net>
	<b6ebd0a50710041136o48edfecbm6afd05d9b921d41f@mail.gmail.com>
In-Reply-To: <b6ebd0a50710041136o48edfecbm6afd05d9b921d41f@mail.gmail.com>
X-Enigmail-Version: 0.94.0.0
X-OriginalArrivalTime: 04 Oct 2007 18:49:27.0950 (UTC)
	FILETIME=[4A8B8AE0:01C806B7]
Subject: Re: monotone/git (was hello...)
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
X-List-Received-Date: Thu, 04 Oct 2007 18:54:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Chris Larson wrote:
> On 10/4/07, Michael Krelin <hacker@klever.net> wrote:
>>> Well luckily I am not an ignorant git-fanboy :) Could you shortly point
>>> out to me the reasons why you think monotone is favorable over git for
>>> use with openembedded ? I will admit right away that my limitation with
>>> SCMs in large projects is more than limited. So i can only speak of
>>> my user experience with git vs my experience with monotone and i prefer
>>> the first.
>> Well, 1st - OE folks are used to monotone now. That's primary reason.
>> The second primary reason is that I know of some developers who seem to
>> dislike git. And if we're talking about technical reason, one I can
>> think of is that there's no non-ssh transport allowing push, which
>> complicates administration of our "central" repository.
> 
> That's not correct.  You can push to a git repository over http/webdav
> to an apache2 server.

Theoretically.  My experience is that it often fails, at least with
the kernel.  But maybe this is just a git-tree maintenance issue for
the kernel devs.  Chris is correct, however, that the feature is
present in git.
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================



