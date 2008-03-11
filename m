Received: from [64.233.170.186] (helo=rn-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1JZ5Fk-0002YX-27
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2008 15:15:31 +0100
Received: by rn-out-0910.google.com with SMTP id s46so1401739rnb.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2008 07:12:53 -0700 (PDT)
Received: by 10.142.221.19 with SMTP id t19mr2616079wfg.62.1205244772993;
	Tue, 11 Mar 2008 07:12:52 -0700 (PDT)
Received: by 10.114.190.2 with HTTP; Tue, 11 Mar 2008 07:12:52 -0700 (PDT)
Message-ID: <f96d234e0803110712t6d88dfc6t521fdf39081e2c76@mail.gmail.com>
Date: Tue, 11 Mar 2008 10:12:52 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20080311114938.GM30267@ibawizard.net>
MIME-Version: 1.0
References: <200803110807.11368.zecke@selfish.org>
	<200803111126.04715.openembedded@haerwu.biz>
	<fr5ntp$n0v$1@ger.gmane.org> <20080311114938.GM30267@ibawizard.net>
X-SA-Exim-Connect-IP: 64.233.170.186
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Reconsidering the work flow and how the SCM system fits in
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
X-List-Received-Date: Tue, 11 Mar 2008 14:15:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Mar 11, 2008 at 7:49 AM, Petr Stetiar <ynezz@true.cz> wrote:

>  My reason for using Git, is, that I could drop my local overlays maintained in
>  SVN, and could easily use Git's branches for it. It's then really easy to try
>  out and build different braches and also easier to send patches back to OE.

I'm really pleased with how easy it is to maintain multiple branches
and quickly switch between branches in one working directory using git
when doing kernel work.  I'm not sure how hg compares as I've not used
it yet.  This is important to me because I work on OE in small,
discontinuous chunks of time, so if I can work on a features in
several branches, and then be able to clean up the changset history
(git rebase -i) before pushing to the public repo, that would be a big
plus for me.  Also being able to easily maintain customer branches in
source control instead of OE overlays would be a big plus.  That said,
I have not tried very hard to do all this in monotone.

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


