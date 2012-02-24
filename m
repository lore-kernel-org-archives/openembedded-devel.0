Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1S11qq-0001Pg-TE
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Feb 2012 21:34:49 +0100
Received: by pbbrp12 with SMTP id rp12so951798pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2012 12:26:24 -0800 (PST)
Received-SPF: pass (google.com: domain of tom.rini@gmail.com designates
	10.68.220.4 as permitted sender) client-ip=10.68.220.4; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of tom.rini@gmail.com
	designates 10.68.220.4 as permitted sender)
	smtp.mail=tom.rini@gmail.com;
	dkim=pass header.i=tom.rini@gmail.com
Received: from mr.google.com ([10.68.220.4])
	by 10.68.220.4 with SMTP id ps4mr12221862pbc.32.1330115184945 (num_hops
	= 1); Fri, 24 Feb 2012 12:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=g+5wvpFEDz3uZp6PpSr0BL1Y9Z39lvuk1QsiCvk1mzE=;
	b=eGzcTUIRw27A9nXiX/wWNpgvY0SlyQF6hCZRft3H2CHkS4Bh19kdSOzpcnwysKWC5W
	lYt66Ob0rs9Tgh66DW9kEIX7atPna0k9BCikqlYZG3Ix9Q0v+TDT535rdT+TU638Cyl1
	uTmedYG5ZxtYkA9rQPn4oli+aEHczPZu5tgUE=
Received: by 10.68.220.4 with SMTP id ps4mr10074463pbc.32.1330115184887;
	Fri, 24 Feb 2012 12:26:24 -0800 (PST)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id r6sm5190805pbq.56.2012.02.24.12.26.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 12:26:23 -0800 (PST)
Date: Fri, 24 Feb 2012 13:26:26 -0700
From: Tom Rini <tom.rini@gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <20120224202626.GA14969@bill-the-cat>
References: <cover.1330097955.git.sledz@dresearch-fe.de>
	<562d0d44a950d86ec19d98621d837e4a227db73a.1330097955.git.sledz@dresearch-fe.de>
MIME-Version: 1.0
In-Reply-To: <562d0d44a950d86ec19d98621d837e4a227db73a.1330097955.git.sledz@dresearch-fe.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance 2/7] fakeroot-native: update to 1.14.5
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
X-List-Received-Date: Fri, 24 Feb 2012 20:34:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 24, 2012 at 04:47:19PM +0100, Steffen Sledz wrote:

> * version 1.9.6 is no longer fetchable

It _IS_ fetchable if you use a versioned string on snapshot.debian.org.
Please use this instead (and we have an example or two already, possibly
even for fakeroot I'd have sworn).

-- 
Tom


