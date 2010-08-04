Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OgkK4-00012V-SD
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 22:12:21 +0200
Received: by fxm12 with SMTP id 12so2653207fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 13:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=8rCQna/SxZySuDONVG+mGdmWD1GMj+5h6GotablqsO0=;
	b=j7ghk/6EwHlgd/Tz3f/PIxUrawCE/YOPVLT0qIoF681Dr0QAlGvW8sXc1H8XREDSY/
	w+c07GtVCKo8Om9kkEUVfM1EIk6U9/3Xj13crwCwLCaWTSadv73Sf13DcDQrt9wyEvt7
	4PXzLRv1s4+pTQuY4iIHngvWoS69WZ4xjJl90=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=IzZJPq8bde7bqvCKgtxnvUrASHKfugIXMYgZRd7jU7z5r6nvWJX2oIZVh7aSlldzHN
	3DnKBT6kWoISZATlf4kE9jEVmdzboHJfKBG30Lnjn5JCojOo2qpeM05m0P1qk6ttOYzi
	A9dM3xtnaTx1SfcBTpqI3WpTm4jYaMDbR0TqM=
Received: by 10.223.124.145 with SMTP id u17mr9468918far.92.1280952732198;
	Wed, 04 Aug 2010 13:12:12 -0700 (PDT)
Received: from s42.loc (85-127-241-5.dynamic.xdsl-line.inode.at [85.127.241.5])
	by mx.google.com with ESMTPS id y2sm3142131fau.36.2010.08.04.13.12.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Aug 2010 13:12:11 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OgkJn-0008IH-Op; Wed, 04 Aug 2010 22:12:03 +0200
Date: Wed, 4 Aug 2010 22:12:03 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100804201203.GB6299@mx.loc>
References: <1280780382-11697-1-git-send-email-fransmeulenbroeks@gmail.com>
	<i38mr6$ng8$1@dough.gmane.org> <20100803235811.GC17391@denix.org>
	<20100804001040.GE17391@denix.org>
	<AANLkTi=QDw_sf4H8Kdt7L7nfNZ24bjVBJ4hdW6HPUupB@mail.gmail.com>
	<20100804165030.GG28187@mx.loc> <i3c7lf$mpg$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <i3c7lf$mpg$1@dough.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] 500+ recipes: remove do_stage
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
X-List-Received-Date: Wed, 04 Aug 2010 20:12:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 04, 2010 at 07:22:55PM +0200, Koen Kooi wrote:

>You mean like I did yesterday:
>http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=99f6333dd24a2a6eeeec0925a296906ee8145f92
>?

exactly. stash was playing tricks on me, sorry.


