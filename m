Received: from mail-pz0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PT6ES-0000Mz-EM
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Dec 2010 06:18:25 +0100
Received: by pzk34 with SMTP id 34so515252pzk.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 21:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=kWvHXaNIFKMyCUApiUnKJ0HSmEFyhQVrJiDbPcf0hJI=;
	b=hS1gKquHvrml9d52T5wx+ZTt9lR5fbEW6Wx0h8h+TO0zWauqyscWRMa/XnX32pGHoE
	fFmguuKQyAONDctebpu3N+lCV+YC+nbhFeBKNiJjcZrSpUo9fd/r1lsxPtP1VlekXV8q
	bKP6S7ZVZr7SeqqfDmhiH9NgBQ0KQs8zL6fYs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=EBhLV9kXECtU1qhqjTVESr5fR0/b3e7K6rLg9MfF3Zxg2o45VZVqz9ZCjJhM5baAXt
	3b8p9IxzAaUKPq9uG7qxdFO8RvUUECDGrOT+ltT1hjh2ykRf73AoWUVvrLWoYfF6qygA
	WxVFc0JEEfAQ3unNdzVDugCtCIPICFFVwjHyk=
Received: by 10.142.164.18 with SMTP id m18mr6400823wfe.420.1292476605298;
	Wed, 15 Dec 2010 21:16:45 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id w42sm2562440wfh.15.2010.12.15.21.16.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 15 Dec 2010 21:16:44 -0800 (PST)
Date: Wed, 15 Dec 2010 21:16:48 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101216051648.GB18068@gmail.com>
References: <1291813088-23444-1-git-send-email-obi@opendreambox.org>
	<idoklh$pb4$2@dough.gmane.org> <4CFFDE13.5050900@opendreambox.org>
	<4D06149B.6020201@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <4D06149B.6020201@opendreambox.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.210.51
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/4] conf/distro: remove unused	variable CVS_TARBALL_STASH
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
X-List-Received-Date: Thu, 16 Dec 2010 05:18:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (13/12/10 13:42), Andreas Oberritter wrote:
> Ping.
> 
> I think we should at least remove this variable from local.conf.sample
> and from the documentation, because bitbake >= 1.10 does not support it
> (patches 2 and 3).
> 
> http://patches.openembedded.org/patch/15/
> http://patches.openembedded.org/patch/17/

yes. Applied thx


