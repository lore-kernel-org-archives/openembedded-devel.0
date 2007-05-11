Received: from [64.233.166.178] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1HmYU4-00076q-H4
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 May 2007 19:00:50 +0200
Received: by py-out-1112.google.com with SMTP id n39so810549pyh
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2007 10:00:01 -0700 (PDT)
Received: by 10.35.63.2 with SMTP id q2mr5284203pyk.1178902801637;
	Fri, 11 May 2007 10:00:01 -0700 (PDT)
Received: from cube ( [77.122.190.213])
	by mx.google.com with ESMTP id 38sm10083072nzf.2007.05.11.10.00.00;
	Fri, 11 May 2007 10:00:01 -0700 (PDT)
Date: Fri, 11 May 2007 20:00:05 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1353801661.20070511200005@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <127969848.20070508161103@gmail.com>
References: <35653307.20070503154732@gmail.com>
	<1178198199.6312.30.camel@localhost.localdomain>
	<127969848.20070508161103@gmail.com>
MIME-Version: 1.0
Subject: Re: [ALERT] Security vulnerability with recent OE bitbake.conf changes
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
X-List-Received-Date: Fri, 11 May 2007 17:01:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello,

Tuesday, May 8, 2007, 4:11:03 PM:

> Hello Richard,

> Thursday, May 3, 2007, 4:16:39 PM, you wrote:

> []

>> So we need to find the real problem and fix that, probably somewhere in
>> patch.bbclass an error code isn't being propagated at a guess.

>         Ok, so here we go:
> http://bugs.openembedded.org/show_bug.cgi?id=2274

        This was committed, as well as PATCHRESOLVE set to "noop" by
default.

[]

-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



