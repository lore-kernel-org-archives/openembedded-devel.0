Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1K0l9V-0004BD-Hy
	for openembedded-devel@openembedded.org; Tue, 27 May 2008 00:26:49 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1K0l6H-0005X8-D7
	for openembedded-devel@openembedded.org; Mon, 26 May 2008 22:23:29 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 26 May 2008 22:23:29 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 26 May 2008 22:23:29 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 27 May 2008 00:23:19 +0200
Message-ID: <g1fd8n$cl9$1@ger.gmane.org>
References: <g1eulp$skn$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a2pre (Macintosh/2008052003)
In-Reply-To: <g1eulp$skn$1@ger.gmane.org>
Sender: news <news@ger.gmane.org>
Subject: Re: RFC: restart wiki from scratch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Mon, 26 May 2008 22:26:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Rolf Leggewie wrote:
> Hi,
>
> the openembedded website is in rather bad shape lately.  This includes
> the wiki which has both technical and content problems.  I suggest to
> start anew.
>
> I'd like to go with mediawiki instead this time for the simple reason
> that there are more of us who are actually familiar with this software
> both from an admin and a user perspective.  Mediawiki was the software
> for the OZ wiki which at its time wasn't doing too badly.
>
> Whatever we do, I think we should not allow the current state to exist
> much longer.

Wouldn't it be better to switch the complete website to something like 
ikiwiki[1]? That way every developer has the complete site and history 
available offline for editing and non-developers can edit it using their 
webbrowsers. Both http://monotone.ca/ and http://cairographics.org/ are 
very happy after their transition to ikiwiki.

regards,

Koen

[1] ikiwiki has mtn/svn/hg/git backends, so we can keep it in our 
scm-du-jour.



