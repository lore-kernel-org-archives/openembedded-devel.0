Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1S7W6Q-0002wf-Hq
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Mar 2012 19:05:48 +0100
Received: by yhjj56 with SMTP id j56so852403yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Mar 2012 10:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=cFqJ3445WRmLEgyOB0DT/Ln47pvn0vBzskvfLuVJZpA=;
	b=HEUEfzz1CpmRl/TLolNZckdeQUKSCYib8SkWh8OhyHqzP822dEFQ+3QSKhAmCkhJgM
	m+UvJ+aHSsP8Noe+s8y829TzSNWDulO5GP7MfM9R+6pSCWiv4nw9gueS0O/z2jJAUdFl
	w+SOyHNh7eKRtuojln3bfn4vmNb6LmpW0D8GkKMG2ClqjCSpGXppXzipPPj6mWVB2H+/
	KAOz8VplL3TvXPzbBAIwtLkyRyxd17HdpUfLUmSFYA3tACuDVaThHaZhBccFtVMIjpsj
	HR9OxyyUPOQEba15RAY36Ql33G9KDn7oFaoZXAGbtifA8byCGc+ryrYZ+FeYxLpPf0Tz
	c2Ww==
Received: by 10.68.236.73 with SMTP id us9mr7491779pbc.116.1331661417600;
	Tue, 13 Mar 2012 10:56:57 -0700 (PDT)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id k3sm267879pbd.17.2012.03.13.10.56.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Mar 2012 10:56:56 -0700 (PDT)
Date: Tue, 13 Mar 2012 10:57:04 -0700
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120313175704.GC12674@bill-the-cat>
References: <1331472732-28668-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1331472732-28668-2-git-send-email-fransmeulenbroeks@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1331472732-28668-2-git-send-email-fransmeulenbroeks@gmail.com>
Organization: Texas Instruments
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [2011.03-maintenance] [PATCH 2/2] libpng: moved from 1.2.44 to 1.2.48
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
X-List-Received-Date: Tue, 13 Mar 2012 18:05:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Mar 11, 2012 at 02:32:12PM +0100, Frans Meulenbroeks wrote:

> upstream does not retain old versions so moved to the latest
> version to make things buildable again
> 
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

This does exist at
http://snapshot.debian.org/archive/debian/20110301/pool/main/libp/libpng/libpng_1.2.44.orig.tar.bz2
so please rework the patch, thanks!

-- 
Tom


