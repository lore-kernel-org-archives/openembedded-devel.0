Received: from na3sys009aog105.obsmtp.com ([74.125.149.75])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bengardiner@nanometrics.ca>) id 1PzxY5-0004EY-AH
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 21:42:29 +0100
Received: from source ([209.85.220.172]) (using TLSv1) by
	na3sys009aob105.postini.com ([74.125.148.12]) with SMTP
	ID DSNKTYEgTic9r1B2hN2rB/J7Nq4LboUdZbgZ@postini.com;
	Wed, 16 Mar 2011 13:40:48 PDT
Received: by vxg33 with SMTP id 33so2827973vxg.17
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 13:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nanometrics.ca; s=google;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=6BVTYQKmour2CfivyXUXUQ0upDkrEi+DR3gzqBAIkd8=;
	b=a7N4JcW8M1n5kKRtMK3OIhz8nuuzt88c/YIcPkXQas6+BjKpU3QAvClq3t0Bx4pxzR
	6Gz9XohyUgySaiWA8XJm14/YWLpfXVSPvNUT7UBq1gTRrjT635aiyNeInNcUhZzDomhD
	L6vK+9Goo9mLzkbBoa8KQL363w+FCTmUp7sUc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=nanometrics.ca; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=hKvHLcWuJcsTuV8QKRcSb++kxLCWGaoJg2lXvmKY+f2wIr8Bck2n+ej0tHXtjTZ4LT
	xT7Xtz1VQH40yir4PA7/cuWDZue5M94wXCtLYKKG4s3MPuGtwbxJc0P3CI4pSpjKDo5m
	mNcZ9xfBLI/ME/aDF5ZJYKSlNhtgrhtDmBOKA=
MIME-Version: 1.0
Received: by 10.52.69.197 with SMTP id g5mr695291vdu.31.1300308045817; Wed, 16
	Mar 2011 13:40:45 -0700 (PDT)
Received: by 10.52.168.225 with HTTP; Wed, 16 Mar 2011 13:40:45 -0700 (PDT)
In-Reply-To: <20110316203020.GL3042@denix.org>
References: <1300212835-8779-1-git-send-email-bengardiner@nanometrics.ca>
	<20110315200131.GA3042@denix.org>
	<AANLkTikS9S8OdO3DqBzhErVMiTxHruk2Mo17rNqK9aad@mail.gmail.com>
	<20110316203020.GL3042@denix.org>
Date: Wed, 16 Mar 2011 16:40:45 -0400
Message-ID: <AANLkTim1YgL3uE8+0fj2mph8N5__uQaYrjhQHMRJzWmo@mail.gmail.com>
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Tom Rini <trini@embeddedalley.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] image.bbclass: add link to .rootfs.<type> or .<type>.img
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
X-List-Received-Date: Wed, 16 Mar 2011 20:42:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Denys,

On Wed, Mar 16, 2011 at 4:30 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> I've acked the cherry-picks for the maintenance branch, so once Tom pushes
> them there, you should see them appear in arago-oe-dev in a day or two...

Thanks -- I couldn't ask for more.

> And thank you for your help.

You're most welcome.

Best Regards,
Ben Gardiner

---
Nanometrics Inc.
http://www.nanometrics.ca


