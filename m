Received: from [65.254.253.142] (helo=mailout17.yourhostingaccount.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <SRS0=i4+37W=6D=ngndg.com=tim@yourhostingaccount.com>)
	id 1LTHVV-0000zM-Nh for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jan 2009 16:11:41 +0100
Received: from mailscan11.yourhostingaccount.com ([10.1.15.11]
	helo=mailscan11.yourhostingaccount.com)
	by mailout17.yourhostingaccount.com with esmtp (Exim)
	id 1LTHNv-0002oT-Bt for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jan 2009 10:03:51 -0500
Received: from impout03.yourhostingaccount.com ([10.1.55.3]
	helo=impout03.yourhostingaccount.com)
	by mailscan11.yourhostingaccount.com with esmtp (Exim)
	id 1LTHNv-0004ax-82 for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jan 2009 10:03:51 -0500
Received: from authsmtp09.yourhostingaccount.com ([10.1.18.9])
	by impout03.yourhostingaccount.com with NO UCE
	id AF3q1b0030BkWne0000000; Sat, 31 Jan 2009 10:03:50 -0500
X-EN-OrigOutIP: 10.1.18.9
X-EN-IMPSID: AF3q1b0030BkWne0000000
Received: from 92-237-114-21.cable.ubr03.chms.blueyonder.co.uk
	([92.237.114.21] helo=[192.168.1.104])
	by authsmtp09.yourhostingaccount.com with esmtpa (Exim)
	id 1LTHNu-0001cu-G9 for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jan 2009 10:03:50 -0500
Message-Id: <EE7737BC-A57D-402B-A4A5-6CB0271716C8@ngndg.com>
From: Tim Ellis <tim@ngndg.com>
To: openembedded-devel@lists.openembedded.org
Mime-Version: 1.0 (Apple Message framework v930.3)
Date: Sat, 31 Jan 2009 15:03:48 +0000
References: <97574E2A-03E4-421C-8C29-21A6556D4F7E@ngndg.com>
X-Mailer: Apple Mail (2.930.3)
X-EN-UserInfo: b8ae887d91300d60195f6ea73d56f3bc:43527cee0c82d0ab5dc2dc3726f6afdf
X-EN-AuthUser: tim@ngndg.com
Sender: Tim Ellis <tim@ngndg.com>
X-EN-OrigIP: 92.237.114.21
X-EN-OrigHost: 92-237-114-21.cable.ubr03.chms.blueyonder.co.uk
Subject: Re: samba-3.2.5 missing
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
X-List-Received-Date: Sat, 31 Jan 2009 15:11:42 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

> Calm down, thanks. I authored 3.2.5 for use in foonas which NAiL  
> pushed for me originally, and created the 3.2.7 build with active  
> directory support also for foonas - I tested this on multiple arches  
> and libcs in my target distributions and they work fine. I had  
> presumed when I started working on stuff here that I could maintain  
> my packages as I see fit and have ensured the older samba versions  
> have not included this functionality - and I followed the dev  
> guidelines on the wiki and moved to the upgrade - was this wrong?
>
> Anyway here is what I had been thinking about previously as you are  
> right, the changes are significant; create a separate samba-ads  
> build this weekend and revert the changes to samba. I will do this  
> at some point this weekend. Sorry if updating my packages upsets  
> you, if you don't see AD client support as a worthy feature just  
> dont use the new package at the other side of the weekend. Please  
> dont touch the samba builds - I had presumed as the maintainer of  
> this that other people wouldn't mess with it.
> Cheers,
>
> Tim
>
> Mike (mwester) wrote:
>
> > I'm going to re-create samba-3.2.5 as best as I can (it's way late,
> > maybe I'll screw it up and nobody's builds will work, who knows?),
>
> Screw it.  The changes are ******HUGE*****.   Can whoever removed the
> working 3.2.5 please put it back?  Thank you.
>
> Regards,
> Mike (mwester)



