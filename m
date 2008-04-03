Received: from [64.233.166.181] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <xjqian@gmail.com>) id 1JhJOt-0001mC-TO
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Apr 2008 08:58:20 +0200
Received: by py-out-1112.google.com with SMTP id y77so3050899pyg.28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Apr 2008 23:58:16 -0700 (PDT)
Received: by 10.35.88.16 with SMTP id q16mr13147349pyl.57.1207205896556;
	Wed, 02 Apr 2008 23:58:16 -0700 (PDT)
Received: from ?192.168.35.2? ( [128.252.118.168])
	by mx.google.com with ESMTPS id u6sm3159308pyb.23.2008.04.02.23.57.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 02 Apr 2008 23:57:46 -0700 (PDT)
Message-ID: <47F47FD3.4050807@gmail.com>
Date: Thu, 03 Apr 2008 01:57:23 -0500
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200803311727.49709.loudawgucr@gmail.com>
	<200804021205.00689.loudawgucr@gmail.com>
In-Reply-To: <200804021205.00689.loudawgucr@gmail.com>
Subject: Re: Bug 3977: old autobuild format?
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
X-List-Received-Date: Thu, 03 Apr 2008 06:58:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/02/2008 02:05 PM, Louie Ilievski wrote:
> Nobody has anything?  Not even just a quick explanation?  I haven't had any 
> luck getting help on IRC either.
> 
> Koen, considering you're the one who closed all the bugs I've looked at with 
> that same resolution, you must know what the reason behind it all is.
> 
> Thanks!
> 
> On Monday 31 March 2008 05:27:49 pm Louie Ilievski wrote:
>> Hi all,
>>
>> I'm new to OE and have a build failure when trying to build the angstrom
>> 2008.1 for aximx50v, using uclibc.  I have the exact compile failure
>> described in bug #3977, however, it got closed like so many others with the
>> same resolution of having an old autobuild format.  Can someone tell me
>> what we're talking about here exactly?  I haven't been able to find out
>> what has changed and what I need to do to fix these issues.
>>
>> If someone can point me in the right direction I'd be glad to try making
>> the necessary changes to fix this build issue.
>>
>> Thanks,
>>
>> ~Lou

Lou,

Please open a new bug for that specific bb recipie or reopen that bug 
with appropriate changes. Koen closed all the old autobuild bugs to let 
us use a more concise format for autobuild bugs. It doesn't mean the bug 
has been solved or looked into.

Regards
Gordon


