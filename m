Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OmMGn-00037w-Jj
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Aug 2010 09:44:36 +0200
Received: by fxm6 with SMTP id 6so1704825fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Aug 2010 00:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=+LRE/MVzJdnFnwDSHI2ivLNd03VAJbqtQy720Qg373A=;
	b=nmzZhQtUGDJL7dV9hZLr/wz3RgBf2iP83Rvt7ZveTc216rQCzMP1AX2Px7Ku19z8T3
	0+Atd1dlCCtTA3JlMwpeXzKKM1G1Bo0BDDC1mh6XW8XQp2iy+HVvovRhuf5olRR/2cCO
	b9wMGwkv2OB5AWkAZMbj2frd7sDrqKlEG3IQ8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=fa9qEbtunHMSd6M+EFG/TLQiim67FpBSozCMOn/FDgF7O8Or/fC/FDfYqOpx5Haj6s
	9uLk9cIvJVVDbEwqE6brbf1iTtOlCa1AMX6wHZ1hEZBydTDqUY/5bF1eatuX117k6pq+
	JFQBali0zs2Q+aVXiNVn21cM0SzssGBBQiIzM=
Received: by 10.223.108.81 with SMTP id e17mr776323fap.28.1282290226291;
	Fri, 20 Aug 2010 00:43:46 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id k15sm1076704fai.16.2010.08.20.00.43.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 20 Aug 2010 00:43:45 -0700 (PDT)
Date: Fri, 20 Aug 2010 09:44:11 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100820074410.GO11569@jama>
References: <4C624772.8000607@nedap.com>
	<20100811072548.GB7282@mi.fu-berlin.de>
	<20100819105518.GL11569@jama>
	<20100819121301.GA21426@mi.fu-berlin.de>
	<20100819122903.GM11569@jama> <4C6E29B3.8050801@nedap.com>
MIME-Version: 1.0
In-Reply-To: <4C6E29B3.8050801@nedap.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: problem building openjdk-6
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
X-List-Received-Date: Fri, 20 Aug 2010 07:45:12 -0000
X-List-Received-Date: Fri, 20 Aug 2010 07:45:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 20, 2010 at 09:07:31AM +0200, Jaap de Jong wrote:
> Hi Martin,

Hi Jaap,

> I've read about your fix on this matter and did a complete new rebuild 
> last night, but it still does not translate here.
> Although the error is somewhere else.

Yes, I know..

try again with:
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=aa5fae1ad0f33ca478873ffd1a48fcaefff61b13

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


