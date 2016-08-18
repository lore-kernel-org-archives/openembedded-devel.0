Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id 08BFA7318D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 18:30:57 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20160818183057110_0486
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 18:30:57 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-devel@lists.openembedded.org>
Received: from [174.114.62.25] (port=46046 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1baS7X-00078v-Tn for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2016 14:32:51 -0400
Date: Thu, 18 Aug 2016 14:30:47 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
In-Reply-To: <CA+chaQeYS9NqyL0dqE_rK=nCKdX7OYF-dgSHJRwm9xro0qaJqQ@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1608181429550.26236@localhost.localdomain>
References: <alpine.LFD.2.20.1608180535210.16814@ca624034.mitel.com>
	<10C3DF54-CD57-4E94-B989-E87C3122127D@gmail.com>
	<alpine.LFD.2.20.1608181408250.25743@localhost.localdomain>
	<CA+chaQeYS9NqyL0dqE_rK=nCKdX7OYF-dgSHJRwm9xro0qaJqQ@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: Re: [PATCH] meta-oe: php, given "_append", remove superfluous "+="
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Aug 2016 18:30:58 -0000
Content-Type: text/plain; charset=US-ASCII

On Thu, 18 Aug 2016, Martin Jansa wrote:

> Don't resend, it's already in master-next (all 4 squashed into one) and I
> would keep the space before \ because we always use space before \ even
> when it's not really necessary.

  that's what i thought, which is why i left it there. good to know,
thanks. time to start writing a style guide, methinks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


