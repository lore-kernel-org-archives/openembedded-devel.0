Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OhKBf-0000ln-LA
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Aug 2010 12:30:04 +0200
Received: by fxm12 with SMTP id 12so3858847fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Aug 2010 03:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=Ylair2xctsbLzAN0/R56fearcdkA8CM3elTbwNFruxA=;
	b=o+fIpuaZh9QyzO2yczLzkWtPxtfqpCN7DtIvCOUFf/ngxlB0g9Xu8uvaEHjJVR7LTH
	n/8A6KqUtIJ14HooSxJBJ9FqfFgmDainMSz1mJEmQuDvyWgBqgV+p95AhLa25M4MyuC3
	U0pZ2hSWyArzLYsBnvHlQ7imY6vukhaLiF4Ks=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=XhLl7hXIphtFErPwt1aiSi4XHQPJZ0L4p4UkK2LgoJiZ85Y270v2HhlOw/gZJbQPQb
	iHnSA9FpwDEnc4wY3Uw6ZZi6Uzb5/Xdm+W1GhZSJwWh7HFhcJpbyMpIZkB/OWujt+/K9
	MC2s1STyQtOOrfPV95SWUfkA+UfbnUMZJYT0c=
Received: by 10.223.121.4 with SMTP id f4mr12519844far.71.1281090596680;
	Fri, 06 Aug 2010 03:29:56 -0700 (PDT)
Received: from s42.loc (85-127-241-5.dynamic.xdsl-line.inode.at [85.127.241.5])
	by mx.google.com with ESMTPS id f11sm557248fak.20.2010.08.06.03.29.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 06 Aug 2010 03:29:55 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OhKBU-0003Pq-3w; Fri, 06 Aug 2010 12:29:52 +0200
Date: Fri, 6 Aug 2010 12:29:52 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100806102952.GA11929@mx.loc>
References: <1281087632-11759-1-git-send-email-rep.dot.nop@gmail.com>
	<1281087632-11759-3-git-send-email-rep.dot.nop@gmail.com>
	<1281089249.3809.68.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1281089249.3809.68.camel@mattotaupa>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/4] git: add 1.7.2.1
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
X-List-Received-Date: Fri, 06 Aug 2010 10:30:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Aug 06, 2010 at 12:07:29PM +0200, Paul Menzel wrote:

>did you take Yann’s patches into consideration [1].

>[1] http://patchwork.openembedded.org/patch/2543/

Didn't see that, no. Let me verify this.


