Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1S11sd-0001cQ-CC
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Feb 2012 21:36:39 +0100
Received: by pbbrp12 with SMTP id rp12so953142pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2012 12:28:15 -0800 (PST)
Received-SPF: pass (google.com: domain of tom.rini@gmail.com designates
	10.68.194.65 as permitted sender) client-ip=10.68.194.65; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of tom.rini@gmail.com
	designates 10.68.194.65 as permitted sender)
	smtp.mail=tom.rini@gmail.com;
	dkim=pass header.i=tom.rini@gmail.com
Received: from mr.google.com ([10.68.194.65])
	by 10.68.194.65 with SMTP id hu1mr12105640pbc.75.1330115295297
	(num_hops = 1); Fri, 24 Feb 2012 12:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=sSZHHXf0F2biSUYGBMdNQZq7JYPxHiZMYyfZHRD3CGg=;
	b=kYnMSgoVu5hV8q0IRfq4yQzHtUTUOB54KExyxBG/2byK80pmjkHZDfMAGLOH5+aYXi
	1WaR+E8lSBJ+JoB6hCwW9ZTCFIWaZwFp61Y2slOezvsZU88srjrGirO6CuQXKF/VO6w0
	WkzPIHS6XdM5tlVFxYDb3VSVS1EppZTede3oQ=
Received: by 10.68.194.65 with SMTP id hu1mr10015991pbc.75.1330115295241;
	Fri, 24 Feb 2012 12:28:15 -0800 (PST)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id q1sm5189845pbq.68.2012.02.24.12.28.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 12:28:14 -0800 (PST)
Date: Fri, 24 Feb 2012 13:28:17 -0700
From: Tom Rini <tom.rini@gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <20120224202817.GC14969@bill-the-cat>
References: <cover.1330097955.git.sledz@dresearch-fe.de>
	<cec64cfd68283964f8b8310a09c98479f9df1aab.1330097955.git.sledz@dresearch-fe.de>
MIME-Version: 1.0
In-Reply-To: <cec64cfd68283964f8b8310a09c98479f9df1aab.1330097955.git.sledz@dresearch-fe.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance 7/7] ltrace: switch from 0.5.3-2 to 0.5.3-2.1
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
X-List-Received-Date: Fri, 24 Feb 2012 20:36:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 24, 2012 at 04:47:24PM +0100, Steffen Sledz wrote:

> Version 0.5.3-2 is no longer fetchable.

Same comment about snapshot.debian.org, thanks!

-- 
Tom


